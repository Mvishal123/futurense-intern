from flask import Blueprint, request, jsonify
from models import db, Car, Transaction
from flask_jwt_extended import jwt_required, get_jwt_identity
from utils.json_to_dict import to_dict_cars

car_bp = Blueprint('car', __name__)

@car_bp.route('/sell', methods=['POST'])
@jwt_required()
def sell_car():
    data = request.get_json()
    
    current_user = get_jwt_identity()
    make = data["make"]
    model = data['model']
    year = data['year']
    mileage = data['mileage']
    price = data['price']
    description = data['description']

    try:
        car = Car(user_id=current_user, make=make, model=model, year=year, mileage=mileage, price=price, description=description)
        db.session.add(car)
        db.session.commit()
        return jsonify({'message': 'Car added for sale successfully!', "car_id": car.id}), 201 
    except Exception as e:
        print("[ERROR]", e)
        return jsonify({'message': 'An error occurred while adding the car for sale'}), 500


@car_bp.route('/buy/<int:car_id>', methods=['POST'])
@jwt_required()
def buy_car(car_id):
    current_user = get_jwt_identity()

    car = Car.query.get(car_id)

    if not car:
        return jsonify({'message': 'Car not found'}), 404
    
    if car.user_id == current_user:
        return jsonify({'message': 'You cannot buy your own car 😂'}), 400

    transaction = Transaction(car_id=car.id, buyer_id=current_user, seller_id=car.user_id, amount=car.price)
    db.session.add(transaction)
    car.sold = True
    db.session.commit()

    return jsonify({'message': 'Car bought successfully!'}), 200


@car_bp.route('/<int:car_id>', methods=['DELETE'])
@jwt_required()
def delete_car(car_id):
  try:
    car_to_delete = Car.query.get(car_id)
    if car_to_delete is None:
      return jsonify({'error': 'Car not found'}), 404
    db.session.commit()
    return jsonify({'message': 'Car deleted successfully'}), 200

  except Exception as e:
    db.session.rollback()  # Rollback on error
    return jsonify({'error': str(e)}), 500


@car_bp.route('/', methods=['GET'])
def get_cars():
    cars = Car.query.all()
    cars_data = []

    for car in cars:
        if not car.sold:
            cars_data.append(to_dict_cars(car))

    return jsonify(cars_data), 200
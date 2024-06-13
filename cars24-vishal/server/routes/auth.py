from flask import Blueprint, request, jsonify
from models import db, bcrypt, User
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/me', methods=['GET'])
@jwt_required()
def me():
    user_id = get_jwt_identity()
    
    user = User.query.get(user_id)
    if not user:
        return jsonify({'message': 'User not found', "isUser": False}), 404
    
    return jsonify({"id": user.id, "email": user.email, "phone_number": user.phone_number, "isUser": True}), 200

@auth_bp.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data['username']
    email = data['email']
    password = data['password']
    
    print([username, email, password])
    
    user = User.query.filter_by(email=email).first()
    print(user)
    if user:
        return jsonify({'message': 'Email already registered. Please sign in.'}), 400
    
    password_hash = bcrypt.generate_password_hash(password).decode('utf-8')
    new_user = User(username=username, email=email, password=password_hash)
    
    db.session.add(new_user)
    db.session.commit()

    return jsonify({'message': 'User registered successfully!'}), 201

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    user = User.query.filter_by(email=email).first()
    
    if not user:
        return jsonify({'message': 'User does not exist'}), 404
    
    if bcrypt.check_password_hash(user.password, password):
        access_token = create_access_token(identity=user.id)
        return jsonify({'access_token': access_token}), 200
    
    return jsonify({'message': 'Invalid credentials'}), 401

def to_dict_cars(car):
    return {
        "id": car.id,
        "make": car.make,
        "model": car.model,
        "year": car.year,
        "mileage": car.mileage,
        "price": str(car.price),
        "description": car.description,
        "created_at": car.created_at,
        "updated_at": car.updated_at
    }
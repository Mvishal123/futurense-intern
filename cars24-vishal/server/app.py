from flask import Flask
from config import Config
from models import db, bcrypt, migrate
from flask_jwt_extended import JWTManager
from dotenv import load_dotenv

from routes.auth import auth_bp
from routes.car import car_bp

load_dotenv()

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
bcrypt.init_app(app)
migrate.init_app(app, db)
jwt = JWTManager(app)

@app.route('/')
def home():
    return 'Welcome to the Car Dealership API!'

app.register_blueprint(auth_bp, url_prefix='/auth')
app.register_blueprint(car_bp, url_prefix='/car')

if __name__ == '__main__':
    app.run(debug=True)

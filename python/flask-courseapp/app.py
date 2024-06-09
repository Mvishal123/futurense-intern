from flask import Flask, request, jsonify
from config import Config
from models import db, Course
from dotenv import load_dotenv
import os

load_dotenv()
print(os.getenv("DATABASE_URI"))
print(Config)
app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.before_request
def create_tables():

    app.before_request_funcs[None].remove(create_tables)

    db.create_all()

@app.route("/")
def home():
    return jsonify({'message': 'Welcome to our course catalog!'})


@app.route('/courses', methods=['POST'])
def create_course():
    data = request.get_json()
    new_course = Course(title=data['title'], teacher=data['teacher'], price=data['price'])
    db.session.add(new_course)
    db.session.commit()
    return jsonify({'message': 'Course created successfully!'}), 201

@app.route('/courses', methods=['GET'])
def get_courses():
    courses = Course.query.all()
    return jsonify([{'id': course.id, 'title': course.title, 'teacher': course.teacher, 'price': course.price} for course in courses])

@app.route('/courses/<int:id>', methods=['PUT'])
def update_course(id):
    data = request.get_json()
    course = Course.query.get_or_404(id)
    course.title = data.get('title', course.title)
    course.teacher = data.get('teacher', course.teacher)
    course.price = data.get('price', course.price)
    db.session.commit()
    return jsonify({'message': 'Course updated successfully!'})

@app.route('/courses/<int:id>', methods=['DELETE'])
def delete_course(id):
    course = Course.query.get_or_404(id)
    db.session.delete(course)
    db.session.commit()
    return jsonify({'message': 'Course deleted successfully!'})

if __name__ == '__main__':
    app.run(debug=True)

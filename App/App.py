from flask import Flask, jsonify, request

app = Flask(__name__)


todos = []
todo_id_counter = 1


@app.route('/')
def home():
    return jsonify({"message": "Welcome to the To-Do List API!"}), 200


@app.route('/todos', methods=['GET'])
def get_todos():
    return jsonify({"todos": todos}), 200


@app.route('/todos', methods=['POST'])
def create_todo():
    global todo_id_counter
    data = request.get_json()
    if 'task' not in data or not data['task']:
        return jsonify({"error": "Task field is required."}), 400

    new_todo = {
        "id": todo_id_counter,
        "task": data['task'],
        "completed": False
    }
    todos.append(new_todo)
    todo_id_counter += 1
    return jsonify(new_todo), 201


@app.route('/todos/<int:todo_id>', methods=['PUT'])
def update_todo(todo_id):
    data = request.get_json()
    for todo in todos:
        if todo['id'] == todo_id:
            if 'task' in data:
                todo['task'] = data['task']
            if 'completed' in data:
                todo['completed'] = data['completed']
            return jsonify(todo), 200
    return jsonify({"error": "To-Do item not found."}), 404


@app.route('/todos/<int:todo_id>', methods=['DELETE'])
def delete_todo(todo_id):
    global todos
    todos = [todo for todo in todos if todo['id'] != todo_id]
    return jsonify({"message": "To-Do item deleted."}), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=9000)

To-Do List API
This repository contains a To-Do List API built with Flask. The application allows users to create, retrieve, update, and delete (CRUD) tasks. It is containerized using Docker and supports deployment automation with CI/CD pipelines.

Features
RESTful API for managing to-do tasks.
Endpoints for:
Adding a new task.
Retrieving all tasks.
Updating a task.
Deleting a task.
Dockerized for easy setup and deployment.
CI/CD pipeline for automated integration and deployment.
Requirements
Python 3.9 or higher
Docker
Optional: Postman or curl for testing the API.
Getting Started
Run Locally
Clone the repository:


Copy code
git clone <repository-URL>
cd todo-api
Install dependencies:


Copy code
pip install -r requirements.txt
Run the application:


Copy code
python app.py
Access the API at http://127.0.0.1:9000.

Run with Docker
Build the Docker image:


Copy code
docker build -t todo-api .
Run the container:


Copy code
docker run -p 9000:9000 todo-api
Access the API at http://localhost:9000.

API Endpoints
Base URL:
http://localhost:9000

Method	Endpoint	Description	Example Payload
GET	/todos	Retrieve all tasks	N/A
POST	/todos	Create a new task	{"task": "Buy groceries"}
PUT	/todos/<id>	Update an existing task	{"task": "Buy milk", "completed": true}
DELETE	/todos/<id>	Delete a task	N/A
Example Usage
Create a New Task:
bash
Copy code
curl -X POST -H "Content-Type: application/json" \
-d '{"task": "Learn Docker"}' \
http://localhost:9000/todos
Retrieve All Tasks:
bash
Copy code
curl -X GET http://localhost:9000/todos
Update a Task:
bash
Copy code
curl -X PUT -H "Content-Type: application/json" \
-d '{"task": "Learn Flask", "completed": true}' \
http://localhost:9000/todos/1
Delete a Task:
bash
Copy code
curl -X DELETE http://localhost:9000/todos/1
CI/CD Pipeline
This project is configured for automated integration and deployment using Jenkins or GitHub Actions. The pipeline includes the following stages:

Build: Validates the application code.
Test: Ensures API endpoints work as expected.
Deploy: Deploys the Dockerized application.
Contributing
Contributions are welcome! Please create a new branch for any feature or bug fix, and submit a pull request.


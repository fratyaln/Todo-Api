FROM python:3.9-slim

WORKDIR /app

RUN pip install flask

COPY . . 

EXPOSE 9000

CMD [ "python", "App.py" ]


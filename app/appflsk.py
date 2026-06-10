from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)


def get_db_connection():
    conn = psycopg2.connect(
        dbname=os.environ.get("POSTGRES_DB", "mydb"),
        user=os.environ.get("POSTGRES_USER", "user"),
        password=os.environ.get("POSTGRES_PASSWORD", "password"),
        host=os.environ.get("DB_HOST", "localhost")
    )
    return conn


@app.route('/')
def index():
    conn = get_db_connection()
    conn.close()
    message = 'Hello, World! La conexión a la base de datos fue exitosa'
    return jsonify({'message': message})


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

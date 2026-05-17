from flask import Flask

app = Flask(__name__)

DB_PASSWORD = "ProdDatabasePassword@123"

@app.route('/')
def home():
    return "Enterprise DevSecOps Pipeline Running Successfully"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

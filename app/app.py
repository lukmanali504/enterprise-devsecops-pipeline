from flask import Flask, render_template

app = Flask(__name__)

tools = [
    "Semgrep",
    "Trivy",
    "Gitleaks",
    "Checkov",
    "Conftest",
    "OWASP ZAP",
    "HashiCorp Vault"
]

@app.route('/')
def home():
    return render_template('index.html', tools=tools)

@app.route('/health')
def health():
    return {
        "status": "secure",
        "pipeline": "active"
    }

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

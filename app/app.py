from flask import Flask, jsonify
import time

app = Flask(__name__)

start_time = time.time()

@app.route('/')
def home():
    return jsonify({
        "message": "Hello from Flask CI/CD App!",
        "author": "Ilsa Mukhtar",
        "github": "github.com/ilsamukhtar",
        "status": "running"
    })

@app.route('/health')
def health():
    uptime = round(time.time() - start_time, 2)
    return jsonify({
        "status": "healthy",
        "uptime_seconds": uptime,
        "version": "1.0.0"
    })

@app.route('/metrics')
def metrics():
    return "# HELP app_requests_total Total requests\n# TYPE app_requests_total counter\napp_requests_total 1\n", 200, {'Content-Type': 'text/plain'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)

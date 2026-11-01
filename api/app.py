
from flask import Flask, jsonify

# Create Flask application
app = Flask(__name__)

# API home route
@app.route("/", methods=["GET"])
def home():
    return jsonify({
        "message": "RP-Cloud Labs Tool-Session API is running"
    }), 200

# API health-check route
@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "service": "Tool-Session Service",
        "message": "API is running successfully"
    }), 200

# Start the application
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

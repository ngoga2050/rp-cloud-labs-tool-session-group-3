from flask import Flask, jsonify

# Create Flask application
app = Flask(__name__)

# API home route
@app.route("/", methods=["GET"])
def home():
    return jsonify({
        "message": "RP-Cloud Labs Tool-Session API is running"
    })

# Start the application
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

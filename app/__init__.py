import json

from flask import Flask

app = Flask(__name__)


@app.route("/")
def index():
    return json.dumps({"data": "Howdy"})


if __name__ == "__main__":
    app.run()

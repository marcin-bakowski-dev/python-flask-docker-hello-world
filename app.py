from flask import Flask
from version import VERSION

app = Flask(__name__)


@app.route("/")
def hello():
    return "Flask inside Docker!! %s" % VERSION


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')


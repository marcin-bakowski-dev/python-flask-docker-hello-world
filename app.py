from subprocess import check_output

from flask import Flask
from version import VERSION

app = Flask(__name__)
hostname = check_output('hostname').strip().decode("utf-8")


@app.route("/")
def hello():
    return "[%s] Flask inside Docker!! %s" % (hostname, VERSION)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')


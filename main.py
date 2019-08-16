from flask import Flask

print('Starting!')
app = Flask(__name__)


@app.route('/')
def index():
    print("Received")
    return "<h1>Hello World!</h1>"


if __name__ == '__main__':
    app.run(host = "0.0.0.0", debug = True)

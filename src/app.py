from flask import Flask

app = Flask(__name__)

@app.route("/")  # this sets the route to this page
def home():
	return "This is the main page <h1>NICE TO MEET YOU</h1>"

if __name__ == "__main__":
    app.run(debug=True)
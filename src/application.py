from flask import Flask

# EB looks for an 'application' callable by default.
application = Flask(__name__)

@application.route("/")  
def home():
	return "This is the main page <h1>NICE TO MEET YOU AGAIN</h1>"

if __name__ == "__main__":
  application.run(debug=True)
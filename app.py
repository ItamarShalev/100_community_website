from pathlib import Path

from flask import Flask, render_template

current_path = Path(__file__).parent
app_path = current_path / 'src' / 'app'


app = Flask(__name__, static_folder=str(app_path / 'static'), template_folder=str(app_path / 'templates'))

@app.route('/')
def hello_world():
    return render_template('index.html')

from flask import Flask, request
from analyzer import pitch_score
from tempfile import TemporaryFile

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!!!!!!!!!!'

@app.route('/score', methods=['POST'])
def score():
    example = None
    answer = None
    if request.form:
        example = request.form['idx']
        answer = request.form['data']
        date = request.form['newsUrl']
        if example is None:
            return 'example is null!!'
        if answer is None:
            return 'answer is null!!'
    else:
        return 'file is null!!'
    return pitch_score(example, answer, date, pitch_sample=50, time_sample=100)

if __name__=='__main__':
    app.run()
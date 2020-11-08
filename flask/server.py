from flask import Flask, request
from analyzer import pitch_score
from tempfile import TemporaryFile
from translate import NLP

app = Flask(__name__)
nlp = NLP()


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

@app.route('/scoreTranslate', methods=['POST'])
def compare_translate():
    
    original = request.form['original']
    user_answer = request.form['userAnswer']
    return nlp.compare(original, user_answer)


if __name__=='__main__':
    app.run()
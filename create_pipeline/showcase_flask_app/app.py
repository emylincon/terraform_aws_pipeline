from flask import Flask, render_template, url_for, redirect, abort

app = Flask(__name__)

members = 'Emeka', 'Kevin', 'Callum', 'Will'


@app.route('/')
def main_page ():
    return render_template('index.html')


@app.route('/<name>/')
def member(name):
    if name in members:
        return render_template("name.html", name=name)
    else:
        abort(404)


@app.errorhandler(404)
def not_found(error):
    return render_template('404.html', errors=[error]), 404


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5002)

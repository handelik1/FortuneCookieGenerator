from bottle import *
from random import *
import sqlite3

@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static/')

@route('/home')
def index():

    info = {'title': 'Fortune Cookie Generator'
            }
    return template('index.tpl', info)
	
@route('/fortunes')
def show_fortune():
	info = {'title': 'Fortune Cookie Generator'
            }
	db = sqlite3.connect('fortunes.db')
	cursor = db.cursor()
	cursor.execute("SELECT * from fortunes")
	length = len(cursor.fetchall())
	i = randint(1,length)
	c = db.cursor()
	c.execute("SELECT text FROM fortunes WHERE id = " + str(i))
	data = c.fetchall()
	c.close()
	return template('fortunes.tpl', info, rows=data)
	
if __name__ == '__main__':
	run(host = 'localhost', port = 8080, debug = True, reloader = 'True')
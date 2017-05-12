from bottle import *
from random import *
import sqlite3
from sqlalchemy import *
from sqlalchemy.orm import sessionmaker

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

	engine = create_engine('sqlite:///fortunes.db')
	conn = engine.connect()
	
	result = conn.execute("select id from fortunes order by id desc limit 1")
	for row in result:
		i = row[0]

	i = randint(1,i)
	i = str(i)
		
	res = conn.execute("select text from fortunes where id = " + i)
	
	for row in res:
		return template('fortunes.tpl', info, rows=row),
	conn.close()

	
if __name__ == '__main__':
	run(host = 'localhost', port = 8000, debug = True, reloader = 'True')
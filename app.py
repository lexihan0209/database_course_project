
from bottle import default_app, run, route, get, put, post, request, template,redirect

import sqlite3

@route('/')
def home():
    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor()
    c.execute('SELECT * from class')
    row = c.fetchall()
    if row:
        return template('home', students=row)
    return "Ack! We have encountered an error..."

@route('/new')
def new():

    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor()
    c.execute("UPDATE class set present = 0, notes = 'No report'")
    conn.commit()    
    c.execute('SELECT * from class')
    row = c.fetchall()
    if row:
        return template('new', students=row)
    return "Ack! We have encountered an error..."

@route('/show/<idnum>', method='POST')
def notes_submit(idnum):
    notes = request.forms.get('notes')
    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor()   
    update_notes = c.execute('UPDATE class set notes=? where id=?', [notes, idnum])
    conn.commit()   
    redirurl = "/show/" + str(idnum)
    redirect(redirurl)    

@route('/show/<idnum>')
def show(idnum):
    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor()   
    row = c.execute('SELECT * from class where id=?', [idnum]).fetchone()

    if int(idnum) >= 1:
        prevlink = int(idnum) - 1

    countquery = c.execute('SELECT count(*) from class').fetchone()
    count = countquery[0]
    print (count)
    
    if int(idnum) == count:
        nextlink = "done"
    else:
        nextlink = int(idnum) + 1
    
    if row:
        return template('showitem', students=row, prevlink=prevlink, nextlink=nextlink)
    return HTTPError(404, "Page not found")


def toggle(numid):
    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor() 
    statusstr = 'SELECT present from class where id=?' 
    statusquery = c.execute(statusstr, [numid]).fetchone()
    status = statusquery
    print (status)

    if status[0] == 0:
        updatestr = 'UPDATE class SET present=1 where id=?'
    elif status[0] == 1:
        updatestr = 'UPDATE class SET present=0 where id=?' 
    row = c.execute(updatestr, [numid])
    conn.commit()
    return


@route('/present/<idnum>')
def present(idnum):
    toggle(idnum)   
    redirurl = "/show/" + str(idnum)
    redirect(redirurl)
   

@route('/show/done')
def all_done():
    conn = sqlite3.connect('rollcall.db')
    c = conn.cursor()    
    student_present = c.execute('SELECT * from class where present=1').fetchall()
    student_absent = c.execute('SELECT * from class where present=0').fetchall()
    student_absent_without_notes = c.execute("SELECT * from class where present=0 and notes = 'No report'").fetchall()
    countquery = c.execute('SELECT count(*) from class').fetchone()
    count = countquery[0]
    present_count = len(student_present)
    absent_count = len(student_absent)
    absent_without = len(student_absent_without_notes)
    absent_with = absent_count - absent_without
    percentage = float(present_count) / float(count)
    percentage = percentage * 100
    percentage = int(percentage)
    

    return template('done', percentage=percentage, present=present_count, absent=absent_count, absent_with=absent_with,absent_without=absent_without)    


if __name__ == "__main__":
    run(host='localhost', port=8080, reloader=True)
else:
    application = default_app()



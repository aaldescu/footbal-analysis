import sqlite3

def create_db():
    conn = sqlite3.connect('football_tournament.db')
    cursor = conn.cursor()
    
    with open('create_and_populate_db.sql', 'r') as sql_file:
        sql_script = sql_file.read()
    
    cursor.executescript(sql_script)
    
    conn.commit()
    conn.close()

create_db()
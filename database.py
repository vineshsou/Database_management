import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="dbms_project"
)
c = mydb.cursor()

def add_data_artist(artist_name,genre,label_name):
    c.execute('INSERT INTO artist (artist_name,genre,label_name) VALUES (%s,%s,%s);',
              (artist_name,genre,label_name))
    mydb.commit()


def add_data_song(song_name,features,song_length,artist_name,prod_name,album_name):
    c.execute('INSERT INTO song (song_name,feature,song_length,artist_name,prod_name,album_name) VALUES (%s,%s,%s,%s,%s,%s);',
              (song_name,features,song_length,artist_name,prod_name,album_name))
    mydb.commit()


def add_data_distributor(distributor_name,format,website,label_name):
    c.execute('INSERT INTO distributor (distributor_name,format,website,label_name) VALUES (%s,%s,%s,%s);',
              (distributor_name,format,website,label_name))
    mydb.commit()



def view_all_data_artist():
    c.execute('SELECT * FROM artist')
    data = c.fetchall()
    return data

def view_all_data_song():
    c.execute('SELECT * FROM song')
    data = c.fetchall()
    return data

def view_all_data_distributors():
    c.execute('SELECT * FROM distributor')
    data = c.fetchall()
    return data


def view_all_data_album():
    c.execute('SELECT * FROM album')
    data = c.fetchall()
    return data


def view_only_artist_names():
    c.execute('SELECT artist_name FROM artist')
    data = c.fetchall()
    return data

def view_only_song_names():
    c.execute('SELECT song_name FROM song')
    data = c.fetchall()
    return data

def view_only_distributor_names():
    c.execute('SELECT distributor_name FROM distributor')
    data = c.fetchall()
    return data


def get_details_artist(artist_name):
    c.execute('SELECT * FROM artist WHERE artist_name="{}"'.format(artist_name))
    data = c.fetchall()
    return data

def get_details_song(song_name):
    c.execute('SELECT * FROM song WHERE song_name="{}"'.format(song_name))
    data = c.fetchall()
    return data

def get_details_distributor(distributor_name):
    c.execute('SELECT * FROM distributor WHERE distributor_name="{}"'.format(distributor_name))
    data = c.fetchall()
    return data


def edit_details_artist(new_artist_name,new_genre,label_name_update,artist_name,genre,label_name):
    c.execute("UPDATE artist SET artist_name=%s,genre=%s,label_name=%s WHERE artist_name=%s and genre=%s and label_name=%s", (new_artist_name,new_genre,label_name_update,artist_name,genre,label_name) )
    mydb.commit()
    c.execute("select * from artist")
    data = c.fetchall()
    return data

def edit_details_song(new_song_name,new_feature,new_song_length,new_artist_name1,prod_name_update,album_name_update,song_name,feature,song_length,artist_name,prod_name,album_name):
    c.execute("UPDATE song SET song_name=%s,feature=%s,song_length=%s,artist_name=%s,prod_name=%s,album_name=%s WHERE song_name=%s and feature=%s and song_length=%s and artist_name=%s and prod_name=%s and album_name=%s", (new_song_name,new_feature,new_song_length,new_artist_name1,prod_name_update,album_name_update,song_name,feature,song_length,artist_name,prod_name,album_name) )
    mydb.commit()
    c.execute("select * from song")
    data = c.fetchall()
    return data

def edit_details_distributor(new_distributor_name,new_format,new_website,new_label_name,distributor_name,format,website,label_name):
    c.execute("UPDATE distributor SET distributor_name=%s,format=%s,website=%s,label_name=%s WHERE distributor_name=%s and format=%s and website=%s and label_name=%s", (new_distributor_name,new_format,new_website,new_label_name,distributor_name,format,website,label_name) )
    mydb.commit()
    c.execute("select * from distributor")
    data = c.fetchall()
    return data


def delete_data_distributor(distributor_name):
    c.execute('DELETE FROM distributor WHERE distributor_name="{}"'.format(distributor_name))
    mydb.commit()

def join_operator_fun():
    c.execute('select artist.artist_name,artist.genre,producer.prod_name FROM artist RIGHT JOIN producer on artist.label_name=producer.label_name')   
    data = c.fetchall()
    return data

def aggregate_operator_fun():
    c.execute('select count(*) from song where song_length>300;')   
    data = c.fetchall()
    return data

def set_operator_fun():
    c.execute('SELECT ALBUM_GENRE,artist_name FROM ALBUM UNION SELECT GENRE,artist_name FROM ARTIST;')   
    data = c.fetchall()
    return data

def stored_function():
    c.execute('select song_name,howlong(song_length) from song order by song_length ')   
    data = c.fetchall()
    return data
    
def stored_funct(album_name):
    total = c.execute('no_of_dist("{}")'.format(album_name))
    return total
    
    


def executor(raw_code):
    c.execute(raw_code)
    return c.fetchall()





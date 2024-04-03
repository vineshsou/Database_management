import streamlit as st
from database import *


def create_artist():
    col1, col2 = st.columns(2)
    with col1:
        artist_name = st.text_input("artist_name")
        genre = st.text_input("genre")
        
    with col2:
        label_name = st.text_input("label:")

    if st.button("Add_artist"):
        add_data_artist(artist_name,genre,label_name)
        st.success("Successfully added artist: {}".format(artist_name))

def create_song():
    col1, col2= st.columns(2)  
    with col1:
        song_name = st.text_input("song_name")
        features = st.text_input("features")
        song_length=st.text_input("song_length")
    with col2:
        artist_name = st.text_input("artist_name:")    
        prod_name = st.text_input("prod_name:")    
        album_name = st.text_input("album_name:")    

    if st.button("Add_song"):
        add_data_song(song_name,features,song_length,artist_name,prod_name,album_name)
        st.success("Successfully added song: {}".format(song_name))    

def create_distributor():
    col1, col2= st.columns(2)  
    with col1:
        distributor_name = st.text_input("distributopr_name")
        format = st.text_input("format")  
    with col2:
        website = st.text_input("website:")    
        label_name = st.text_input("label_name:")    
         

    if st.button("Add_distributor"):
        add_data_distributor(distributor_name,format,website,label_name)
        st.success("Successfully added song: {}".format(distributor_name))    



              
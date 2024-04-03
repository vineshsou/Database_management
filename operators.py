import streamlit as st
import pandas as pd
from database import *

def operations_join():
    st.subheader("Showcase the artist-producer collaborations of the same label and the genre of the music they have worked on.")
    if st.button("View Result"):
        result = join_operator_fun()
        df = pd.DataFrame(result, columns=['Artist_name', 'genre','prod_name'])
        st.dataframe(df)

def operations_agg():
    st.subheader("Show the number of songs with song length greater than 300 seconds")
    if st.button("View Result"):
        result = aggregate_operator_fun()
        df = pd.DataFrame(result, columns=['count(*)'])
        st.dataframe(df)
        

def operations_set():
    st.subheader("Show all the artist’s genres of the albums they have worked on ")
    if st.button("View Result"):
        result = set_operator_fun()
        df = pd.DataFrame(result, columns=['album_genre','artist_name'])
        st.dataframe(df)

def stored_fun():
     st.subheader("Create a stored function for classifying a song as “short”,”medium” and “long”: ")
     if st.button("View Result"):
        result = stored_function()
        df = pd.DataFrame(result, columns=['song_name','song_length'])
        st.dataframe(df)

def stored_random():
    st.subheader("Create a stored function for classifying a song as “short”,”medium” and “long”: ")

    if st.button("View Result"):
        result = stored_funct('malibu')
#        df = pd.DataFrame(result, columns=['song_name','song_length'])
 #       st.dataframe(df)
        st.success(result)

        





import datetime

import pandas as pd
import streamlit as st
from database import *


def update_artist():
    result = view_all_data_artist()
    # st.write(result)
    df = pd.DataFrame(result, columns=['artist_name','genre','label_name'])
    with st.expander("Current artists"):
        st.dataframe(df)
    list_of_artists = [i[0] for i in view_only_artist_names()]
    selected_artist = st.selectbox("Train to Edit", list_of_artists)
    selected_result = get_details_artist(selected_artist)
    # st.write(selected_result)
    if selected_result:
        artist_name= selected_result[0][0]
        genre = selected_result[0][1]
        label_name = selected_result[0][2]
       

        # Layout of Create

        col1, col2 = st.columns(2)
        with col1:
            new_artist_name = st.text_input("artist_name:", artist_name)
            new_genre = st.text_input("genre:", genre)
        with col2:
            label_name_update = st.text_input("Music label:",label_name)
            
        if st.button("Update artist"):
            edit_details_artist(new_artist_name,new_genre,label_name_update,artist_name,genre,label_name)
            st.success("Successfully updated:: {} to ::{}".format(artist_name, new_artist_name))

    result2 = view_all_data_artist()
    df2 = pd.DataFrame(result2, columns=['artist_name','genre','label_name'])
    with st.expander("Updated data"):
        st.dataframe(df2)

def update_song():
    result=view_all_data_song()
    df = pd.DataFrame(result, columns=['song_name','feature','song_length','artist_name','prod_name','album_name'])
    with st.expander("Current songs"):
        st.dataframe(df)
    list_of_songs = [i[0] for i in view_only_song_names()]
    selected_song = st.selectbox("Train to Edit", list_of_songs)
    selected_result1 = get_details_song(selected_song)
    # st.write(selected_result)
    if selected_result1:
        song_name= selected_result1[0][0]
        feature = selected_result1[0][1]
        song_length = selected_result1[0][2]
        artist_name = selected_result1[0][3]
        prod_name = selected_result1[0][4]
        album_name = selected_result1[0][5]

        col3, col4 = st.columns(2)
        with col3:
            new_song_name = st.text_input("song_name:", song_name)
            new_feature = st.text_input("feature:", feature)
            new_song_length = st.text_input("song_length:", song_length)
        with col4:
            new_artist_name1 = st.text_input("artist_name :",artist_name)
            prod_name_update = st.text_input("prod_name:",prod_name)
            album_name_update = st.text_input("album_name:",album_name)
            
        if st.button("update song"):
            edit_details_song(new_song_name,new_feature,new_song_length,new_artist_name1,prod_name_update,album_name_update,song_name,feature,song_length,artist_name,prod_name,album_name)
            st.success("Successfully updated:: {} to ::{}".format(song_name, new_song_name))   

    result2 = view_all_data_song()
    df2 = pd.DataFrame(result2, columns=['song_name','feature','song_length','artist_name','prod_name','album_name'])
    with st.expander("Updated data"):
        st.dataframe(df2)

def update_distributor():
    result=view_all_data_distributors()
    df = pd.DataFrame(result, columns=['distributor_name','format','website','label_name'])
    with st.expander("Current distributors"):
        st.dataframe(df)
    list_of_songs = [i[0] for i in view_only_distributor_names()]
    selected_song = st.selectbox("Train to Edit", list_of_songs)
    selected_result1 = get_details_distributor(selected_song)
    # st.write(selected_result)
    if selected_result1:
        distributor_name= selected_result1[0][0]
        format = selected_result1[0][1]
        website = selected_result1[0][2]
        label_name = selected_result1[0][3]


        col3, col4 = st.columns(2)
        with col3:
            new_distributor_name = st.text_input("distributor_name:", distributor_name)
            new_format = st.text_input("format:", format)
            
        with col4:
            new_website = st.text_input("website :",website)
            new_label_name = st.text_input("label_name:",label_name)
           
            
        if st.button("update distributor"):
            edit_details_distributor(new_distributor_name,new_format,new_website,new_label_name,distributor_name,format,website,label_name)
            st.success("Successfully updated:: {} to ::{}".format(distributor_name, new_distributor_name))   

    result2 = view_all_data_distributors()
    df2 = pd.DataFrame(result2, columns=['distributor_name','format','website','label_name'])
    with st.expander("Updated data"):
        st.dataframe(df2)        
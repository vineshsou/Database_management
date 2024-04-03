import pandas as pd
import streamlit as st
import plotly.express as px
from database import *


def read_artist():
    result = view_all_data_artist()
    # st.write(result)
    df = pd.DataFrame(result, columns=['artist_name','genre','label_name'])
    with st.expander("View all Artist"):
        st.dataframe(df)

def read_song():
    result = view_all_data_song()
    # st.write(result)
    df = pd.DataFrame(result, columns=['song_name','feature','song_length','artist_name','prod_name','album_name'])
    with st.expander("View all songs"):
        st.dataframe(df)
   
def read_distributor():
    result = view_all_data_distributors()
    # st.write(result)
    df = pd.DataFrame(result, columns=['distributor_name','format','website','label_name'])
    with st.expander("View all distributors"):
        st.dataframe(df)
   
   
import pandas as pd
import streamlit as st
from database import *


def delete_distributor():
    result = view_all_data_distributors()
    df = pd.DataFrame(result, columns=['distributor_name','format','website','label_name'])
    with st.expander("Current data"):
        st.dataframe(df)

    list_of_artists = [i[0] for i in view_only_distributor_names()]
    selected_artist = st.selectbox("distr to Delete", list_of_artists)
    st.warning("Do you want to delete ::{}".format(selected_artist))
    if st.button("Delete distributor"):
        delete_data_distributor(selected_artist)
        st.success("Distributor has been deleted successfully")
    new_result = view_all_data_distributors()
    df2 = pd.DataFrame(new_result, columns=['distributor_name','format','website','label_name'])
    with st.expander("Updated data"):
        st.dataframe(df2)
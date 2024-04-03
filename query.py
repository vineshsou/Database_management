import streamlit as st
import pandas as pd
from database import *


def query():

    col1, col2 = st.columns(2)

    with col1:
        with st.form(key='query_form'):
            raw_code = st.text_area("SQL Code Here")
            submit_code = st.form_submit_button("Execute")

    with col2:
        if submit_code:
            st.info("Query Submitted")
            st.code(raw_code)

            query_results = executor(raw_code)
            with st.expander("Results"):
                st.write(query_results)

            with st.expander("Pretty Table"):
                query_df = pd.DataFrame(query_results)
                st.dataframe(query_df)


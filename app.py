import streamlit as st
import mysql.connector

from create import *
from database import *
from delete import *
from read import *
from update import *
from operators import *
from query import *

def main():
    st.title("RECORDS LABEL MANAGEMENT")
    menu = ["Add Artist","View artist","Update artist","Add Song","View songs","update song","add distributor","view distributors","delete distributor","Update distributor","join operations","aggregate operations","set operations","Query_runner","stored_function","stored_proced"]
    choice = st.sidebar.selectbox("Menu", menu)

    
    if choice == "Add Artist":
        st.subheader("Enter artist details:")
        create_artist()

    elif choice=="Add Song":
        st.subheader("Enter song details:")
        create_song()


    elif choice == "View artist":
        st.subheader("View artist Details:")
        read_artist()


    elif choice == "View songs":
        st.subheader("View songs Details:")
        read_song()

    elif choice == "Update artist":
        st.subheader("Edited artist Details:")
        update_artist()


    elif choice == "update song":
        st.subheader("Edited song Details:")
        update_song()

    elif choice == "add distributor":
        st.subheader("Add a distributor:")
        create_distributor()

    elif choice == "delete distributor":
        st.subheader("Delete a distributor:")
        delete_distributor()

    elif choice == "view distributors":
        st.subheader("Show distributor:")
        read_distributor()

    elif choice == "Update distributor":
        st.subheader("Update distributor:")
        update_distributor()

  
    elif choice == "join operations":
        st.subheader("join operator :")
        operations_join()

    elif choice == "aggregate operations":
        st.subheader("aggregator operator :")
        operations_agg()

    elif choice == "set operations":
        st.subheader("set operator :")
        operations_set()
    
    elif choice == "Query_runner":
        st.subheader(" Run your query :")
        query()

    elif choice == "stored_function":
        st.subheader("stored function :")
        stored_fun()

    elif choice == "stored_proced":
        st.subheader("stored function :")
        stored_random()

 





  
    else:
        st.subheader("About Train")


if __name__ == '__main__':
    main()


    
        
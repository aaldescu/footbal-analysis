import streamlit as st
import pandas as pd
import sqlite3

def load_data(query):
    conn = sqlite3.connect('football_tournament.db')
    df = pd.read_sql(query, conn)
    conn.close()
    return df

def view_tables():
    st.title("View Tables")
    st.write("View all the data from tables")

    df_teams = load_data("SELECT * FROM Teams")
    df_players = load_data("SELECT * FROM Players")
    df_matches = load_data("SELECT * FROM Matches")
    df_player_stats = load_data("SELECT * FROM Player_Stats")
    df_team_stats = load_data("SELECT * FROM Team_Stats")

    st.write("## Teams")
    st.dataframe(df_teams)

    st.write("## Players")
    st.dataframe(df_players)

    st.write("## Matches")
    st.dataframe(df_matches)

    st.write("## Player Stats")
    st.dataframe(df_player_stats)

    st.write("## Team Stats")
    st.dataframe(df_team_stats)

if __name__ == "__main__":
    view_tables()
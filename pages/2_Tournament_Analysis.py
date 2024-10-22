import streamlit as st
import pandas as pd
import sqlite3
import networkx as nx
import matplotlib.pyplot as plt

def load_data(query):
    conn = sqlite3.connect('football_tournament.db')
    df = pd.read_sql(query, conn)
    conn.close()
    return df

def tournament_analysis():
    st.title("Tournament Analysis")

    # Load data from SQLite
    df_matches = load_data("SELECT * FROM Matches")
    df_teams = load_data("SELECT * FROM Teams")

    # Create a directed graph
    G = nx.DiGraph()

    # Create a dictionary to map team_id to team_name
    team_names = {row['team_id']: row['team_name'] for _, row in df_teams.iterrows()}

    # Add edges based on the matches
    for _, row in df_matches.iterrows():
        team1 = team_names[row['team1_id']]
        team2 = team_names[row['team2_id']]
        winner = team1 if row['team1_score'] > row['team2_score'] else team2

        G.add_edge(winner, team1)
        G.add_edge(winner, team2)

    # Custom layout for inverted pyramid
    pos = nx.multipartite_layout(G, subset_key=pos_hierarchy)

    plt.figure(figsize=(12, 8))
    nx.draw(G, pos, with_labels=True, node_size=3000, node_color='lightgreen', font_size=10, font_weight='bold', arrowsize=20)
    st.pyplot(plt)

def pos_hierarchy(node):
    """ This function assigns levels based on the number of ancestors (distance from the root, which is the winner). """
    if node in nx.ancestors(G, winner):
        return abs(nx.shortest_path_length(G, source=node, target=winner) - max_depth)
    return 0

if __name__ == "__main__":
    st.set_page_config(layout="wide")
    tournament_analysis()
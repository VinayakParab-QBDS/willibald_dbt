import matplotlib.pyplot as plt
import networkx as nx

# Define all hubs, satellites, and links
nodes = {
    "HUB_KUNDE": "hub",
    "SAT_KUNDE": "sat",
    "HUB_PRODUKT": "hub",
    "SAT_PRODUKT": "sat",
    "HUB_VEREINSPARTNER": "hub",
    "SAT_VEREINSPARTNER": "sat",
    "HUB_BESTELLUNG": "hub",
    "SAT_BESTELLUNG": "sat",
    "HUB_LIEFERADRESSE": "hub",
    "SAT_LIEFERADRESSE": "sat",
    "HUB_LIEFERUNG": "hub",
    "SAT_LIEFERUNG": "sat",
    "HUB_LIEFERDIENST": "hub",
    "SAT_LIEFERDIENST": "sat",
    "HUB_KATEGORIE": "hub",
    "SAT_KATEGORIE": "sat",
    "LINK_BESTELLUNG_KUNDE": "link",
    "LINK_BESTELLUNG_PRODUKT": "link",
    "LINK_BESTELLUNG_VEREINSPARTNER": "link",
    "LINK_BESTELLUNG_LIEFERADRESSE": "link",
    "LINK_POSITION_PRODUKT": "link",
    "LINK_LIEFERUNG_POSITION": "link",
    "LINK_LIEFERUNG_LIEFERDIENST": "link",
    "LINK_PRODUKT_KATEGORIE": "link",
}

# Relationships between hubs, links, and satellites
edges = [
    ("HUB_KUNDE", "SAT_KUNDE"),
    ("HUB_PRODUKT", "SAT_PRODUKT"),
    ("HUB_VEREINSPARTNER", "SAT_VEREINSPARTNER"),
    ("HUB_BESTELLUNG", "SAT_BESTELLUNG"),
    ("HUB_LIEFERADRESSE", "SAT_LIEFERADRESSE"),
    ("HUB_LIEFERUNG", "SAT_LIEFERUNG"),
    ("HUB_LIEFERDIENST", "SAT_LIEFERDIENST"),
    ("HUB_KATEGORIE", "SAT_KATEGORIE"),
    ("HUB_BESTELLUNG", "LINK_BESTELLUNG_KUNDE"),
    ("HUB_KUNDE", "LINK_BESTELLUNG_KUNDE"),
    ("HUB_BESTELLUNG", "LINK_BESTELLUNG_PRODUKT"),
    ("HUB_PRODUKT", "LINK_BESTELLUNG_PRODUKT"),
    ("HUB_BESTELLUNG", "LINK_BESTELLUNG_VEREINSPARTNER"),
    ("HUB_VEREINSPARTNER", "LINK_BESTELLUNG_VEREINSPARTNER"),
    ("HUB_BESTELLUNG", "LINK_BESTELLUNG_LIEFERADRESSE"),
    ("HUB_LIEFERADRESSE", "LINK_BESTELLUNG_LIEFERADRESSE"),
    ("HUB_PRODUKT", "LINK_POSITION_PRODUKT"),
    ("HUB_BESTELLUNG", "LINK_POSITION_PRODUKT"),
    ("HUB_LIEFERUNG", "LINK_LIEFERUNG_POSITION"),
    ("HUB_BESTELLUNG", "LINK_LIEFERUNG_POSITION"),
    ("HUB_PRODUKT", "LINK_LIEFERUNG_POSITION"),
    ("HUB_LIEFERUNG", "LINK_LIEFERUNG_LIEFERDIENST"),
    ("HUB_LIEFERDIENST", "LINK_LIEFERUNG_LIEFERDIENST"),
    ("HUB_PRODUKT", "LINK_PRODUKT_KATEGORIE"),
    ("HUB_KATEGORIE", "LINK_PRODUKT_KATEGORIE"),
]

# Build graph
G = nx.Graph()
for node, ntype in nodes.items():
    G.add_node(node, ntype=ntype)
G.add_edges_from(edges)

# Define colors
color_map = []
for node in G:
    if nodes[node] == "hub":
        color_map.append("skyblue")
    elif nodes[node] == "sat":
        color_map.append("lightgreen")
    else:
        color_map.append("lightcoral")

# Plot with Matplotlib
plt.figure(figsize=(16, 12))
pos = nx.spring_layout(G, seed=42, k=0.6)  # Layout
nx.draw(G, pos, with_labels=True, node_color=color_map, node_size=2000, font_size=8, font_weight="bold", edge_color="gray")
plt.title("Full Data Vault 2.0 Model (Hubs, Links, Satellites)", fontsize=14)
plt.show()

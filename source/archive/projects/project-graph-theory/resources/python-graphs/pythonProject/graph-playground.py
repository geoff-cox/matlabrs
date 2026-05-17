import networkx as nx
import matplotlib.pyplot as plt


# Function to plot and visualize the graph
def plot_graph(edges, node_labels=None, title="Graph"):
    # Create a graph with edges
    G = nx.Graph()
    G.add_edges_from(edges)

    # Draw the graph
    plt.figure(figsize=(6, 4))
    pos = nx.spring_layout(G, k=1)  # Layout for a visually appealing arrangement
    nx.draw(G, pos, with_labels=True, node_size=1200, node_color="lightblue", font_size=18, font_weight="bold",
            edge_color="gray")

    # If custom node labels are provided, use them
    if node_labels:
        nx.draw_networkx_labels(G, pos, labels=node_labels, font_size=12)

    plt.title(title)
    plt.show()

    # Adjusting the layout to make disconnected components appear closer together.
    # We'll use a spring layout with customized parameters to draw the components closer in the visualization.


# Plotting with customized layout for closer proximity between disconnected components
def plot_graph_close(edges, title="Graph"):
    """
    Plot a graph with disconnected components closer together using a custom layout.
    """
    G = nx.Graph()
    G.add_edges_from(edges)

    # Draw the graph with a spring layout, increasing the "k" parameter to reduce spacing between components.
    plt.figure(figsize=(6, 4))
    pos = nx.spring_layout(G, k=0.5, seed=42)  # Reduced "k" for tighter layout
    nx.draw(G, pos, with_labels=True, node_size=700, node_color="lightblue", font_size=12, font_weight="bold",
            edge_color="gray")

    plt.title(title)
    plt.show()


# Define various tree structures and their corresponding edges

# # Simple Tree
# simple_tree_edges = [(1, 2), (2, 3), (3, 4)]
# plot_graph(simple_tree_edges, title="Simple Tree (Line)")
#
# # Binary Tree
# binary_tree_edges = [(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7)]
# plot_graph(binary_tree_edges, title="Binary Tree")
#
# # Star Tree
# star_tree_edges = [(1, 2), (1, 3), (1, 4), (1, 5), (1, 6)]
# plot_graph(star_tree_edges, title="Star Tree")
#
# # Unbalanced Tree
# unbalanced_tree_edges = [(1, 2), (1, 3), (3, 4), (4, 5)]
# plot_graph(unbalanced_tree_edges, title="Unbalanced Tree")

# Creating examples of non-connected graphs with cycles for visualization.

# Non-connected Graph with a Simple Cycle in Each Component
non_connected_with_simple_cycles_edges = [(1, 2), (2, 3), (3, 1),  # Cycle in component 1
                                          (4, 5), (5, 6), (6, 4), (2, 1)]  # Cycle in component 2

# Non-connected Graph with a Cycle and a Line Component
non_connected_cycle_and_line_edges = [(1, 2), (2, 3), (3, 1),  # Cycle in component 1
                                      (4, 5), (5, 6)]  # Line structure in component 2

# Non-connected Graph with Multiple Cycles in One Component and Isolated Node in Another
non_connected_with_multiple_cycles_edges = [(1, 2), (2, 3), (3, 1), (3, 4), (4, 5), (5, 3),  # Cycles in component 1
                                            (6, 7), (7, 8), (8, 6),  # Cycle in component 2
                                            (9, 1)]  # Isolated node as component 3

# Plot each non-connected graph with specific properties
# Non-connected Graph with a Simple Cycle in Each Component
plot_graph(non_connected_with_simple_cycles_edges, title="Non-Connected Graph with Simple Cycles")

# Non-connected Graph with a Cycle and a Line Component
plot_graph(non_connected_cycle_and_line_edges, title="Non-Connected Graph with Cycle and Line Component")

# Non-connected Graph with Multiple Cycles and an Isolated Node
plot_graph(non_connected_with_multiple_cycles_edges, title="Non-Connected Graph with Multiple Cycles and Isolated Node")

# Adjusting the last example by removing the isolated node since NetworkX requires edges in pairs.
# I'll use nodes that are disconnected from others instead of adding an isolated node directly.

# Non-connected Graph with Multiple Cycles in One Component and a Single Node Component
# Adjusted by removing the isolated node as a standalone element.
non_connected_with_multiple_cycles_edges = [(1, 2), (2, 3), (3, 1), (3, 4), (4, 5), (5, 3),  # Cycles in component 1
                                            (6, 7), (7, 8), (8, 6)]  # Cycle in component 2

# Plot each of the previously defined non-connected graph examples, now fixed for compatibility.
# Non-connected Graph with Multiple Cycles and Disconnected Components (adjusted)
plot_graph(non_connected_with_multiple_cycles_edges, title="Non-Connected Graph with Multiple Cycles")

# Creating a more complex disconnected graph with multiple components, each containing cycles and various structures.

# Complex Disconnected Graph:
# - Component 1: Contains multiple cycles and branching connections.
# - Component 2: A cycle combined with additional nodes branching off.
# - Component 3: Smaller cycle with an additional node.
# - Component 4: A line component to add diversity to the graph.

complex_disconnected_graph_edges = [
    # Component 1: Multiple cycles and branching
    (1, 2), (2, 3), (3, 1), (3, 4), (4, 5), (5, 6), (6, 3), (5, 7),

    # Component 2: Cycle with additional branches
    (8, 9), (9, 10), (10, 8), (10, 11), (11, 12), (11, 13),

    # Component 3: Small cycle with an extra node
    (14, 15), (15, 16), (16, 14), (16, 17),

    # Component 4: Line component
    (18, 19), (19, 20)
]

# Plot the more complex disconnected graph
plot_graph_close(complex_disconnected_graph_edges,
                 title="Complex Disconnected Graph with Multiple Cycles and Structures")

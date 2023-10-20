import networkx as nx
import matplotlib.pyplot as plt
import numpy as np
from itertools import combinations
import time

n = 30
G=nx.erdos_renyi_graph(n,0.25)
nx.draw_networkx(G, with_labels=True)
plt.show()

vertices = G.nodes()
adj_matrix = nx.to_numpy_matrix(G, dtype=int)
k = 5
clique = list(combinations(vertices, k))

def separate(T,i):
    Tplus = [nodes for nodes in T if i in nodes]
    Tminus = [nodes for nodes in T if i not in nodes]
    return Tplus, Tminus

def merge(T1, T2):
    T_merge = T1 + T2
    return T_merge

def find_k_clique(T, n):
    for i in range(0, n-1):
        for j in range(i+1, n):
            T_plus, T_minus = separate(T, i)
            T_plus_plus, T_plus_minus = separate(T_plus, j)
            T = merge(T_minus, T_plus_minus)
            if adj_matrix[i, j]:
                T = merge(T, T_plus_plus)
        return T

start = time.time()
clique = find_k_clique(clique, n)
end = time.time()
print(clique)


print(end-start)

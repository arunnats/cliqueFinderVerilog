package CliqueFinder.CliqueFinder;
import java.util.*;

public class CliqueFinder {

    // A helper method to check if a set of vertices forms a clique
    public static boolean isClique(boolean[][] graph, Set<Integer> vertices) {
        for (int u : vertices) {
            for (int v : vertices) {
                if (u != v && !graph[u][v]) { // if any pair of vertices is not adjacent, return false
                    return false;
                }
            }
        }
        return true; // otherwise, return true
    }

    // A method to find all cliques of size k in a graph
    public static List<Set<Integer>> findCliques(boolean[][] graph, int k) {
        List<Set<Integer>> cliques = new ArrayList<>(); // a list to store the cliques
        int n = graph.length; // the number of vertices in the graph
        Set<Integer> candidates = new HashSet<>(); // a set to store the candidate vertices
        for (int i = 0; i < n; i++) {
            candidates.add(i); // add all vertices to the candidates set
        }
        Set<Integer> current = new HashSet<>(); // a set to store the current clique
        findCliquesHelper(graph, k, candidates, current, cliques); // call the recursive helper method
        return cliques; // return the list of cliques
    }

    // A recursive helper method to find all cliques of size k in a graph
    public static void findCliquesHelper(boolean[][] graph, int k, Set<Integer> candidates, Set<Integer> current, List<Set<Integer>> cliques) {
        if (current.size() == k) { // if the current clique has reached the desired size, add it to the list and return
            cliques.add(new HashSet<>(current));
            return;
        }
        if (candidates.isEmpty()) { // if there are no more candidates to consider, return
            return;
        }
        for (int v : candidates) { // for each candidate vertex v
            current.add(v); // add v to the current clique
            Set<Integer> newCandidates = new HashSet<>(); // create a new set of candidates
            for (int u : candidates) {
                if (u > v && graph[u][v]) { // add only those vertices that are adjacent to v and have not been considered before
                    newCandidates.add(u);
                }
            }
            findCliquesHelper(graph, k, newCandidates, current, cliques); // recursively find cliques with the new candidates and current clique
            current.remove(v); // remove v from the current clique
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); // create a scanner object to read input
        System.out.println("Enter the number of vertices in the graph:");
        int n = sc.nextInt(); // read the number of vertices in the graph
        boolean[][] graph = new boolean[n][n]; // create a boolean matrix to represent the adjacency matrix of the graph
        System.out.println("Enter the adjacency matrix of the graph:");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                graph[i][j] = sc.nextInt() == 1; // read each element of the matrix and convert it to boolean value
            }
        }
        System.out.println("Enter the maximum size of cliques:");
        int k = sc.nextInt(); // read the maximum size of cliques
        sc.close(); // close the scanner object

        List<Set<Integer>> cliques = findCliques(graph, k); // find all cliques of size k in the graph

        System.out.println("The number of cliques of size " + k + " in the graph is: " + cliques.size()); // print the number of cliques

        System.out.println("The cliques are:"); 
        for (Set<Integer> clique : cliques) { // print each clique as a set of vertices
            System.out.println(clique);
        }
    }
}

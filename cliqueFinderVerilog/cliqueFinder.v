
/*	Commenting out everything until 

// Define a module to find k-cliques in a graph
module cliqueFinder(
  input [n-1:0] vertices, // A vector of n vertices
  input [n-1:0][n-1:0] adj_matrix, // An n x n adjacency matrix
  input [4:0] k, // The size of the cliques to be found
  output reg [n-1:0][k-1:0] clique, // A matrix of k-cliques, each row is a clique
  output reg [n-1:0] num_cliques // The number of k-cliques found
);

  // Define a function to separate Tplus of a matrix by a vertex
  function void separateTplus(input [n-1:0][k-1:0] T,
								 input [4:0] i
								 );
	 reg [n-1:0][k-1:0] Tplus;
	 reg [n-1:0][k-1:0] Tminus;
    integer j;
    begin
      for (j = 0; j < n; j = j + 1) begin
        if (T[j][i]) begin // If the ith bit of the jth row is 1
          Tplus[j] = T[j]; // Add the row to Tplus
          Tminus[j] = 0; // Clear the row in Tminus
        end else begin // If the ith bit of the jth row is 0
          Tplus[j] = 0; // Clear the row in Tplus
          Tminus[j] = T[j]; // Add the row to Tminus
        end
      end
		separateTplus = Tplus;
    end
  endfunction
  
   // Define a function to separate Tminus of a matrix by a vertex
  function void separateTminus(input [n-1:0][k-1:0] T,
								 input [4:0] i
								 );
    reg [n-1:0][k-1:0] Tplus;
	 reg [n-1:0][k-1:0] Tminus;
	 integer j;
    begin
      for (j = 0; j < n; j = j + 1) begin
        if (T[j][i]) begin // If the ith bit of the jth row is 1
          Tplus[j] = T[j]; // Add the row to Tplus
          Tminus[j] = 0; // Clear the row in Tminus
        end else begin // If the ith bit of the jth row is 0
          Tplus[j] = 0; // Clear the row in Tplus
          Tminus[j] = T[j]; // Add the row to Tminus
        end
      end
		separateTminus = Tminus;
    end
  endfunction

  // Define a function to merge two matrices by the complementarity rule
  function void T_merge(input [n-1:0][k-1:0] T1,
							 input [n-1:0][k-1:0] T2
                      );
	 reg [n-1:0][k-1:0] T_merge;
    integer j;
    begin
      for (j = 0; j < n; j = j + 1) begin
        if (T1[j] == 0) begin // If the jth row of T1 is all zeros
          T_merge[j] = T2[j]; // Copy the jth row of T2 to T_merge
        end else if (T2[j] == 0) begin // If the jth row of T2 is all zeros
          T_merge[j] = T1[j]; // Copy the jth row of T1 to T_merge
        end else begin // If neither row is all zeros
          T_merge[j] = 0; // Clear the jth row of T_merge
        end
      end
    end
  endfunction

  // Define an always block to implement the find_k_clique algorithm
  always @* begin
    integer i, j, l;
    reg [n-1:0][k-1:0] T_plus, T_minus, T_plus_plus, T_plus_minus;
    reg [4:0] count;
    num_cliques = 0;
    clique = vertices; // Initialize clique as all vertices

    for (i = 0; i < n - 1; i = i + 1) begin
      for (j = i + 1; j < n; j = j + 1) begin

        separateTplus(clique, i, T_plus, T_minus); // Separate by the ith vertex
		  separateTminus(clique, i, T_plus, T_minus); // Separate by the ith vertex

        separateTplus(clique, i, T_plus, T_minus); // Separate by the ith vertex(T_plus, j, T_plus_plus, T_plus_minus); // Separate by the jth vertex
        separateTminus(clique, i, T_plus, T_minus); // Separate by the ith vertex(T_plus, j, T_plus_plus, T_plus_minus); // Separate by the jth vertex

        merge(T_minus, T_plus_minus, clique); // Merge by the complementarity rule

        if (adj_matrix[i][j]) begin // If the corresponding vertices are adjacent

          merge(clique, T_plus_plus, clique); // Merge by the complementarity rule

        end

      end

      count = k - (i + 2); // Count how many bits are left after i + 2

      for (l = i + 2; l < n; l = l + 1) begin

        if (clique[l][count]) begin // If there is a clique in the lth row

          num_cliques = num_cliques + 1; // Increment the number of cliques

          clique[num_cliques - 1] = clique[l]; // Copy the clique to the output matrix

        end

      end

      if (num_cliques > 0) begin // If there are any cliques found

        break; // Exit the loop

      end

    end

  end

endmodule

*/
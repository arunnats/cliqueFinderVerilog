module CliqueCounterTB;

  reg [8:0] test_graph_flat;
  wire [2:0] result;
  reg clk;

  CliqueCounter uut (
    .graph({test_graph_flat[8:6], test_graph_flat[5:3], test_graph_flat[2:0]}), 
    .clk(clk),
    .clique_count(result)
  );

  integer i, j;
  
  initial begin
    clk = 0;
    test_graph_flat = 9'b010_101_010;

    $display("Input Graph:");
    for (i = 0; i < 3; i = i + 1) begin
      for (j = 0; j < 3; j = j + 1)
        $write("%2b ", test_graph_flat[i*3+j]); 
      $write("\n");
    end
  end
  
  initial begin
    #10; 

    repeat (100) begin
      clk = ~clk; 
      #10; 
    end

    $display("\nNumber of Cliques: %0d", result);

    $finish;
  end

endmodule

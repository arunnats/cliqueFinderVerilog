module CliqueCounter (
  input [8:0] graph, 
  input clk, 
  output reg [2:0] clique_count
);

reg [2:0] i;


always @(posedge clk) 
begin
	clique_count <= 0;
  
  for (i = 0; i < 6; i = i + 1) begin //made it 6 becuse if its 8 i+1 and i+2 will be out of bounds
    if ((graph[i+2] && graph[i+1] && graph[i]) == 1)
      clique_count <= clique_count + 1;
  end
end

endmodule

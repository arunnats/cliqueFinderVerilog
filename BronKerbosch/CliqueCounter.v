module CliqueCounter (
  input [8:0] graph, 
  input clk, 
  output reg [2:0] clique_count
);

reg [2:0] i;
reg [2:0] temp_count;

always @(posedge clk) 
begin
  temp_count = 0;
  
  for (i = 0; i < 6; i = i + 1) begin
    if ((graph[i+2] && graph[i+1] && graph[i]) == 1)
      temp_count = temp_count + 1;
  end

  clique_count <= temp_count;
end

endmodule

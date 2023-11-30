module verticeCombinations (
  input [24:0] flatArray,
  input clk,
  output reg [29:0] flatCombinations
);

  reg [4:0] vertices [0:4][0:4];
  reg [4:0] combinations_temp [0:9];
  integer i, j, count;

  // Initialize vertices matrix
  initial begin
    for (i = 0; i < 5; i = i + 1) begin
      for (j = 0; j < 5; j = j + 1) begin
        vertices[i][j] = flatArray[i*5 + j];
      end
    end
  end

  // Find combinations of size k
  always @* begin
    count = 0;
    for (i = 0; i < 5; i = i + 1) begin
      for (j = i + 1; j < 5; j = j + 1) begin
        if (vertices[i][j] == 1'b1) begin
          // Store the combination in combinations_temp
          combinations_temp[count] = {i, j, 2'b00};
          count = count + 1;
        end
      end
    end
  end

  // Assign combinations_temp to combinations
  always @(posedge clk) begin
    for (i = 0; i < 10; i = i + 1) begin
      flatCombinations[i*3 +: 3] = combinations_temp[i];
    end
  end

endmodule

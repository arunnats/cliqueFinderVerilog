module arrayAdder(
	input [26:0] flatArray1, 
	input [26:0] flatArray2, 
	output reg [26:0] flatResult
);

    reg [3:0] array1 [0:2][0:2];
    reg [3:0] array2 [0:2][0:2];
    reg [3:0] result [0:2][0:2];
    integer i, j;

    initial begin
        for (i = 0; i < 3; i = i + 1) begin
            for (j = 0; j < 3; j = j + 1) begin
                array1[i][j] = flatArray1[i*9 + j*3 +: 3];
                array2[i][j] = flatArray2[i*9 + j*3 +: 3];
            end
        end
    end

    always @* begin
        for (i = 0; i < 3; i = i + 1) begin
            for (j = 0; j < 3; j = j + 1) begin
                result[i][j] = array1[i][j] + array2[i][j];
                flatResult[i*9 + j*3 +: 3] = result[i][j];
            end
        end
    end
endmodule

module arrayAdderTestbench;
    reg [26:0] flatArray1;
    reg [26:0] flatArray2;
    wire [26:0] flatResult;

    ArrayAddition testbench (.flatArray1(flatArray1), .flatArray2(flatArray2), .flatResult(flatResult));

    initial begin
        // Initialize flatArray1 and flatArray2 here
        flatArray1 = 27'h012345678;
        flatArray2 = 27'h012345678;

        // Then, apply a positive edge to the clock
        #10;
    end
endmodule

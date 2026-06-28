module subtractor #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [N-1:0] B,

    output [N-1:0] DIFF,
    output BORROW
);

wire [N:0] temp;

assign temp = {1'b0, A} - {1'b0, B};

assign DIFF = temp[N-1:0];

assign BORROW = temp[N];

endmodule

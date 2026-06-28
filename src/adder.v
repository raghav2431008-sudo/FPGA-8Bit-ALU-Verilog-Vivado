module adder #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [N-1:0] B,

    output [N-1:0] SUM,
    output CARRY
);

wire [N:0] temp;

assign temp = A + B;

assign SUM = temp[N-1:0];

assign CARRY = temp[N];

endmodule

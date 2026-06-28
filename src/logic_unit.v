module logic_unit #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [N-1:0] B,

    output [N-1:0] AND_OUT,
    output [N-1:0] OR_OUT,
    output [N-1:0] XOR_OUT,
    output [N-1:0] NOT_OUT,
    output [N-1:0] NAND_OUT,
    output [N-1:0] NOR_OUT,
    output [N-1:0] XNOR_OUT
);

assign AND_OUT  = A & B;
assign OR_OUT   = A | B;
assign XOR_OUT  = A ^ B;
assign NOT_OUT  = ~A;
assign NAND_OUT = ~(A & B);
assign NOR_OUT  = ~(A | B);
assign XNOR_OUT = ~(A ^ B);

endmodule

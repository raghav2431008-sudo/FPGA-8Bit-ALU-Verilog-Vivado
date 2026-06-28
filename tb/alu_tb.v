`timescale 1ns / 1ps

module alu_tb;

parameter N = 8;

reg [N-1:0] A;
reg [N-1:0] B;
reg [3:0] SEL;

wire [N-1:0] RESULT;
wire CARRY;
wire ZERO;
wire OVERFLOW;
wire NEGATIVE;

alu_top #(N) DUT
(
    .A(A),
    .B(B),
    .SEL(SEL),

    .RESULT(RESULT),
    .CARRY(CARRY),
    .ZERO(ZERO),
    .OVERFLOW(OVERFLOW),
    .NEGATIVE(NEGATIVE)
);

initial
begin

    // ADD
    A = 8'd10;
    B = 8'd5;
    SEL = 4'b0000;
    #10;

    // SUB
    A = 8'd20;
    B = 8'd7;
    SEL = 4'b0001;
    #10;

    // AND
    A = 8'b10101010;
    B = 8'b11001100;
    SEL = 4'b0010;
    #10;

    // OR
    SEL = 4'b0011;
    #10;

    // XOR
    SEL = 4'b0100;
    #10;

    // NOT
    SEL = 4'b0101;
    #10;

    // NAND
    SEL = 4'b0110;
    #10;

    // NOR
    SEL = 4'b0111;
    #10;

    // XNOR
    SEL = 4'b1000;
    #10;

    // Shift Left
    A = 8'b00001111;
    SEL = 4'b1001;
    #10;

    // Shift Right
    SEL = 4'b1010;
    #10;

    // Rotate Left
    SEL = 4'b1011;
    #10;

    // Rotate Right
    SEL = 4'b1100;
    #10;

    // Compare
    A = 8'd15;
    B = 8'd15;
    SEL = 4'b1101;
    #10;

    // Increment
    A = 8'd50;
    SEL = 4'b1110;
    #10;

    // Decrement
    A = 8'd50;
    SEL = 4'b1111;
    #10;

    $finish;

end

endmodule

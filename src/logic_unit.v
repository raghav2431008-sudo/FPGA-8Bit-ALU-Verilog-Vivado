module logic_unit #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [2:0] SEL,

    output reg [N-1:0] RESULT
);

always @(*)
begin

    case(SEL)

        3'b000:
            RESULT = A & B;

        3'b001:
            RESULT = A | B;

        3'b010:
            RESULT = A ^ B;

        3'b011:
            RESULT = ~A;

        3'b100:
            RESULT = ~(A & B);

        3'b101:
            RESULT = ~(A | B);

        3'b110:
            RESULT = ~(A ^ B);

        default:
            RESULT = 0;

    endcase

end

endmodule

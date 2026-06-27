module alu_top #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    input [3:0] SEL,

    output reg [N-1:0] RESULT,
    output reg CARRY,
    output reg ZERO,
    output reg OVERFLOW,
    output reg NEGATIVE
);

wire [N-1:0] add_result;
wire add_carry;

adder #(N) ADD1
(
    .A(A),
    .B(B),
    .SUM(add_result),
    .CARRY(add_carry)
);

always @(*)
begin

    RESULT = 0;
    CARRY = 0;
    ZERO = 0;
    OVERFLOW = 0;
    NEGATIVE = 0;

    case(SEL)

        4'b0000:
        begin
            RESULT = add_result;
            CARRY = add_carry;
        end

        default:
        begin
            RESULT = 0;
        end

    endcase

    ZERO = (RESULT == 0);
    NEGATIVE = RESULT[N-1];

end

endmodule

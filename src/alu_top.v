module alu_top #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [3:0] SEL,

    output reg [N-1:0] RESULT,
    output reg CARRY,
    output reg ZERO,
    output reg OVERFLOW,
    output reg NEGATIVE
);


// Adder

wire [N-1:0] ADD_OUT;
wire ADD_CARRY;

adder #(N) ADD1
(
    .A(A),
    .B(B),
    .SUM(ADD_OUT),
    .CARRY(ADD_CARRY)
);

// Subtractor
wire [N-1:0] SUB_OUT;
wire SUB_BORROW;

subtractor #(N) SUB1
(
    .A(A),
    .B(B),
    .DIFF(SUB_OUT),
    .BORROW(SUB_BORROW)
);

// Logic Unit
wire [N-1:0] AND_OUT;
wire [N-1:0] OR_OUT;
wire [N-1:0] XOR_OUT;
wire [N-1:0] NOT_OUT;
wire [N-1:0] NAND_OUT;
wire [N-1:0] NOR_OUT;
wire [N-1:0] XNOR_OUT;

logic_unit #(N) LU
(
    .A(A),
    .B(B),

    .AND_OUT(AND_OUT),
    .OR_OUT(OR_OUT),
    .XOR_OUT(XOR_OUT),
    .NOT_OUT(NOT_OUT),
    .NAND_OUT(NAND_OUT),
    .NOR_OUT(NOR_OUT),
    .XNOR_OUT(XNOR_OUT)
);

// Shift Unit
wire [N-1:0] SHL_OUT;
wire [N-1:0] SHR_OUT;
wire [N-1:0] ROL_OUT;
wire [N-1:0] ROR_OUT;

shift_unit #(N) SU
(
    .A(A),

    .SHL_OUT(SHL_OUT),
    .SHR_OUT(SHR_OUT),
    .ROL_OUT(ROL_OUT),
    .ROR_OUT(ROR_OUT)
);

// Comparator
wire EQUAL;
wire GREATER;
wire LESS;

comparator #(N) COMP
(
    .A(A),
    .B(B),

    .EQUAL(EQUAL),
    .GREATER(GREATER),
    .LESS(LESS)
);

always @(*)
begin

    RESULT = 0;
    CARRY = 0;
    ZERO = 0;
    NEGATIVE = 0;
    OVERFLOW = 0;

    case(SEL)

        4'b0000:
        begin
            RESULT = ADD_OUT;
            CARRY = ADD_CARRY;
        end

        4'b0001:
        begin
            RESULT = SUB_OUT;
            CARRY = SUB_BORROW;
        end

        4'b0010:
            RESULT = AND_OUT;

        4'b0011:
            RESULT = OR_OUT;

        4'b0100:
            RESULT = XOR_OUT;

        4'b0101:
            RESULT = NOT_OUT;

        4'b0110:
            RESULT = NAND_OUT;

        4'b0111:
            RESULT = NOR_OUT;
                4'b1000:
            RESULT = XNOR_OUT;

        4'b1001:
            RESULT = SHL_OUT;

        4'b1010:
            RESULT = SHR_OUT;

        4'b1011:
            RESULT = ROL_OUT;

        4'b1100:
            RESULT = ROR_OUT;

        4'b1101:
        begin
            if(EQUAL)
                RESULT = 8'd1;
            else if(GREATER)
                RESULT = 8'd2;
            else
                RESULT = 8'd3;
        end

        4'b1110:
            RESULT = A + 1;

        4'b1111:
            RESULT = A - 1;

        default:
        begin
            RESULT = 0;
            CARRY = 0;
        end

    endcase

    // Flag Generation
    ZERO = (RESULT == 0);
    NEGATIVE = RESULT[N-1];

    // Simple Overflow Detection for ADD/SUB
    if (SEL == 4'b0000)
        OVERFLOW = (~(A[N-1] ^ B[N-1])) & (A[N-1] ^ RESULT[N-1]);

    else if (SEL == 4'b0001)
        OVERFLOW = (A[N-1] ^ B[N-1]) & (A[N-1] ^ RESULT[N-1]);

    else
        OVERFLOW = 0;

end

endmodule

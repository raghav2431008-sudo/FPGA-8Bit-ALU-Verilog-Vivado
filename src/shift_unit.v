module shift_unit #(parameter N = 8)
(
    input  [N-1:0] A,
    input  [1:0] SEL,

    output reg [N-1:0] RESULT
);

always @(*)
begin

    case(SEL)

        // Logical Left Shift
        2'b00:
            RESULT = A << 1;

        // Logical Right Shift
        2'b01:
            RESULT = A >> 1;

        // Rotate Left
        2'b10:
            RESULT = {A[N-2:0], A[N-1]};

        // Rotate Right
        2'b11:
            RESULT = {A[0], A[N-1:1]};

    endcase

end

endmodule

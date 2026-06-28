module shift_unit #(parameter N = 8)
(
    input  [N-1:0] A,

    output [N-1:0] SHL_OUT,
    output [N-1:0] SHR_OUT,
    output [N-1:0] ROL_OUT,
    output [N-1:0] ROR_OUT
);

assign SHL_OUT = A << 1;

assign SHR_OUT = A >> 1;

// Rotate Left
assign ROL_OUT = {A[N-2:0], A[N-1]};

// Rotate Right
assign ROR_OUT = {A[0], A[N-1:1]};

endmodule

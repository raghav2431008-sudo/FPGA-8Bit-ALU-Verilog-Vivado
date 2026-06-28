module comparator #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,

    output reg EQUAL,
    output reg GREATER,
    output reg LESS
);

always @(*)
begin

    EQUAL = 0;
    GREATER = 0;
    LESS = 0;

    if(A == B)
        EQUAL = 1;

    else if(A > B)
        GREATER = 1;

    else
        LESS = 1;

end

endmodule

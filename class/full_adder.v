module full_adder (
    input A,
    input B,
    input cIn,
    output Y,
    output cOut
);

    assign Y = A ^ B ^ cIn;
    assign cOut = (A & B) | (A & cIn) | (B & cIn);

endmodule
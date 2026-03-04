module half_sub(
    input A,
    input B,
    output Y,
    output borrow
);

    assign Y = A ^ B;
    assign borrow = ~A & B;

endmodule
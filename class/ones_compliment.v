module ones_compliment(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y
);

    // Stores the intermediary sum (A + B)
    wire [3:0] APlusB;
    // The carry used for A+B. Will need to scale
    // up in higher order addition
    wire [2:0] carry;
    // The carr out of A+B
    wire around;
    // The carry used for (A + B) + around
    wire [2:0] second_carry;

    // First round of addition
    full_adder lsb_inter(
        .A(A[0]),
        .B(B[0]),
        .cIn(1'b0), // Fix to zero
        .Y(APlusB[0]),
        .cOut(carry[0])
    );
    
    full_adder second_inter(
        .A(A[1]),
        .B(B[1]),
        .cIn(carry[0]),
        .Y(APlusB[1]),
        .cOut(carry[1])
    );
    
    full_adder third_inter(
        .A(A[2]),
        .B(B[2]),
        .cIn(carry[1]),
        .Y(APlusB[2]),
        .cOut(carry[2])
    );

    full_adder msb_inter(
        .A(A[3]),
        .B(B[3]),
        .cIn(carry[2]),
        .Y(APlusB[3]),
        .cOut(around)
    );

    // Second round of addition
    full_adder lsb(
        .A(APlusB[0]), // Adding LSB of (A + B)
        .B(1'b0), // We are adding 0, with the optional carry:
        .cIn(around), // This now takes *in* from the last sum
        .Y(Y[0]), // This is now the real summation
        .cOut(second_carry[0]) // We still need to carry to second
        // bit of second addition
    );

    full_adder seccond(
        .A(APlusB[1]),
        .B(1'b0),
        .cIn(second_carry[0]),
        .Y(Y[1]),
        .cOut(second_carry[1])
    );
    
    full_adder third(
        .A(APlusB[2]),
        .B(1'b0),
        .cIn(second_carry[1]),
        .Y(Y[2]),
        .cOut(second_carry[2])
    );

    full_adder msb(
        .A(APlusB[3]),
        .B(1'b0),
        .cIn(second_carry[2]),
        .Y(Y[3])
        // no carry out!
    );

endmodule
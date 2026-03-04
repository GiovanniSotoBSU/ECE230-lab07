module top(
    input [9:0]sw,
    output [13:0]led
);

    // Half subtractor
    half_sub hs(
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .borrow(led[1])
    );
    
    // One's compliment (4-bit)
    ones_compliment oc(
        .A(sw[5:2]),
        .B(sw[9:6]),
        .Y(led[5:2])
    );
    
    // Two's compliment (8-bit)
    twos_compliment tc(
        .A(sw[9:2]),
        .out(led[13:6])
    );

endmodule
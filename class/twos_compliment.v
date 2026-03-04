module twos_compliment(
    input [7:0] A,
    output [7:0] out
);

    wire [7:0] inv;
    assign inv = ~A;
    
    wire [6:0] carry;
    
    full_adder t0(.A(inv[0]), .B(1'b0), .cIn(1'b1), .Y(out[0]), .cOut(carry[0]));
    full_adder t1(.A(inv[1]), .B(1'b0), .cIn(carry[0]), .Y(out[1]), .cOut(carry[1]));
    full_adder t2(.A(inv[2]), .B(1'b0), .cIn(carry[1]), .Y(out[2]), .cOut(carry[2]));
    full_adder t3(.A(inv[3]), .B(1'b0), .cIn(carry[2]), .Y(out[3]), .cOut(carry[3]));
    full_adder t4(.A(inv[4]), .B(1'b0), .cIn(carry[3]), .Y(out[4]), .cOut(carry[4]));
    full_adder t5(.A(inv[5]), .B(1'b0), .cIn(carry[4]), .Y(out[5]), .cOut(carry[5]));
    full_adder t6(.A(inv[6]), .B(1'b0), .cIn(carry[5]), .Y(out[6]), .cOut(carry[6]));
    full_adder t7(.A(inv[7]), .B(1'b0), .cIn(carry[6]), .Y(out[7]));

endmodule
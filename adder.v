// Add delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
wire AxorB, AxorBandcarryin, AandB;
`XOR xorgate1(AxorB, a, b);
`XOR xorgate2(sum, AxorB, carryin);
`AND andgate1(AxorBandcarryin, AxorB, carryin);
`AND andgate2(AandB, a, b);
`OR orgate(carryout, AxorBandcarryin, AandB);
endmodule

module fourBitAdder
(
    output [3:0] sum,
    output carryout,
    output overflow,
    input [3:0] a,
    input [3:0] b,
    input carryin
);
  wire carryout0, carryout1, carryout2, carryout;
  structuralFullAdder add1(sum[0], carryout0, a[0], b[0], carryin);
  structuralFullAdder add2(sum[1], carryout1, a[1], b[1], carryout0);
  structuralFullAdder add3(sum[2], carryout2, a[2], b[2], carryout1);
  structuralFullAdder add4(sum[3], carryout, a[3], b[3], carryout2);
  `XOR overflowgate(overflow,carryout2,carryout);


endmodule

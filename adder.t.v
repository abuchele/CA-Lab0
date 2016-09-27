// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

// module testFullAdder() ;
//     reg a, b, carryin;
//     wire sum, carryout;
//
//     structuralFullAdder adder (sum, carryout, a, b, carryin);
//
//
//     initial begin
//     $dumpfile("adder.vcd");
//     $dumpvars(0, testFullAdder);
//
//     $display("A B Carryin | Sum Carryout | Expected Output");
//     a=0;b=0;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  0", a, b, carryin, sum, carryout);
//     a=0;b=0;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=0;b=1;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=0;b=1;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=0;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  0", a, b, carryin, sum, carryout);
//     a=1;b=0;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=1;carryin=0; #1000
//     $display("%b %b    %b    |    %b     %b   | 0  1", a, b, carryin, sum, carryout);
//     a=1;b=1;carryin=1; #1000
//     $display("%b %b    %b    |    %b     %b   | 1  1", a, b, carryin, sum, carryout);
//     end
// endmodule

module testFourBit();
    reg carryin;
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout0, carryout1, carryout2, carryout3;

    fourBitAdder fouradder (sum, carryout3, overflow, a, b, carryin);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, testFourBit);

    $display("   A   B   Carryin |  Sum   Carryout   |  Overflow  | Expected Output | Expected Carryout");
    a=0000;b=0000;carryin=0; #1000
    $display(" %b %b    %b    |  %b      %b      |      %b     |       0000      |     0    ", a, b, carryin, sum, carryout3, overflow);
    a=0001;b=0000;carryin=0; #1000
    $display(" %b %b    %b    |  %b      %b      |      %b     |       0001      |     0    ", a, b, carryin, sum, carryout3, overflow);
    a=0001;b=0001;carryin=0; #1000
    $display(" %b %b    %b    |  %b      %b      |      %b     |       0010      |     0    ", a, b, carryin, sum, carryout3, overflow);
    a=1000;b=1000;carryin=0; #1000
    $display(" %b %b    %b    |  %b      %b      |      %b     |       0000      |     1    ", a, b, carryin, sum, carryout3, overflow);
    a=1100;b=0110;carryin=0; #1000
    $display(" %b %b    %b    |  %b      %b      |      %b     |       1010      |     1    ", a, b, carryin, sum, carryout3, overflow);
    end
endmodule

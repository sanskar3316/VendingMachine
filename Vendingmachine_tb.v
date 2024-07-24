`timescale 1ns/1ns
`include "kk.v"

module vending_machine_tb;
  
  reg clk;
  reg rst;
  reg [1:0]in;
  
  wire out;
  wire [1:0]change;
  
  vending_machine_15072024 uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
  ); 
  
  initial begin 
    
    $dumpfile("vending_machine_15072024.vcd");
    $dumpvars(0,vending_machine_tb);
    rst = 1;
    clk = 0;
    #6 rst = 0;
    in = 1;
    #11 in = 1;
    #16 in = 1;

         #50 $finish;
  end
  always #5 clk = ~clk;
endmodule
`timescale 1ns/1ps

module alu_4bit_tb;
   reg [3:0] a;
   reg [3:0] b;
   reg [2:0] alu_sel;
   wire [3:0] alu_out;
   wire carry_out;
   wire zero_flag;

   alu_4bit uut (
      .a(a),
      .b(b), 
      .alu_sel(alu_sel), 
      .alu_out(alu_out), 
      .carry_out(carry_out), 
      .zero_flag(zero_flag)
      );
   initial begin //GTKwave setup
      $dumpfile("alu_4bit_dump.vcd");
      $dumpvars(0,alu_4bit_tb);
      //test add : 9+8=17 , out=1 , carry=1
      a=4'b1001; b=4'b1000; alu_sel=3'b000; #10;
      //test sub : 10-4=6 
      a=4'b1010; b=4'b0100; alu_sel=3'b001; #10;
      //test AND : 1100 & 1010 = 1000
      a=4'b1100; b=4'b1010; alu_sel=3'b010; #10;
      //test OR: 1100 | 1010 = 1110
      a=4'b1100; b=4'b1010; alu_sel=3'b011; #10;
      //test XOR: 1100 ^ 1010 = 0110
      a=4'b1100; b=4'b1010; alu_sel=3'b100; #10;
      //test NOT: ~1100 = 0011
      a=4'b1000; alu_sel=3'b101; #10;
      //test SHL: 0011 << 1 = 0110
      a=4'b0011; alu_sel=3'b110; #10;
      //test SHR :1010 >> 1 = 0101
      a=4'b1010; alu_sel=3'b111; #10;
      $finish;
   end
endmodule
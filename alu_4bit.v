module alu_4bit(
   input wire [3:0] a,
   input wire [3:0] b,
   input wire [2:0] alu_sel,
   output reg [3:0] alu_out, 
   output reg carry_out,
   output wire zero_flag
);
   reg [4:0] total;
   always @(*) begin
      carry_out = 1'b0;
      total = 1'b1;
      case (alu_sel)
         3'b000 : begin //addition
            total = a+b;
            alu_out = total[3:0];
            carry_out = total[4];
            end
         3'b001 : begin //substraction
            total = a-b;
            alu_out = total[3:0];
            carry_out = total[4];
         end
         3'b010 :alu_out = a & b;  //and
         3'b011 :alu_out = a | b;  //or
         3'b100 :alu_out = a ^ b;  //xor
         3'b101 :alu_out = ~a;
         3'b110 :alu_out = a<<1;   //shl
         3'b111 :alu_out = a>>1;   //shr
         default :alu_out = 4'b0000;
      endcase
   end
   assign zero_flag = (alu_out == 4'b0000)? 1'b1 : 1'b0;
endmodule 

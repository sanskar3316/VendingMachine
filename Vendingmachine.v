module vending_machine_15072024(
  input clk,
  input rst,
  input [1:0]in,  // 00= nothing , 01 = 5 rs , 10 = 10rs
  output reg out,
  output reg [1:0] change
);
  
  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;

  reg [1:0] current , next;
  
  always@(posedge clk)
    begin
      if(rst == 1)
        begin
          current = 0;
          next = 0;
          change = 2'b00;
        end
      else
        current = next;
      
      case(current)
        
       s0:
        if(in==0)
          begin
            next = s0;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b01)
          begin
            next = s1;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b10)
          begin 
            next = s2;
            out = 0;
            change = 2'b00;
          end
        
        s1:
          if(in == 0)
            begin
              next = s0;
              out = 0;
              change = 2'b01;
            end
        else if(in == 2'b01)
          begin
            next = s2;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b10)
          begin
            next = s0;
            out = 1;
            change = 2'b00;
          end
        
        s2:
          if(in ==0)
            begin
              next = 2'b00;
              out = 0;
              change = 2'b10;
            end
        else if (in == 2'b01)
          begin
            next = 2'b00;
            out = 1;
            change = 2'b00;
          end
        else if (in == 2'b10)
          begin
            next = 2'b00;
            out = 1;
            change = 2'b01;
          end
      endcase
    end
endmodule
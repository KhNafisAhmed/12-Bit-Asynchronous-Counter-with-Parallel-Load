module COUNTER_12bit(input logic clk,
                     input logic enable,
                     input logic reset_n,
                     input logic load,
                     input logic up_down,
                     input logic [11:0]data,
                     output logic [11:0]count);
  
  always@(posedge clk or negedge reset_n or posedge load) begin  
    if(!reset_n) count <= 12'd0;
    
    else if(enable) begin
      if(load) count <= data;
      else if(up_down) count <= count + 1;
      else count <= count - 1;
    end   
  end
  
endmodule
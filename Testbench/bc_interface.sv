interface bc_interface(input logic clk);
  
  //Inputs
  logic enable;
  logic reset_n;
  logic load;
  logic up_down;
  logic [11:0]data;
  
  //Outputs
  logic [11:0]count;
  
endinterface
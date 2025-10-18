`include "file_list.sv"

module tb_top;
  
  logic clk;
  
  bc_test test;
  bc_interface cnt_if(clk);
  
  COUNTER_12bit DUT(
    				.clk(bc_if.clk),
    				.enable(bc_if.enable),
    				.reset_n(bc_if.reset_n),
    				.load(bc_if.load),
    				.up_down(bc_if.up_down),
    				.data(bc_if.data),
    				.count(bc_if.count));
  
  initial begin
    clk = 1'b0;
    forever begin
      #5 clk = ~clk;
    end
  end
  
  initial begin
    $display("[%0t]: TOP CREATED", $time);
    test = new(bc_if);
    test.run_test();
    $stop;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
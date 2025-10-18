class bc_driver;
  
  virtual bc_interface v_if;
  
  function new(virtual bc_interface v_if);
    $display("[%0t]: DRIVER CREATED", $time);
    this.v_if = v_if;
  endfunction
  
  //TASK: RESET
  task RESET_TEST();

    v_if.reset <= 1'b0;
    @(posedge v_if.clk);
    @(negedge v_if.clk);
    v_if.reset <= 1'b1;
    
  endtask
  
  //TASK: LOAD TEST
  task LOAD(logic [11:0]data);
    
    @(negedge v_if.clk);
    v_if.enable <= 1'b1;
    v_if.reset_n <= 1'b1;
    v_if.load <= 1'b1;
    v_if.data <= data;
    
  endtask
  
  //TASK: UP COUNT TEST
  task UP_COUNT();
    
    @(negedge v_if.clk);
    v_if.enable <= 1'b1;
    v_if.reset_n <= 1'b1;
    v_if.load <= 1'b0;
    v_if.up_down <= 1'b1;
    
  endtask
  
  //TASK: DOWN COUNT TEST
  task DOWN_COUNT();
    
    @(negedge v_if.clk);
    v_if.enable <= 1'b1;
    v_if.reset_n <= 1'b1;
    v_if.load <= 1'b0;
    v_if.up_down <= 1'b0;
    
  endtask
  
endclass
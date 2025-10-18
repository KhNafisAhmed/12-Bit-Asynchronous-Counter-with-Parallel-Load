class bc_monitor;
  
  virtual bc_interface v_if;
  mailbox mon2scb;
  bc_tr_item item;
  
  function new(virtual bc_interface v_if, mailbox mon2scb);
    $display("[%0t]: MONITOR CREATED", $time);
    this.v_if = v_if;
    this.mon2scb = mon2scb;
    item = new();
    
    fork
      capture();
    join_none
  endfunction
  
  
  task capture();
    forever begin
      @(posedge v_if.clk);
      item.enable = v_if.enable;
      item.reset_n = v_if.reset_n;
      item.load = v_if.load;
      item.up_down = v_if.up_down;
      item.data = v_if.data;
      
      @(negedge v_if.clk);
      item.count = v_if.count;
      
      mon2scb.put(item);
    end
  endtask
  
endclass
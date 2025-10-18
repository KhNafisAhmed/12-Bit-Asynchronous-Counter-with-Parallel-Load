class bc_agent;
  
  bc_driver driver;
  bc_monitor monitor;
  
  function new(virtual bc_interface v_if, mailbox mon2scb);
    $display("[%0t]: AGENT CREATED", $time);
    driver = new(v_if);
    monitor = new(v_if, mon2scb);
  endfunction
  
endclass
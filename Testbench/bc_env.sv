class bc_env;
  
  bc_agent agent;
  bc_scb scb;
  mailbox mon2scb;
  
  function new(virtual bc_interface v_if);
    $display("[%0t]: ENV CREATED", $time);
    mon2scb = new();
    agent = new(v_if, mon2scb);
    scb = new(mon2scb);
  endfunction
  
endclass
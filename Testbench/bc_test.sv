class bc_test;
  
  bc_env env;
  
  function new(virtual bc_interface v_if);
    $display("[%0t]: TEST CREATED", $time);
    env = new(v_if);
  endfunction
  
  task run_test();
    env.agent.driver.RESET_TEST();
    UP_COUNT_TEST();
    DOWN_COUNT_TEST();
    LOAD_TEST();
    ROLL_OVER_TEST();
  endtask
  
  
  //TASK: UP_COUNT FROM 0-TO-4095
  task UP_COUNT_TEST();
    for(int i = 0; i <= 4095; i++) begin
      env.agent.driver.UP_COUNT();
    end
  endtask
  
   //TASK: DOWN_COUNT FROM 4095-TO-0
  task DOWN_COUNT_TEST();
    for(int i = 0; i <= 4095; i++) begin
      env.agent.driver.DOWN_COUNT();
    end
  endtask
  
  //TASK: LOAD TEST - LOAD ALL THE POSSIBLE VALUES FROM 0 TO 4095
  task LOAD_TEST();
    for(logic i = 0; i <= 12'd4095; i++) begin
      env.agent.driver.LOAD(i);
    end
  endtask
    
  //TASK: ROLL-OVER TEST - CHECK IF THE SEQUENCE IS REPEATED WHEN REACHES THE LAST NUMBER
  task ROLL_OVER_TEST();
    env.agent.driver.RESET_TEST();
    
    for(int i = 0; i <= 8191; i++) begin
      env.agent.driver.UP_COUNT();
    end
    
    env.agent.driver.RESET_TEST();
    
    for(int i = 0; i <= 8191; i++) begin
      env.agent.driver.DOWN_COUNT();
    end
    
  endtask
  
endclass
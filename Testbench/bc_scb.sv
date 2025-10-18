class bc_scb;
  
  mailbox mon2scb;
  bc_tr_item item;
  logic [11:0]exp_cnt;
  
  function new(mailbox mon2scb);
    $display("[%0t]: SCB CREATED", $time);
    this.mon2scb = mon2scb;
    
    fork
      compare();
    join_none
  endfunction
  
  task compare();
    forever begin
      mon2scb.get(item);

      if(item.reset_n) begin
        exp_cnt = 12'd0;
      end
      
      else if(item.load) begin
        exp_cnt = item.data;
      end
      
      else if(item.up_down) begin
        exp_cnt = exp_cnt + 1;
      end
      
      else if(!item.up_down) begin
        exp_cnt = exp_cnt - 1;
      end
      
      if(item.count === exp_cnt) begin
        $display("[%0t]ns: Enable: %0b, Reset: %0b, Load: %0b, Up_Down: %0b, Expected_CNT: %0h, Actual_CNT: %0h, ", $time, item.enable, item.reset_n, item.load, item.up_down, exp_cnt, item.count);
        $display("-------------------------------------- TEST PASSED --------------------------------------");
      end
      
      else begin
        $display("[%0t]ns: Enable: %0b, Reset: %0b, Load: %0b, Up_Down: %0b, Expected_CNT: %0h, Actual_CNT: %0h, ", $time, item.enable, item.reset_n, item.load, item.up_down, exp_cnt, item.count);
        $display("-------------------------------------- TEST FAILED --------------------------------------");
      end
      
    end
    
  endtask
  
endclass
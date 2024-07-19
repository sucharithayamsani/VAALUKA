`ifndef YAPP_TX_MONITOR
`define YAPP_TX_MONITOR
class yapp_tx_monitor extends uvm_monitor;
`uvm_component_utils(yapp_tx_monitor)

 extern function new(string name = "yapp_tx_monitor",uvm_component parent);
 extern task run_phase(uvm_phase phase);

endclass

 function yapp_tx_monitor::new(string name = "yapp_tx_monitor",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  task yapp_tx_monitor::run_phase(uvm_phase phase);
  `uvm_info("monitor","RUN PHASE",UVM_LOW);

  endtask
`endif //YAPP_TX_MONITOR

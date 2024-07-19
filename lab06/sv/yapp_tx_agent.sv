`ifndef YAPP_TX_AGENT
`define YAPP_TX_AGENT

class yapp_tx_agent extends uvm_agent;
`uvm_component_utils(yapp_tx_agent)

  yapp_tx_sequencer sequencer;
  yapp_tx_driver    driver;
  yapp_tx_monitor   monitor;

  extern function new(string name = "yapp_tx_agent",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern function void start_of_simulation_phase(uvm_phase phase);
  extern task          run_phase(uvm_phase phase);
  extern function void extract_phase(uvm_phase phase);
  extern function void check_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern function void final_phase(uvm_phase phase);
uvm_active_passive_enum is_active = UVM_ACTIVE;

endclass

  // constructor new function
  function yapp_tx_agent:: new(string name = "yapp_tx_agent",uvm_component parent);
  super.new(name,parent);
  endfunction : new 
  //Build phase function
  function void yapp_tx_agent:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  monitor = yapp_tx_monitor::type_id::create("monitor",this);
  if(get_is_active() == UVM_ACTIVE)  begin
    driver = yapp_tx_driver::type_id::create("driver",this);
    sequencer = yapp_tx_sequencer::type_id::create("sequencer",this);
  end 
  endfunction:build_phase

  function void yapp_tx_agent:: connect_phase(uvm_phase phase);
  if(get_is_active() == UVM_ACTIVE)  begin
  driver.seq_item_port.connect(sequencer.seq_item_export);
  end
  endfunction:connect_phase
  
  function void yapp_tx_agent::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("agent","end_of_elaboration_phase",UVM_LOW)
  endfunction : end_of_elaboration_phase

  function void yapp_tx_agent:: start_of_simulation_phase(uvm_phase phase);
  `uvm_info("agent","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task yapp_tx_agent:: run_phase(uvm_phase phase);
  `uvm_info("agent","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void yapp_tx_agent::extract_phase(uvm_phase phase);
  `uvm_info("agent","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
 function void yapp_tx_agent::check_phase(uvm_phase phase);
  `uvm_info("agent","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void yapp_tx_agent::report_phase(uvm_phase phase);
  `uvm_info("agent","report_phase",UVM_LOW)
  endfunction:report_phase

 function void yapp_tx_agent::final_phase(uvm_phase phase);
  `uvm_info("agent","final_phase",UVM_LOW)
  endfunction : final_phase


`endif //YAPP_TX_AGENT


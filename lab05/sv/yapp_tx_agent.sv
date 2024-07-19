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
  extern function void start_of_simulation_phase(uvm_phase phase);

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
 
  endfunction

  function void yapp_tx_agent:: connect_phase(uvm_phase phase);
  if(get_is_active() == UVM_ACTIVE)  begin
  driver.seq_item_port.connect(sequencer.seq_item_export);
  end
  endfunction
  
  function void yapp_tx_agent:: start_of_simulation_phase(uvm_phase phase);
  `uvm_info("agent","start_of_simulation_phase",UVM_HIGH)
  endfunction

`endif //YAPP_TX_AGENT


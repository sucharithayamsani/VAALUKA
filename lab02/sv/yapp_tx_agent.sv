`ifndef YAPP_TX_AGENT_SV
`define YAPP_TX_AGENT_SV
 
class yapp_tx_agent extends uvm_agent;
`uvm_component_utils(yapp_tx_agent)

  yapp_tx_sequencer sequencer;
  yapp_tx_driver    driver;
  yapp_tx_monitor   monitor;

  extern function new(string name = "yapp_tx_agent",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern  function void connect_phase(uvm_phase phase);

uvm_active_passive_enum is_active = UVM_ACTIVE;
endclass


  function yapp_tx_agent:: new(string name = "yapp_tx_agent",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function void yapp_tx_agent:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  monitor = yapp_tx_monitor::type_id::create("monitor",this);
  if(is_active == UVM_ACTIVE)  begin
    driver = yapp_tx_driver::type_id::create("driver",this);
    sequencer = yapp_tx_sequencer::type_id::create("sequencer",this);
  end
 
  endfunction

  function void yapp_tx_agent::  connect_phase(uvm_phase phase);
  if(is_active == UVM_ACTIVE)  begin
  driver.seq_item_port.connect(sequencer.seq_item_export);
  end
  endfunction

`endif //YAPP_TX_AGENT_SV


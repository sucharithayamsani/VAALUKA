`ifndef YAPP_TX_SEQUENCER_SV
`define YAPP_TX_SEQUENCER_SV

class yapp_tx_sequencer extends uvm_sequencer #(yapp_packet);
`uvm_component_utils(yapp_tx_sequencer)

 
extern function new(string name = "yapp_tx_sequencer",uvm_component parent);
extern function void start_of_simulation_phase(uvm_phase phase);

endclass

  function  yapp_tx_sequencer:: new(string name = "yapp_tx_sequencer",uvm_component parent);
  super.new(name,parent);
  endfunction : new 
 
  function void yapp_tx_sequencer::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("sequencer","start_of_simulation_phase",UVM_HIGH)
  endfunction


`endif //YAPP_TX_SEQUENCER_SV


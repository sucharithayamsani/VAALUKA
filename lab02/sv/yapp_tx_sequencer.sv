`ifndef YAPP_TX_SEQUENCER_SV
`define YAPP_TX_SEQUENCER_SV

class yapp_tx_sequencer extends uvm_sequencer #(yapp_packet);
`uvm_component_utils(yapp_tx_sequencer)

extern function new(string name = "yapp_tx_sequencer",uvm_component parent);

endclass
  function yapp_tx_sequencer:: new(string name = "yapp_tx_sequencer",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

`endif // YAPP_TX_SEQUENCER_SV


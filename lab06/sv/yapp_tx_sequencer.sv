`ifndef YAPP_TX_SEQUENCER_SV
`define YAPP_TX_SEQUENCER_SV

class yapp_tx_sequencer extends uvm_sequencer #(yapp_packet);
`uvm_component_utils(yapp_tx_sequencer)

 
  extern function new(string name = "yapp_tx_sequencer",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern function void start_of_simulation_phase(uvm_phase phase);
  extern task          run_phase(uvm_phase phase);
  extern function void extract_phase(uvm_phase phase);
  extern function void check_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern function void final_phase(uvm_phase phase);

endclass

  function  yapp_tx_sequencer:: new(string name = "yapp_tx_sequencer",uvm_component parent);
  super.new(name,parent);
  endfunction : new 
 
  function void yapp_tx_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info("sequencer","build_phase",UVM_LOW)
  endfunction:build_phase
  
  function void yapp_tx_sequencer:: connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  `uvm_info("sequencer","connect_phase",UVM_LOW)
  endfunction:connect_phase
  
  function void yapp_tx_sequencer::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("sequencer","end_of_elaboration_phase",UVM_LOW)
  endfunction : end_of_elaboration_phase

  function void yapp_tx_sequencer::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("sequencer","start_of_simulation_phase",UVM_LOW)
  endfunction
  
  task yapp_tx_sequencer:: run_phase(uvm_phase phase);
  `uvm_info("sequencer","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void yapp_tx_sequencer::extract_phase(uvm_phase phase);
  `uvm_info("sequencer","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
 function void yapp_tx_sequencer::check_phase(uvm_phase phase);
  `uvm_info("sequencer","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void yapp_tx_sequencer::report_phase(uvm_phase phase);
  `uvm_info("sequencer","report_phase",UVM_LOW)
  endfunction:report_phase

 function void yapp_tx_sequencer::final_phase(uvm_phase phase);
  `uvm_info("sequencer","final_phase",UVM_LOW)
  endfunction : final_phase



`endif //YAPP_TX_SEQUENCER_SV


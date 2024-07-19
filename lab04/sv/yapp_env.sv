`ifndef YAPP_ENV_SV
`define YAPP_ENV_SV

class yapp_env extends uvm_env;
`uvm_component_utils(yapp_env)
  
  yapp_tx_agent agent;
  
  extern function new(string name = "yapp_env",uvm_component parent=null);
  extern function void build_phase(uvm_phase phase);
  extern function void start_of_simulation_phase(uvm_phase phase);

   endclass
  function yapp_env:: new(string name ="yapp_env",uvm_component parent = null);
  super.new(name,parent);
  endfunction : new 

  function void yapp_env:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  agent = yapp_tx_agent::type_id::create("agent",this);
  endfunction

  function void yapp_env::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("environment","start_of_simulation_phase",UVM_HIGH)
  endfunction
`endif //YAPP_ENV_SV


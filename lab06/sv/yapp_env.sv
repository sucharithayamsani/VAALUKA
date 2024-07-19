`ifndef YAPP_ENV_SV
`define YAPP_ENV_SV

class yapp_env extends uvm_env;
`uvm_component_utils(yapp_env)
  
  yapp_tx_agent agent;
  
  extern function new(string name = "yapp_env",uvm_component parent=null);
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
  function yapp_env:: new(string name ="yapp_env",uvm_component parent = null);
  super.new(name,parent);
  endfunction : new 

  function void yapp_env:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  agent = yapp_tx_agent::type_id::create("agent",this);
  endfunction : build_phase
  
  function void yapp_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  `uvm_info("environment","connect_phase",UVM_LOW)
  endfunction : connect_phase
 
  function void yapp_env::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("environment","end_of_elaboration_phase",UVM_LOW)
  endfunction : end_of_elaboration_phase
  
  function void yapp_env::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("environment","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task yapp_env:: run_phase(uvm_phase phase);
  `uvm_info("environment","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void yapp_env::extract_phase(uvm_phase phase);
  `uvm_info("environment","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
 function void yapp_env::check_phase(uvm_phase phase);
  `uvm_info("environment","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void yapp_env::report_phase(uvm_phase phase);
  `uvm_info("environment","report_phase",UVM_LOW)
  endfunction:report_phase

 function void yapp_env::final_phase(uvm_phase phase);
  `uvm_info("environment","final_phase",UVM_LOW)
  endfunction : final_phase
`endif //YAPP_ENV_SV


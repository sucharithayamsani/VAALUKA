`ifndef ROUTER_TB_SV
`define ROUTER_TB_SV

class router_tb extends uvm_component;
  `uvm_component_utils(router_tb)

  yapp_env env;
  channel_env ch0,ch1,ch2;
  hbus_env hbus_h;


  extern function new(string name,uvm_component parent); 
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

function router_tb::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new

function void router_tb:: build_phase(uvm_phase phase);
  set_config_int( "*", "recording_detail", 1); 
  set_config_int("*","is_tx",0);
  set_config_int("*","num_masters",1);
  set_config_int("*","num_slaves",0);
  super.build_phase(phase);
  env= yapp_env::type_id::create("env",this);
  ch0 = channel_env::type_id::create("ch0",this);
  ch1 = channel_env::type_id::create("ch1",this);
  ch2 = channel_env::type_id::create("ch2",this);
  hbus_h = hbus_env::type_id::create("hbus_h",this);
  endfunction:build_phase

function void router_tb:: connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  `uvm_info("router_tb","connect phase",UVM_LOW);
 endfunction:connect_phase

function void router_tb::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
endfunction:end_of_elaboration_phase

function void router_tb::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("router_tb","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task router_tb:: run_phase(uvm_phase phase);
  `uvm_info("router_tb","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void router_tb::extract_phase(uvm_phase phase);
  `uvm_info("router_tb","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
 function void router_tb::check_phase(uvm_phase phase);
  `uvm_info("router_tb","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void router_tb::report_phase(uvm_phase phase);
  `uvm_info("router_tb","report_phase",UVM_LOW)
  endfunction:report_phase

 function void router_tb::final_phase(uvm_phase phase);
  `uvm_info("router_tb","final_phase",UVM_LOW)
  endfunction : final_phase

`endif // ROUTER_TB_SV


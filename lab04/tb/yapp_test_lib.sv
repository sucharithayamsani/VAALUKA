`ifndef YAPP_TEST_LIB_SV
`define YAPP_TEST_LIB_SV 
class base_test extends uvm_test;
`uvm_component_utils(base_test)

  extern function new(string name,uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
uvm_active_passive_enum is_active;
yapp_env env;
endclass
  
class short_packet_test extends base_test;
`uvm_component_utils(short_packet_test)

extern function new(string name,uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass

class set_config_test extends base_test;
`uvm_component_utils(set_config_test)

  extern function new(string name,uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);

 endclass

  function base_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new

  function short_packet_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function set_config_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new 


  function void base_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  env= yapp_env::type_id::create("env",this);
  uvm_config_wrapper::set(this, "env.agent.sequencer.run_phase","default_sequence",yapp_tx_seqs::type_id::get());
  endfunction

  function void short_packet_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void set_config_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  set_config_int("env.agent","is_active",UVM_PASSIVE);
  //uvm_config_db#(int)::set(null,"env.agent","is_active",UVM_PASSIVE);
  endfunction 
 
  function void base_test::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  endfunction 

  function void set_config_test::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  endfunction 

`endif //YAPP_TEST_LIB_SV


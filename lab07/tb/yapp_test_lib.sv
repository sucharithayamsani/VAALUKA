`ifndef YAPP_TEST_LIB_SV
`define YAPP_TEST_LIB_SV 
class base_test extends uvm_test;
`uvm_component_utils(base_test)

  extern function new(string name,uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
uvm_active_passive_enum is_active;
router_tb router_inst;
endclass
  
class short_packet_test extends base_test;
`uvm_component_utils(short_packet_test)

extern function new(string name,uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass

class short_incr_payload_test extends base_test;
`uvm_component_utils(short_incr_payload_test)

extern function new(string name,uvm_component parent);
extern function void build_phase(uvm_phase phase);
endclass

class exhaustive_seq_test extends base_test;
`uvm_component_utils(exhaustive_seq_test)

yapp_seq_lib sequence_lib;
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

  function short_incr_payload_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new
 
  function exhaustive_seq_test::new(string name,uvm_component parent);
  super.new(name,parent);
    endfunction : new
 

  function void base_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  env= yapp_env::type_id::create("env",this);
  uvm_config_wrapper::set(this, "router_inst.env.agent.sequencer.run_phase","default_sequence",six_yapp_seq::type_id::get());
  endfunction

  function void short_packet_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void short_incr_payload_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_wrapper::set(this, "router_inst.env.agent.sequencer.run_phase","default_sequence",yapp_111_seq::type_id::get());
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void exhaustive_seq_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  sequence_lib = yapp_seq_lib::type_id::create("sequence_lib",this);
  sequence_lib.selection_mode = UVM_SEQ_LIB_RANDC;
  sequence_lib.min_random_count = 1;
  sequence_lib.max_random_count = 7;
  void'(sequence_lib.randomize());
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  uvm_config_db#(uvm_sequence_base)::set(this,"router_inst.env.agent.sequencer.run_phase","default_sequence",sequence_lib);
    endfunction

  function void base_test::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  endfunction 
 
  function void exhaustive_seq_test::end_of_elaboration_phase(uvm_phase phase);
  sequence_lib.print();
  uvm_top.print_topology();
  endfunction 

  task base_test::run_phase(uvm_phase phase);
  phase.phase_done.set_drain_time(this, 200ns); 
  endtask

`endif //YAPP_TEST_LIB_SV


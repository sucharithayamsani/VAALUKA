`ifndef ROUTER_TEST_LIB_SV
`define ROUTER_TEST_LIB_SV 
class base_test extends uvm_test;
`uvm_component_utils(base_test)

uvm_active_passive_enum is_active;
router_tb router_inst;
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
  
class short_packet_test extends base_test;
`uvm_component_utils(short_packet_test)

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

class short_incr_payload_test extends base_test;
`uvm_component_utils(short_incr_payload_test)

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

class exhaustive_seq_test extends base_test;
`uvm_component_utils(exhaustive_seq_test)
uvm_active_passive_enum is_active;
yapp_seq_lib sequence_lib;
//router_tb router_inst;
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

  function base_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new
//UVM phases of base test
  function void base_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  router_inst= router_tb::type_id::create("router_inst",this);
  uvm_config_wrapper::set(this, "router_inst.env.agent.sequencer.run_phase","default_sequence",six_yapp_seq::type_id::get());
  endfunction : build_phase

  function void base_test::connect_phase(uvm_phase phase);
  `uvm_info("base_test","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void base_test::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  endfunction :end_of_elaboration_phase
  
  function void base_test::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("base_test","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task base_test:: run_phase(uvm_phase phase);
  phase.phase_done.set_drain_time(this, 200ns); 
  `uvm_info("base_test","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void base_test::extract_phase(uvm_phase phase);
  `uvm_info("base_test","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
 function void base_test::check_phase(uvm_phase phase);
  `uvm_info("base_test","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void base_test::report_phase(uvm_phase phase);
  `uvm_info("base_test","report_phase",UVM_LOW)
  endfunction:report_phase

 function void base_test::final_phase(uvm_phase phase);
  `uvm_info("base_test","final_phase",UVM_LOW)
  endfunction : final_phase

//UVM phases of short_packet_test
  function short_packet_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function void short_packet_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void short_packet_test::connect_phase(uvm_phase phase);
  `uvm_info("short_packet_test","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void short_packet_test::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("short_packet_test","end_of_elaboration_phase",UVM_LOW)
  endfunction:end_of_elaboration_phase

  function void short_packet_test::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("short_packet_test","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task short_packet_test:: run_phase(uvm_phase phase);
  `uvm_info("short_packet_test","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void short_packet_test::extract_phase(uvm_phase phase);
  `uvm_info("short_packet_test","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
  function void short_packet_test::check_phase(uvm_phase phase);
  `uvm_info("short_packet_test","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void short_packet_test::report_phase(uvm_phase phase);
  `uvm_info("short_packet_test","report_phase",UVM_LOW)
  endfunction:report_phase

 function void short_packet_test::final_phase(uvm_phase phase);
  `uvm_info("short_packet_test","final_phase",UVM_LOW)
  endfunction : final_phase


//UVM phases of short_incr_payload_test
  function short_incr_payload_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new

  function void short_incr_payload_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_wrapper::set(this, "router_inst.env.agent.sequencer.run_phase","default_sequence",yapp_111_seq::type_id::get());
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

 function void short_incr_payload_test::connect_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void short_incr_payload_test::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","end_of_elaboration_phase",UVM_LOW)
  endfunction:end_of_elaboration_phase

  function void short_incr_payload_test::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task short_incr_payload_test:: run_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void short_incr_payload_test::extract_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
  function void short_incr_payload_test::check_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void short_incr_payload_test::report_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","report_phase",UVM_LOW)
  endfunction:report_phase

 function void short_incr_payload_test::final_phase(uvm_phase phase);
  `uvm_info("short_incr_payload_test","final_phase",UVM_LOW)
  endfunction : final_phase

//UVM phases of exhaustive seq test 
  function exhaustive_seq_test::new(string name,uvm_component parent);
  super.new(name,parent);
    endfunction : new
 
  function void exhaustive_seq_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  sequence_lib = yapp_seq_lib::type_id::create("sequence_lib",this);
  sequence_lib.selection_mode = UVM_SEQ_LIB_RANDC;
  sequence_lib.min_random_count = 1;
  sequence_lib.max_random_count = 7;
  void'(sequence_lib.randomize());
  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  uvm_config_db#(uvm_sequence_base)::set(this,"router_inst.env.agent.sequencer.run_phase","default_sequence",sequence_lib);
  set_config_int("router_inst.env.agent","is_active",UVM_ACTIVE);
   `uvm_info("exhaustive_seq_test","build_phase",UVM_LOW)
    endfunction:build_phase

  function void exhaustive_seq_test::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
  `uvm_info("exhaustive_seq_test","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void exhaustive_seq_test::end_of_elaboration_phase(uvm_phase phase);
  sequence_lib.print();
  endfunction:end_of_elaboration_phase 

  function void exhaustive_seq_test::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task exhaustive_seq_test:: run_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void exhaustive_seq_test::extract_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
  function void exhaustive_seq_test::check_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void exhaustive_seq_test::report_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","report_phase",UVM_LOW)
  endfunction:report_phase

 function void exhaustive_seq_test::final_phase(uvm_phase phase);
  `uvm_info("exhaustive_seq_test","final_phase",UVM_LOW)
  endfunction : final_phase



  
`endif //ROUTER_TEST_LIB_SV


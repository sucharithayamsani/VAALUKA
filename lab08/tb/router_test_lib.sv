`ifndef ROUTER_TEST_LIB_SV
`define ROUTER_TEST_LIB_SV 
class base_test extends uvm_test;
`uvm_component_utils(base_test)

uvm_active_passive_enum is_active;
router_tb router_inst;
router_virtual_sequencer v_r_seqr;
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
  
class simple_test extends base_test;
`uvm_component_utils(simple_test)

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

class router_vtest_lib extends base_test;
`uvm_component_utils(router_vtest_lib)
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

//UVM phases of simple_test
  function simple_test::new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function void simple_test:: build_phase(uvm_phase phase);
  super.build_phase(phase);
   uvm_config_wrapper::set(this, "router_inst.env.agent.sequencer.run_phase","default_sequence",yapp_012_seq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch0.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch1.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch2.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());


  set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void simple_test::connect_phase(uvm_phase phase);
  `uvm_info("simple_test","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void simple_test::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("simple_test","end_of_elaboration_phase",UVM_LOW)
  endfunction:end_of_elaboration_phase

  function void simple_test::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("simple_test","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task simple_test:: run_phase(uvm_phase phase);
  `uvm_info("simple_test","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void simple_test::extract_phase(uvm_phase phase);
  `uvm_info("simple_test","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
  function void simple_test::check_phase(uvm_phase phase);
  `uvm_info("simple_test","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void simple_test::report_phase(uvm_phase phase);
  `uvm_info("simple_test","report_phase",UVM_LOW)
  endfunction:report_phase

 function void simple_test::final_phase(uvm_phase phase);
  `uvm_info("simple_test","final_phase",UVM_LOW)
  endfunction : final_phase

///////router_vtest_lib phases////////
function router_vtest_lib::new(string name = "router_vtest_lib",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function void router_vtest_lib:: build_phase(uvm_phase phase);
  super.build_phase(phase);
  r_v_seqr = router_virtual_sequencer::type_id::create("r_v_seqr",this);
  uvm_config_wrapper::set(this, "router_inst.r_v_seqr.run_phase","default_sequence",router_simple_vseq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch0.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch1.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
  uvm_config_wrapper::set(this, "router_inst.ch2.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
   set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
  endfunction

  function void router_vtest_lib::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  `uvm_info("router_vtest_lib","connect_phase",UVM_LOW)
  endfunction:connect_phase

  function void router_vtest_lib::end_of_elaboration_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","end_of_elaboration_phase",UVM_LOW)
  endfunction:end_of_elaboration_phase

  function void router_vtest_lib::start_of_simulation_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","start_of_simulation_phase",UVM_LOW)
  endfunction:start_of_simulation_phase

  task router_vtest_lib:: run_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","run_phase",UVM_LOW)
  endtask :run_phase
  
  function void router_vtest_lib::extract_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","extract_phase",UVM_LOW)
  endfunction:extract_phase
  
  function void router_vtest_lib::check_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","check_phase",UVM_LOW)
  endfunction:check_phase
 
 function void router_vtest_lib::report_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","report_phase",UVM_LOW)
  endfunction:report_phase

 function void router_vtest_lib::final_phase(uvm_phase phase);
  `uvm_info("router_vtest_lib","final_phase",UVM_LOW)
  endfunction : final_phase





  
`endif //ROUTER_TEST_LIB_SV


`ifndef YAPP_SEQ_LIB_SV
`define YAPP_SEQ_LIB_SV 

class yapp_seq_lib extends uvm_sequence_library#(yapp_packet);
`uvm_object_utils(yapp_seq_lib)
`uvm_sequence_library_utils(yapp_seq_lib)

extern function new(string name = "yapp_seq_lib");



endclass


function yapp_seq_lib:: new(string name = "yapp_seq_lib");
    super.new(name);

  add_sequence(yapp_012_seq::get_type());
  add_sequence(yapp_1_seq::get_type());
  add_sequence(yapp_111_seq::get_type());
  add_sequence(yapp_repeat_addr_seq::get_type()); 
  add_sequence(yapp_incr_payload_seq::get_type()); 
  add_sequence(yapp_rnd_seq::get_type()); 
  add_sequence(six_yapp_seq::get_type()); 
  init_sequence_library();
  endfunction :new
`endif //YAPP_SEQ_LIB_SV

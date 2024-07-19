`ifndef ROUTER_VIRTUAL_SEQS_SV
`define ROUTER_VIRTUAL_SEQS_SV

class router_simple_vseq extends uvm_sequence;

`uvm_object_utils(router_simple_vseq)
`uvm_declare_p_sequencer(router_virtual_sequencer)

hbus_small_packet_seq  hbus_sml_pckt_seq;
hbus_get_yapp_regs_seq hbus_rd_pktreg_seq;
yapp_012_seq yapp_012seq;
hbus_set_default_regs_seq hbus_def_seq;
 six_yapp_seq yapp_sixseq;

extern function new(string name = "router_simple_vseq");
extern virtual task body();
endclass

function router_simple_vseq:: new(string name="router_simple_vseq");
   super.new(name);  
   hbus_sml_pckt_seq = hbus_small_packet_seq::type_id::create("hbus_sml_pckt_seq");
   hbus_rd_pktreg_seq = hbus_get_yapp_regs_seq::type_id::create("hbus_rd_pktreg_seq");
   yapp_012seq = yapp_012_seq::type_id::create("yapp_012seq");
   hbus_def_seq = hbus_set_default_regs_seq::type_id::create("hbus_def_seq");
   yapp_sixseq = six_yapp_seq::type_id::create("yapp_sixseq");
 
endfunction :router_simple_vseq

task router_simple_vseq::body();
  if(starting_phase != null)
      starting_phase.raise_objection(this);
  hbus_sml_pckt_seq .start(p_sequencer.h_m_seqr);
  hbus_rd_pktreg_seq.start(p_sequencer.h_m_seqr);
  repeat(2) begin
    yapp_012seq.start(p_sequencer.y_t_seqr);
  end
  hbus_set_default_regs_seq.start(p_sequencer.h_m_seqr);
  hbus_def_seq.start(p_sequencer.h_m_seqr);
  yapp_sixseq.start(p_sequencer.y_t_seqr);
  if(starting_phase != null)
      starting_phase.drop_objection(this);
  
endtask:body


`endif //ROUTER_VIRTUAL_SEQS_SV

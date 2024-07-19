`ifndef YAPP_TX_SEQUENCER
`define YAPP_TX_SEQUENCER

class yapp_tx_seqs extends uvm_sequence #(yapp_packet);
`uvm_object_utils(yapp_tx_seqs)

  extern function new(string name = "yapp_tx_seqs");
  extern virtual task body();

endclass
  function yapp_tx_seqs:: new(string name = "yapp_tx_seqs");
    super.new(name);
  endfunction :new

  task yapp_tx_seqs::body();
 // if(starting_phase != null)starting_phase.raise_objection(this);
    repeat(10)
      begin
        req = yapp_packet::type_id::create("req");
        start_item(req);
        assert(req.randomize());
        finish_item(req); 
      //  `uvm_do(req);
        
        end
      //  if(starting_phase != null)starting_phase.drop_objection(this); 
          
  endtask : body

`endif //YAPP_TX_SEQUENCER



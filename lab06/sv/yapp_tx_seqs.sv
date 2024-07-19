`ifndef YAPP_TX_SEQUENCER
`define YAPP_TX_SEQUENCER

class yapp_tx_seqs extends uvm_sequence #(yapp_packet);
`uvm_object_utils(yapp_tx_seqs)

  extern function new(string name = "yapp_tx_seqs");
  extern virtual task body();

endclass
//sequence 012
class yapp_012_seq extends yapp_tx_seqs;
`uvm_object_utils(yapp_012_seq)

  extern function new(string name = "yapp_012_seq");
  extern virtual task body();

endclass
//sequence 1
class yapp_1_seq extends yapp_tx_seqs;
`uvm_object_utils(yapp_1_seq)

  extern function new(string name = "yapp_1_seq");
  extern virtual task body();

endclass
//sequence 111
class yapp_111_seq extends yapp_1_seq;
`uvm_object_utils(yapp_111_seq)

  extern function new(string name = "yapp_111_seq");
  extern virtual task body();

endclass
//sequence repeat previous packet
class yapp_repeat_addr_seq extends yapp_tx_seqs;
`uvm_object_utils(yapp_repeat_addr_seq)

  extern function new(string name = "yapp_repeat_addr_seq");
  extern virtual task body();
logic [5:0]prev_addr;
endclass
//sequence incr payload
class yapp_incr_payload_seq extends yapp_tx_seqs;
`uvm_object_utils(yapp_incr_payload_seq)

  extern function new(string name = "yapp_incr_payload_seq");
  extern virtual task body();

endclass 
//random sequence with count
class yapp_rnd_seq extends yapp_tx_seqs;
`uvm_object_utils(yapp_rnd_seq)
   rand int count;
   constraint count_value{count inside {[1:10]};}
   
  extern function new(string name = "yapp_rnd_seq");
  extern virtual task body();

endclass 
//random sequence with count equals to six
class six_yapp_seq extends yapp_rnd_seq;
`uvm_object_utils(six_yapp_seq)
   constraint count_value_new{count==6;}

   
  extern function new(string name = "six_yapp_seq");
  extern virtual task body();

endclass 



  function yapp_tx_seqs:: new(string name = "yapp_tx_seqs");
    super.new(name);
  endfunction :new
  
  function yapp_012_seq:: new(string name = "yapp_012_seq");
    super.new(name);
  endfunction :new

  function yapp_1_seq:: new(string name = "yapp_1_seq");
    super.new(name);
  endfunction :new
 
  function yapp_111_seq:: new(string name = "yapp_111_seq");
    super.new(name);
  endfunction :new

  function yapp_repeat_addr_seq:: new(string name = "yapp_repeat_addr_seq");
    super.new(name);
  endfunction :new

  function yapp_incr_payload_seq:: new(string name = "yapp_incr_payload_seq");
    super.new(name);
  endfunction :new 

  function yapp_rnd_seq:: new(string name = "yapp_rnd_seq");
    super.new(name);
  endfunction :new

  function six_yapp_seq:: new(string name = "six_yapp_seq");
    super.new(name);
  endfunction :new

////////////////////////////////////////////////////////
  task yapp_tx_seqs::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_tx_seqs",UVM_LOW)
    repeat(1)
      begin
     `uvm_do(req)
      end
  if(starting_phase != null)starting_phase.drop_objection(this);       
  endtask : body
///////////012 sequence body task////////////////////////
  task yapp_012_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_012_seq",UVM_LOW)
  `uvm_do_with(req,{req.address == 2'b00;}) 
  `uvm_do_with(req,{req.address == 2'b01;}) 
  `uvm_do_with(req,{req.address == 2'b10;}) 
  if(starting_phase != null)starting_phase.drop_objection(this); 
  endtask : body
///////////1 sequence body task////////////////////////
  task yapp_1_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_1_seq",UVM_LOW)
  `uvm_do_with(req,{req.address == 2'b01;})

  if(starting_phase != null)starting_phase.drop_objection(this); 
  endtask : body
///////////111 sequence body task////////////////////////
  task yapp_111_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_111_seq",UVM_LOW)
  repeat(3)
    begin
    super.body();
     end
  if(starting_phase != null)starting_phase.drop_objection(this);  
  endtask : body
///////////repeat prev addr sequence body task////////////////////////
  task yapp_repeat_addr_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_repeat_addr_seq",UVM_LOW)
  `uvm_do(req)
   prev_addr = req.address;
  `uvm_do_with(req,{req.address==prev_addr;})

  if(starting_phase != null)starting_phase.drop_objection(this);  
  endtask : body
//////////incr payload sequence//////////////////////////
  task yapp_incr_payload_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_incr_payload_seq",UVM_LOW)
  `uvm_create(req)
   assert(req.randomize());
      foreach(req.payload[i])  begin
      req.payload[i] = i;
      `uvm_send(req)
      end
 
 if(starting_phase != null)starting_phase.drop_objection(this);  
  endtask : body 
//////////random seq with count////////////////////////////
task yapp_rnd_seq::body();
if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","yapp_rnd_seq",UVM_LOW)
   randomize();
    repeat(count)
     begin
    `uvm_do(req)     
     end 
      
  if(starting_phase != null)starting_phase.drop_objection(this);  
  endtask : body 
//////////random seq with count equals to six////////////////////////////
task six_yapp_seq::body();
  if(starting_phase != null)starting_phase.raise_objection(this);
  `uvm_info("sequences","six_yapp_seq",UVM_LOW)

   super.body();
    if(starting_phase != null)starting_phase.drop_objection(this);  
  endtask : body 

`endif //YAPP_TX_SEQUENCER



`ifndef YAPP_PACKET_SV
`define YAPP_PACKET_SV

 typedef enum {GOOD_PARITY,BAD_PARITY} parity_t;
import uvm_pkg::*;
`include "uvm_macros.svh"

class yapp_packet extends uvm_sequence_item;

  rand bit [1:0]address;
  rand bit [5:0]length;
  rand bit [7:0]payload[];
  logic [7:0]parity;
  rand int packet_delay;
  rand parity_t parity_type;

  extern function new(string name = "yapp_packet");
  extern function bit [7:0]calc_parity();
  extern function void post_randomize();

`uvm_object_utils_begin(yapp_packet)                       //Field macros
  `uvm_field_int(address,UVM_DEFAULT)
  `uvm_field_int(length,UVM_DEFAULT)
  `uvm_field_array_int(payload,UVM_DEFAULT)
  `uvm_field_int(parity,UVM_DEFAULT)
  `uvm_field_int(packet_delay,UVM_DEFAULT)
  `uvm_field_enum(parity_t,parity_type,UVM_DEFAULT)
`uvm_object_utils_end
  
  
  constraint valid_address{address != 2'b11;}                //constraints
  constraint payload_length{length !=6'h00;}
  constraint parity_packet{parity_type dist{0:=5,1:=1};}
  constraint sizeofpacket{payload.size() == length;}
  constraint delay{packet_delay inside {[0:20]};}

  endclass
 
 function yapp_packet::new(string name = "yapp_packet");                 //new construct method
  super.new(name);
  endfunction

 function bit [7:0] yapp_packet::calc_parity();                           //Method for calculating parity
    parity=1;
    parity = address ^ length ^ parity;
    foreach(payload[i])
    begin
    parity = parity ^ payload[i];
    end
  return parity;
  endfunction

 function void  yapp_packet:: post_randomize();                                 //post randomize function
    if(parity_type == GOOD_PARITY)
      parity = calc_parity();
    else  begin
      logic [7:0]par_temp;
      bit [2:0]temp;
      par_temp = calc_parity();
      temp=$urandom_range(0,7);
      parity[temp] = ~par_temp[temp];
    end
  endfunction


 `endif // YAPP_PACKET_SV

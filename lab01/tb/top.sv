`ifndef TOP_SV
`define TOP_SV

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../sv/yapp_packet.sv"
module top();
  yapp_packet yapp_pack_h;
initial
begin
  for(int i=0;i<5;i++)  begin
  yapp_pack_h = new();
  yapp_pack_h.randomize;
   yapp_pack_h.print(uvm_default_table_printer);
  yapp_pack_h.print(uvm_default_tree_printer);

  end
end
 

endmodule

`endif //TOP_SV

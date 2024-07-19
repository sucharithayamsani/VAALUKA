
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../sv/yapp.svh"
module top();
  yapp_env    yapp_env_h;
  yapp_tx_seqs seq_h;
initial
begin
 //yapp_env_h = yapp_env::type_id::create("yapp_env_h",null);
yapp_env_h = new("yapp_env_h",null);
 end
initial
begin
uvm_config_wrapper::set(null, "yapp_env_h.agent.sequencer.run_phase","default_sequence",yapp_tx_seqs::type_id::get()); 
//seq_h.start("yapp_env_h.agent.sequencer");
run_test();
end

endmodule

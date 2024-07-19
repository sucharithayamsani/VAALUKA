`ifndef YAPP_TX_DRIVER
`define YAPP_TX_DRIVER

class yapp_tx_driver extends uvm_driver#(yapp_packet);
`uvm_component_utils(yapp_tx_driver)
 virtual interface yapp_if vif;

  extern function new(string name = "yapp_tx_driver",uvm_component parent);
  extern function build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern function void start_of_simulation_phase(uvm_phase phase);
   
  extern function reset_signals();
  extern task send_to_dut(input yapp_packet pkt);
  extern function get_and_drive();
  yapp_packet pkt;
endclass
  
  function  yapp_tx_driver::new(string name = "yapp_tx_driver",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  function yapp_tx_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!yapp_vif_config::get(this,"","vif", vif)) 
  `uvm_fatal("NOVIF",{"vif not set for: ",get_full_name(),".vif"})
  endfunction


  function  yapp_tx_driver::reset_signals();

  endfunction

  function get_and_drive();

  endfunction

  task  yapp_tx_driver::run_phase(uvm_phase phase);
    forever  begin
    seq_item_port.get_next_item(req); 
    send_to_dut(req);
    seq_item_port.item_done();
    reset_signals();
    end
  endtask


  task yapp_tx_driver:: send_to_dut(input yapp_packet pkt);
  `uvm_info("driver",$sformatf("packet is /n",pkt.sprint()),UVM_LOW)
  endtask
 
  function void  yapp_tx_driver:: start_of_simulation_phase(uvm_phase phase);
  `uvm_info("driver","start_of_simulation_phase",UVM_HIGH)
  endfunction

`endif //YAPP_TX_DRIVER





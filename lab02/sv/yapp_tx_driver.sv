`ifndef YAPP_TX_DRIVER
`define YAPP_TX_DRIVER
 
class yapp_tx_driver extends uvm_driver#(yapp_packet);
`uvm_component_utils(yapp_tx_driver)

  extern function new(string name = "yapp_tx_driver",uvm_component parent);
  extern task run_phase(uvm_phase phase);
  extern task send_to_dut(input yapp_packet pkt);

  yapp_packet pkt;
 endclass
 
 function yapp_tx_driver:: new(string name = "yapp_tx_driver",uvm_component parent);
  super.new(name,parent);
  endfunction : new 

  task yapp_tx_driver::run_phase(uvm_phase phase);
    forever  begin
    seq_item_port.get_next_item(req);
    req.print(); 
    send_to_dut(req);
    seq_item_port.item_done();
    end
  endtask


  task yapp_tx_driver:: send_to_dut(input yapp_packet pkt);
  `uvm_info("driver",$sformatf("packet is /n",pkt.sprint()),UVM_LOW)
  endtask

`endif //YAPP_TX_DRIVER



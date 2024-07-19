//--------monitor class---
class yapp_tx_monitor extends uvm_monitor;
  //----factory registration----
  `uvm_component_utils(yapp_tx_monitor)
  //---component construction---
  extern function new(string name="yapp_tx_monitor",uvm_component parent=null);
  //--declaring virtual interface---
  virtual interface yapp_if vif;
  int num_pkt_col;
  //--handle declaration for yapp_packet--
  yapp_packet packet_collected;
  //---Build phase------
  extern function void build_phase(uvm_phase phase);
  //----start of simulation phase-----
  extern function void start_of_simulation_phase(uvm_phase phase);
  //----collect_packet---------
  extern task collect_packet();
  //-----run phase----
  extern task run_phase(uvm_phase phase);
 

endclass
  //---component construction---
  function yapp_tx_monitor::new(string name="yapp_tx_monitor",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  //-----Build phase---
  function void yapp_tx_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    packet_collected = yapp_packet::type_id::create("packet_collected");
    if(!yapp_vif_config::get(this,"","vif",vif))
      `uvm_fatal("NO VIRTUAL INTERFACE",{"vif not set for:",get_full_name(),".vif"})
  endfunction
  //----start of simulation phase-----
  function void yapp_tx_monitor::start_of_simulation_phase(uvm_phase phase);
    `uvm_info("yapp_tx_monitor","Monitor class(start of simulation phase)",UVM_HIGH);
  endfunction
  // Collect Packets
  task yapp_tx_monitor::collect_packet();
      //Monitor looks at the bus on posedge (Driver uses negedge)
      @(posedge vif.in_data_vld);
      @(posedge vif.clock iff (!vif.in_suspend))
      // Begin transaction recording
      void'(this.begin_tr(packet_collected, "Monitor_YAPP_Packet"));
      `uvm_info(get_type_name(), "Collecting a packet", UVM_HIGH)
      // Collect Header {Length, Addr}
      { packet_collected.length, packet_collected.addr }  = vif.in_data;
      packet_collected.payload = new[packet_collected.length]; // Allocate the payload
      // Collect the Payload
      for (int i=0; i< packet_collected.length; i++) begin
         @(posedge vif.clock iff (!vif.in_suspend))
         packet_collected.payload[i] = vif.in_data;
      end
      // Collect Parity and Compute Parity Type
       @(posedge vif.clock iff !vif.in_suspend)
         packet_collected.parity = vif.in_data;
       packet_collected.parity_type = (packet_collected.parity == packet_collected.calc_parity()) ? GOOD_PARITY : BAD_PARITY;
      // End transaction recording
      this.end_tr(packet_collected);
      `uvm_info(get_type_name(), $sformatf("Packet Collected :\n%s", packet_collected.sprint()), UVM_LOW)
      num_pkt_col++;
      `uvm_info("yapp_tx_monitor",$sformatf("count in monitor num_pkt_col=%d ",num_pkt_col),UVM_LOW)
  endtask : collect_packet
  //-----run phase----
  task yapp_tx_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("yapp_tx_monitor",$sformatf("yapp_tx_monitor class"),UVM_LOW);
    forever 
      collect_packet();
  endtask 

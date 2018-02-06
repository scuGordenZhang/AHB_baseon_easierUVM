// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_slave_monitor.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Monitor for AHB_master
//=============================================================================

`ifndef AHB_SLAVE_MONITOR_SV
`define AHB_SLAVE_MONITOR_SV

// You can insert code here by setting monitor_inc_before_class in file AHB_master.tpl
import tb_parameters::*;
class AHB_slave_monitor extends uvm_monitor;

  `uvm_component_utils(AHB_slave_monitor)

  virtual AHB_slave_if vif;

  uvm_analysis_port #(ver_byte) analysis_port;
 	//Struct  
	// {	byte data;
	// 	bit [ADDRESS_WIDTH-1:0] address;
	// } ver_byte;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting monitor_inc_inside_class in file AHB_master.tpl
/*-------------------------------------------------------------------------------
-- Tasks
-------------------------------------------------------------------------------*/
	bit[ADDRESS_WIDTH-1:0] address;
	bit write;
	int lower_byte_lane, upper_byte_lane, number_bytes;
	task run_phase(uvm_phase phase);
		forever begin 
			@(posedge vif.clk)#1;
			if((vif.HTRANS==NONSEQ||vif.HTRANS==SEQ)&&(vif.HREADY))begin
				address = vif.HADDR;
				write = vif.HWRITE;
				number_bytes    = 2**vif.HSIZE;
				lower_byte_lane = vif.HADDR & ((1<<$clog2(DATA_WIDTH/8))-1);
				upper_byte_lane = lower_byte_lane + number_bytes -1; 
				fork 
					log_data_phase(write,lower_byte_lane,upper_byte_lane,address);
				join_none
			end
		end
	endtask : run_phase

	ver_byte verif_byte;
	task log_data_phase(input bit write, input int lower_byte_lane, input int upper_byte_lane,input [ADDRESS_WIDTH-1:0] address);
		@(posedge vif.clk);#1;
		wait(vif.HREADY);#1;
		for (int i = 0; i < DATA_LANES; i++) begin
			if(i>=lower_byte_lane && i<=upper_byte_lane) begin
				verif_byte.data = write ? vif.HWDATA[(i*8)+:8] : vif.HRDATA[(i*8)+:8];
				verif_byte.address = address + i - lower_byte_lane;
				analysis_port.write(verif_byte);
			end 
		end
	endtask : log_data_phase

endclass : AHB_slave_monitor 



function AHB_slave_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


// You can insert code here by setting monitor_inc_after_class in file AHB_master.tpl

`endif // AHB_SLAVE_MONITOR_SV


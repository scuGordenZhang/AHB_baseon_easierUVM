// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_slave_driver.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Driver for AHB_slave
//=============================================================================

`ifndef AHB_SLAVE_DRIVER_SV
`define AHB_SLAVE_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file AHB_slave.tpl

class AHB_slave_driver extends uvm_driver #(trans);

  `uvm_component_utils(AHB_slave_driver)

  virtual AHB_slave_if vif;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file AHB_slave.tpl
  /*-------------------------------------------------------------------------------
-- Tasks
-------------------------------------------------------------------------------*/
	task reset();
		vif.HREADY <= 0;
		vif.HRDATA <= 0;
		vif.HRESP  <= 0;
	endtask : reset

	bit[ADDRESS_WIDTH-1:0] address;
	bit[2:0] size;
	event read_data_phase;
	task execute_address_phase();
		reset();
		vif.HREADY <= 1;
		vif.HRESP  <= 0;
		forever begin 
			@(negedge vif.clk);
			if((!vif.HWRITE)&&((vif.HTRANS==NONSEQ)||(vif.HTRANS==SEQ))) begin
				address = vif.HADDR;
				size = vif.HSIZE;	
				fork
					execute_data_phase();
				join_none
			end			
		end
	endtask : execute_address_phase 

	task execute_data_phase();
			@(posedge vif.clk);
			vif.HRDATA <= get_data(address,size);
	endtask : execute_data_phase

	task run_phase(uvm_phase phase);
		execute_address_phase();		
	endtask : run_phase

endclass : AHB_slave_driver 


function AHB_slave_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file AHB_slave.tpl

`endif // AHB_SLAVE_DRIVER_SV


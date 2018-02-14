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

  uvm_tlm_analysis_fifo #(trans) master_trans_f;

  extern function new(string name, uvm_component parent);

  int HREADY_RATE = 100;
  int ERROR_RATE  = 0;

  // You can insert code here by setting driver_inc_inside_class in file AHB_slave.tpl
  /*-------------------------------------------------------------------------------
	-- Functions
	-------------------------------------------------------------------------------*/
	function void build_phase(uvm_phase phase);
      master_trans_f = new ("master_trans_f", this);
   endfunction : build_phase

   function update_slave_variables(input int HREADY_RATE, input int ERROR_RATE);
   	this.HREADY_RATE = HREADY_RATE;
   	this.ERROR_RATE = ERROR_RATE;   
   endfunction : update_slave_variables


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
					execute_data_phase(address,size);
				join_none
			end			
		end
	endtask : execute_address_phase 

	task execute_data_phase(input bit[ADDRESS_WIDTH-1:0] address, input bit[2:0] size);
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


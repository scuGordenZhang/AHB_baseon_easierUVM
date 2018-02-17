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

  int SLAVE_STALL_RATE;
  int ERROR_RATE;

  

  // You can insert code here by setting driver_inc_inside_class in file AHB_slave.tpl
  /*-------------------------------------------------------------------------------
	-- Functions
	-------------------------------------------------------------------------------*/
	function new(string name, uvm_component parent);
	  super.new(name, parent);
	  SLAVE_STALL_RATE = 0;
	  ERROR_RATE  = 0;
	endfunction : new


	function void build_phase(uvm_phase phase);
      master_trans_f = new ("master_trans_f", this);
   endfunction : build_phase

   function update_slave_variables(input int SLAVE_STALL_RATE, input int ERROR_RATE);
   	this.SLAVE_STALL_RATE = SLAVE_STALL_RATE;
   	this.ERROR_RATE = ERROR_RATE;   
   endfunction : update_slave_variables


  /*-------------------------------------------------------------------------------
	-- Tasks
	-------------------------------------------------------------------------------*/
	task reset();
		vif.HREADY <= 1;
		vif.HRESP  <= 0;
		vif.HRDATA <= 0;
	endtask : reset

	task handle_slave_responses();
		bit new_transaction;
		reset();
		forever begin 
			new_transaction = ((vif.HTRANS==NONSEQ)||(vif.HTRANS==SEQ))&& vif.HREADY;
			while ($urandom_range(0,99)<SLAVE_STALL_RATE) begin 
				vif.HREADY <= 0;
				vif.HRESP  <= 0;
				@(posedge vif.clk);
			end

			if(new_transaction && ($urandom_range(0,99)<ERROR_RATE)) begin
				vif.HREADY <= 0;
				vif.HRESP  <= 1;
				@(posedge vif.clk);
				vif.HREADY <= 1;
				vif.HRESP  <= 1;
				@(posedge vif.clk);
			end else begin 
				vif.HREADY <= 1;
				vif.HRESP  <= 0;
				@(posedge vif.clk);
			end



			
		end
	endtask : handle_slave_responses

	bit[ADDRESS_WIDTH-1:0] address;
	bit[2:0] size;
	task execute_data_phase();
		forever begin 
			@(negedge vif.clk);
			if((!vif.HWRITE)&& ((vif.HTRANS==NONSEQ)||(vif.HTRANS==SEQ))&&vif.HREADY) begin
				address = vif.HADDR;
				size = vif.HSIZE;	
				fork
					send_write_data(address,size);
				join_none
			end			
		end
	endtask : execute_data_phase 

	task send_write_data(input bit[ADDRESS_WIDTH-1:0] address, input bit[2:0] size);
			@(posedge vif.clk);
			vif.HRDATA <= get_data(address,size);
	endtask : send_write_data

	task run_phase(uvm_phase phase);
		fork
			handle_slave_responses();
			execute_data_phase();
		join_none

	endtask : run_phase

endclass : AHB_slave_driver 




// You can insert code here by setting driver_inc_after_class in file AHB_slave.tpl

`endif // AHB_SLAVE_DRIVER_SV


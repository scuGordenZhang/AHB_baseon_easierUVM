// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Sequence for agent AHB_master
//=============================================================================

`ifndef bad_slave_seq_SV
`define bad_slave_seq_SV
import tb_parameters::*;
class bad_slave_seq extends uvm_sequence #(trans);

  `uvm_object_utils(bad_slave_seq)


  extern function new(string name = "");
  extern task body();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

  // Every sequence must set master,slave variables
  // Master variables
  int GEN_RATE;
  int BUSY_RATE;
  // Slave variables
  int SLAVE_STALL_RATE;
  int ERROR_RATE;

endclass : bad_slave_seq


function bad_slave_seq::new(string name = "");
  super.new(name);
  // Master variables
  GEN_RATE = 100;
  BUSY_RATE = $urandom_range(20,70);
  
  // Slave variables
  SLAVE_STALL_RATE = $urandom_range(50,90);
  ERROR_RATE = $urandom_range(50,90);
endfunction : new


task bad_slave_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

  req = trans::type_id::create("req");
  repeat (TOTAL_TRANSFERS) begin 
    start_item(req); 
    if ( !req.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize transaction")
    $display("Generated transaction with properties:\n %s",req.convert2string);
    finish_item(req); 
  end
  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)



endtask : body


`ifndef UVM_POST_VERSION_1_1
function uvm_phase bad_slave_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void bad_slave_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// You can insert code here by setting agent_seq_inc in file AHB_master.tpl

`endif // AHB_MASTER_SEQ_LIB_SV


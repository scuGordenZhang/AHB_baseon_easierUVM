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

`ifndef busy_master_seq_SV
`define busy_master_seq_SV
import tb_parameters::*;
class busy_master_seq extends uvm_sequence #(trans);

  `uvm_object_utils(busy_master_seq)

  extern function new(string name = "");
  extern task body();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

endclass : busy_master_seq


function busy_master_seq::new(string name = "");
  super.new(name);
endfunction : new


task busy_master_seq::body();

  req = trans::type_id::create("req");
  repeat (TOTAL_TRANSFERS) begin 
    start_item(req); 
    if ( !req.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize transaction")
    req.BUSY_RATE = $urandom_range(50,90);
    $display("Generated transaction with properties:\n %s",req.convert2string);
    finish_item(req); 
  end

endtask : body


`ifndef UVM_POST_VERSION_1_1
function uvm_phase busy_master_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void busy_master_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// You can insert code here by setting agent_seq_inc in file AHB_master.tpl

`endif // AHB_MASTER_SEQ_LIB_SV


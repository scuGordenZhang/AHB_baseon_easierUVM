// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_slave_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Sequence item for AHB_slave_sequencer
//=============================================================================

`ifndef AHB_SLAVE_SEQ_ITEM_SV
`define AHB_SLAVE_SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file AHB_slave.tpl

class trans extends uvm_sequence_item; 

  `uvm_object_utils(trans)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file AHB_slave.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file AHB_slave.tpl



  extern function new(string name = "");

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file AHB_slave.tpl
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // You can insert code here by setting trans_inc_inside_class in file AHB_slave.tpl

endclass : trans 


function trans::new(string name = "");
  super.new(name);
endfunction : new


// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file AHB_slave.tpl

function void trans::do_copy(uvm_object rhs);
  trans rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
endfunction : do_copy


function bit trans::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
  trans rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  return result;
endfunction : do_compare


function void trans::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void trans::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
endfunction : do_record


function void trans::do_pack(uvm_packer packer);
  super.do_pack(packer);
endfunction : do_pack


function void trans::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
endfunction : do_unpack


function string trans::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());

  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file AHB_slave.tpl

`endif // AHB_SLAVE_SEQ_ITEM_SV


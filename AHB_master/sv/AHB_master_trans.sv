// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_seq_item.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Sequence item for AHB_master_sequencer
//=============================================================================

`ifndef AHB_MASTER_SEQ_ITEM_SV
`define AHB_MASTER_SEQ_ITEM_SV
// You can insert code here by setting trans_inc_before_class in file AHB_master.tpl
import tb_parameters::*;
class trans extends uvm_sequence_item; 

  `uvm_object_utils(trans)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file AHB_master.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file AHB_master.tpl


	function new(string name = "");
		super.new(name);
	endfunction : new

  // Transaction variables
  rand bit write;
  rand bit [2:0] size;
  rand bit [2:0] length;
  rand bit [ADDRESS_WIDTH-1:0] start_address;

  // AHB Master variables
  bit reset = 0;
  int GEN_RATE = 100;
  int BUSY_RATE = 0;

  // data must fit in the bus
  constraint size_c {size>=MIN_BURST_SIZE && size<=MAX_BURST_SIZE;}
  constraint size_fit_in_bus_c {(2**size)*8<=DATA_WIDTH;}

  // ahb -> only aligned transfers
  constraint address_c {(start_address%(2**size))==0;}

  // 
  constraint length_c {length>=MIN_BURST_LEN && length<=MAX_BURST_LEN;}

  // 
  constraint solve_order {solve size before start_address;}

  

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file AHB_master.tpl
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // You can insert code here by setting trans_inc_inside_class in file AHB_master.tpl

endclass : trans 





// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file AHB_master.tpl



function void trans::do_copy(uvm_object rhs);
  trans rhs_;
  if (!$cast(rhs_, rhs))
	 `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  write         = rhs_.write;        
  size          = rhs_.size;         
  length        = rhs_.length;       
  start_address = rhs_.start_address;
endfunction : do_copy


function bit trans::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
  trans rhs_;
  if (!$cast(rhs_, rhs))
	 `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  result &= comparer.compare_field("write", write,                 rhs_.write,         $bits(write));
  result &= comparer.compare_field("size", size,                   rhs_.size,          $bits(size));
  result &= comparer.compare_field("length", length,               rhs_.length,        $bits(length));
  result &= comparer.compare_field("start_address", start_address, rhs_.start_address, $bits(start_address));
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
  `uvm_record_field("write",         write)        
  `uvm_record_field("size",          size)         
  `uvm_record_field("length",        length)       
  `uvm_record_field("start_address", start_address)
endfunction : do_record


function void trans::do_pack(uvm_packer packer);
  super.do_pack(packer);
  `uvm_pack_int(write)         
  `uvm_pack_int(size)          
  `uvm_pack_int(length)        
  `uvm_pack_int(start_address) 
endfunction : do_pack


function void trans::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
  `uvm_unpack_int(write)         
  `uvm_unpack_int(size)          
  `uvm_unpack_int(length)        
  `uvm_unpack_int(start_address) 
endfunction : do_unpack


function string trans::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
	 "write         = 'h%0h  'd%0d\n", 
	 "size          = 'h%0h  'd%0d\n", 
	 "length        = 'h%0h  'd%0d\n", 
	 "start_address = 'h%0h  'd%0d\n",
   "reset = %b"},
	 get_full_name(), write, write, size, size, length, length, start_address, start_address,reset);
  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file AHB_master.tpl

`endif // AHB_MASTER_SEQ_ITEM_SV


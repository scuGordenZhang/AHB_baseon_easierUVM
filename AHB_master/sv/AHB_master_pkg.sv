// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Package for agent AHB_master
//=============================================================================

package AHB_master_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import util_pkg::*;


  `include "AHB_master_config.sv"
  `include "AHB_master_trans.sv"
  `include "AHB_master_scoreboard.sv"
  `include "AHB_master_driver.sv"
  `include "AHB_master_monitor.sv"
  `include "AHB_master_sequencer.sv"
  `include "AHB_master_coverage.sv"
  `include "AHB_master_agent.sv"
  `include "AHB_master_seq_lib.sv"

endpackage : AHB_master_pkg

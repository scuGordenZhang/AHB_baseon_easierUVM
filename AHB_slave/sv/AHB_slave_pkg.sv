// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_slave_pkg.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Package for agent AHB_slave
//=============================================================================

package AHB_slave_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import tb_parameters::*;
  import util_pkg::*;

  `include "AHB_slave_config.sv"
  `include "AHB_slave_trans.sv"
  `include "AHB_slave_scoreboard.sv"
  `include "AHB_slave_driver.sv"
  `include "AHB_slave_monitor.sv"
  `include "AHB_slave_sequencer.sv"
  `include "AHB_slave_coverage.sv"
  `include "AHB_slave_agent.sv"
  `include "AHB_slave_seq_lib.sv"

endpackage : AHB_slave_pkg

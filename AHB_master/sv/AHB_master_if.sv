// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_if.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Signal interface for agent AHB_master
//=============================================================================

`ifndef AHB_MASTER_IF_SV
`define AHB_MASTER_IF_SV

import tb_parameters::*;
interface AHB_master_if(); 

  timeunit      1ns;
  timeprecision 1ps;

  import AHB_master_pkg::*;

  logic clk;
  logic rst_n;

  logic [1:0]               HTRANS;
  logic [2:0]               HBURST;
  logic [ADDRESS_WIDTH-1:0] HADDR;
  logic [2:0]               HSIZE;
  logic                     HWRITE;
  logic                     HREADY;
  logic                     HRESP;
  logic [DATA_WIDTH-1:0]    HWDATA;
  logic [DATA_WIDTH-1:0]    HRDATA;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file AHB_master.tpl

endinterface : AHB_master_if

`endif // AHB_MASTER_IF_SV


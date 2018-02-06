// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_th.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Test Harness
//=============================================================================

module top_th;

  // timeunit      1ns;
  // timeprecision 1ps;


  // You can remove clock and reset below by setting th_generate_clock_and_reset = no in file common.tpl

  // Example clock and reset declarations
  logic clock = 0;
  logic reset;

  // Example clock generator process
  always #5 clock = ~clock;
  assign AHB_master_if_0.clk   = clock;
  assign AHB_master_if_0.rst_n = reset;
  assign AHB_slave_if_0.clk    = clock;
  assign AHB_slave_if_0.rst_n  = reset;
  

  // Example reset generator process
  initial
  begin
    reset = 0;         // Active low reset in this example
    #75 reset = 1;
  end



  // You can insert code here by setting th_inc_inside_module in file common.tpl

  // Pin-level interfaces connected to DUT
  // You can remove interface instances by setting generate_interface_instance = no in the interface template file

  AHB_master_if  AHB_master_if_0 ();
  AHB_slave_if   AHB_slave_if_0 (); 

  ahb2axi2ahb uut (
    .HCLK(AHB_master_if_0.clk),
    .HRESETn(AHB_master_if_0.rst_n),
    .sHTRANS(AHB_master_if_0.HTRANS),
    .sHBURST(AHB_master_if_0.HBURST),
    .sHADDR (AHB_master_if_0.HADDR),
    .sHSIZE (AHB_master_if_0.HSIZE),
    .sHWRITE(AHB_master_if_0.HWRITE),
    .sHREADY(AHB_master_if_0.HREADY),
    .sHRESP (AHB_master_if_0.HRESP),
    .sHWDATA(AHB_master_if_0.HWDATA),
    .sHRDATA(AHB_master_if_0.HRDATA),
    .mHTRANS(AHB_slave_if_0.HTRANS),
    .mHBURST(AHB_slave_if_0.HBURST),
    .mHADDR (AHB_slave_if_0.HADDR),
    .mHSIZE (AHB_slave_if_0.HSIZE),
    .mHWRITE(AHB_slave_if_0.HWRITE),
    .mHREADY(AHB_slave_if_0.HREADY),
    .mHRESP (AHB_slave_if_0.HRESP),
    .mHWDATA(AHB_slave_if_0.HWDATA),
    .mHRDATA(AHB_slave_if_0.HRDATA)
  );

endmodule


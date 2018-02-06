// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Configuration for agent AHB_master
//=============================================================================

`ifndef AHB_MASTER_CONFIG_SV
`define AHB_MASTER_CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file AHB_master.tpl

class AHB_master_config extends uvm_object;

  // Do not register config class with the factory

  virtual AHB_master_if    vif;
                  
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file AHB_master.tpl

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file AHB_master.tpl

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file AHB_master.tpl

endclass : AHB_master_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file AHB_master.tpl

function AHB_master_config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file AHB_master.tpl

`endif // AHB_MASTER_CONFIG_SV


// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_config.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Configuration for top
//=============================================================================

`ifndef TOP_CONFIG_SV
`define TOP_CONFIG_SV

// You can insert code here by setting top_env_config_inc_before_class in file common.tpl

class top_config extends uvm_object;

  // Do not register config class with the factory

  virtual AHB_master_if    AHB_master_vif;            
  virtual AHB_slave_if     AHB_slave_vif;             

  uvm_active_passive_enum  is_active_AHB_master       = UVM_ACTIVE;
  uvm_active_passive_enum  is_active_AHB_slave        = UVM_ACTIVE;

  bit                      checks_enable_AHB_master;  
  bit                      checks_enable_AHB_slave;   

  bit                      coverage_enable_AHB_master;
  bit                      coverage_enable_AHB_slave; 

  // You can insert variables here by setting config_var in file common.tpl
  
  // You can remove new by setting top_env_config_generate_methods_inside_class = no in file common.tpl

  extern function new(string name = "");

  // You can insert code here by setting top_env_config_inc_inside_class in file common.tpl

endclass : top_config 


// You can remove new by setting top_env_config_generate_methods_after_class = no in file common.tpl

function top_config::new(string name = "");
  super.new(name);

  // You can insert code here by setting top_env_config_append_to_new in file common.tpl

endfunction : new


// You can insert code here by setting top_env_config_inc_after_class in file common.tpl

`endif // TOP_CONFIG_SV


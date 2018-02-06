// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: AHB_master_coverage.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Coverage for agent AHB_master
//=============================================================================

`ifndef AHB_MASTER_COVERAGE_SV
`define AHB_MASTER_COVERAGE_SV

// You can insert code here by setting agent_cover_inc_before_class in file AHB_master.tpl

class AHB_master_coverage extends uvm_subscriber #(trans);

  `uvm_component_utils(AHB_master_coverage)

  AHB_master_config m_config;    
  bit               m_is_covered;
  trans             m_item;
     
  // You can replace covergroup m_cov by setting agent_cover_inc in file AHB_master.tpl
  // or remove covergroup m_cov by setting agent_cover_generate_methods_inside_class = no in file AHB_master.tpl

  covergroup m_cov;
    option.per_instance = 1;
    // You may insert additional coverpoints here ...

    cp_write: coverpoint m_item.write;
    //  Add bins here if required

    cp_size: coverpoint m_item.size;
    //  Add bins here if required

    cp_length: coverpoint m_item.length;
    //  Add bins here if required

    cp_start_address: coverpoint m_item.start_address;
    //  Add bins here if required

  endgroup

  // You can remove new, write, and report_phase by setting agent_cover_generate_methods_inside_class = no in file AHB_master.tpl

  extern function new(string name, uvm_component parent);
  extern function void write(input trans t);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

  // You can insert code here by setting agent_cover_inc_inside_class in file AHB_master.tpl

endclass : AHB_master_coverage 


// You can remove new, write, and report_phase by setting agent_cover_generate_methods_after_class = no in file AHB_master.tpl

function AHB_master_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_is_covered = 0;
  m_cov = new();
endfunction : new


function void AHB_master_coverage::write(input trans t);
  m_item = t;
  if (m_config.coverage_enable)
  begin
    m_cov.sample();
    // Check coverage - could use m_cov.option.goal instead of 100 if your simulator supports it
    if (m_cov.get_inst_coverage() >= 100) m_is_covered = 1;
  end
endfunction : write


function void AHB_master_coverage::build_phase(uvm_phase phase);
  if (!uvm_config_db #(AHB_master_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "AHB_master config not found")
endfunction : build_phase


function void AHB_master_coverage::report_phase(uvm_phase phase);
  if (m_config.coverage_enable)
    `uvm_info(get_type_name(), $sformatf("Coverage score = %3.1f%%", m_cov.get_inst_coverage()), UVM_MEDIUM)
  else
    `uvm_info(get_type_name(), "Coverage disabled for this agent", UVM_MEDIUM)
endfunction : report_phase


// You can insert code here by setting agent_cover_inc_after_class in file AHB_master.tpl

`endif // AHB_MASTER_COVERAGE_SV


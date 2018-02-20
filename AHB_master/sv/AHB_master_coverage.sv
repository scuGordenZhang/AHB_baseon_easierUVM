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
import tb_parameters::*;
class AHB_master_coverage extends uvm_subscriber#(trans);

  `uvm_component_utils(AHB_master_coverage)

  AHB_master_config m_config;    
  bit               m_is_covered;
  virtual AHB_master_if vif;
     
  // You can replace covergroup m_cov by setting agent_cover_inc in file AHB_master.tpl
  // or remove covergroup m_cov by setting agent_cover_generate_methods_inside_class = no in file AHB_master.tpl

  covergroup m_cov;
    option.per_instance = 1;
    
    RST: coverpoint vif.rst_n;
    WR: coverpoint vif.HWRITE;
    TRANS: coverpoint vif.HTRANS;
    SIZE: coverpoint vif.HSIZE{
      // 32bits width of bus -> 4bytes max -> max_size = 2
      ignore_bins size_out_of_bus = {[3:$]};
    }
    ERR: coverpoint vif.HRESP;
    BURST: coverpoint vif.HBURST{
      // wrap bursts currenlty not supported by master driver
      ignore_bins wrap_bursts = {2,4,6};
    }
    WDATA: coverpoint vif.HWDATA;
    RDATA: coverpoint vif.HRDATA;

    WRxSIZE: cross WR,SIZE;
    BURSTxSIZE: cross BURST,SIZE;
    WRxBURST: cross WR,BURST;
    WRxBURSTxSIZE: cross WR,BURST,SIZE;


  endgroup

  covergroup trans_cov;
    trans_write: coverpoint trans_item.write;
    trans_size:  coverpoint trans_item.size{
      // 32bits width of bus -> 4bytes max -> max_size = 2
      ignore_bins trans_size_out_of_bus = {[3:$]};
    }
    trans_len: coverpoint trans_item.length{
    // at ahb max burst == 16 beats
      ignore_bins len_over_16 = {0,[17:$]};
    }

  endgroup

  // You can remove new, write, and report_phase by setting agent_cover_generate_methods_inside_class = no in file AHB_master.tpl

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern task          run_phase(uvm_phase phase);

  // You can insert code here by setting agent_cover_inc_inside_class in file AHB_master.tpl
  trans trans_item;
  function void write(input trans t);
    trans_item = t;
    trans_cov.sample();

  endfunction : write


endclass : AHB_master_coverage 


// You can remove new, write, and report_phase by setting agent_cover_generate_methods_after_class = no in file AHB_master.tpl

function AHB_master_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_is_covered = 0;
  m_cov = new();
  trans_cov = new();
endfunction : new

task AHB_master_coverage::run_phase(uvm_phase phase);
  forever begin 
    @(negedge vif.clk);
    if(vif.HREADY) begin
      m_cov.sample();
    end
  end
endtask : run_phase




function void AHB_master_coverage::build_phase(uvm_phase phase);
  if (!uvm_config_db #(AHB_master_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "AHB_master config not found")

      vif = m_config.vif;
endfunction : build_phase


function void AHB_master_coverage::report_phase(uvm_phase phase);
  if (m_config.coverage_enable)
    `uvm_info(get_type_name(), $sformatf("Coverage score = %3.1f%%", m_cov.get_inst_coverage()), UVM_HIGH)
  else
    `uvm_info(get_type_name(), "Coverage disabled for this agent", UVM_MEDIUM)
endfunction : report_phase


// You can insert code here by setting agent_cover_inc_after_class in file AHB_master.tpl

`endif // AHB_MASTER_COVERAGE_SV


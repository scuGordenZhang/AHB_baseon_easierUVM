// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_env.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Environment for top
//=============================================================================

`ifndef TOP_ENV_SV
`define TOP_ENV_SV

// You can insert code here by setting top_env_inc_before_class in file common.tpl

class top_env extends uvm_env;

  `uvm_component_utils(top_env)

  extern function new(string name, uvm_component parent);


  // Child agents
  AHB_master_config    m_AHB_master_config;  
  AHB_master_agent     m_AHB_master_agent;  
  AHB_master_scoreboard m_scoreboard; 
  // AHB_master_coverage  m_AHB_master_coverage;

  AHB_slave_config     m_AHB_slave_config;   
  AHB_slave_agent      m_AHB_slave_agent;    
  AHB_slave_scoreboard s_scoreboard;
  // AHB_slave_coverage   m_AHB_slave_coverage; 

  Checker checker_h;

  top_config           m_config;
            
  // You can remove build/connect/run_phase by setting top_env_generate_methods_inside_class = no in file common.tpl

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern task          run_phase(uvm_phase phase);

  // You can insert code here by setting top_env_inc_inside_class in file common.tpl

endclass : top_env 


function top_env::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can remove build/connect/run_phase by setting top_env_generate_methods_after_class = no in file common.tpl

function void top_env::build_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "In build_phase", UVM_HIGH)

  // You can insert code here by setting top_env_prepend_to_build_phase in file common.tpl

  if (!uvm_config_db #(top_config)::get(this, "", "config", m_config)) 
    `uvm_error(get_type_name(), "Unable to get top_config")

  m_AHB_master_config                 = new("m_AHB_master_config");         
  m_AHB_master_config.vif             = m_config.AHB_master_vif;            
  m_AHB_master_config.is_active       = m_config.is_active_AHB_master;      
  m_AHB_master_config.checks_enable   = m_config.checks_enable_AHB_master;  
  m_AHB_master_config.coverage_enable = m_config.coverage_enable_AHB_master;

  // You can insert code here by setting agent_copy_config_vars in file AHB_master.tpl

  uvm_config_db #(AHB_master_config)::set(this, "m_AHB_master_agent", "config", m_AHB_master_config);
  if (m_AHB_master_config.is_active == UVM_ACTIVE )
    uvm_config_db #(AHB_master_config)::set(this, "m_AHB_master_agent.m_sequencer", "config", m_AHB_master_config);
    uvm_config_db #(AHB_master_config)::set(this, "m_AHB_master_agent.m_driver", "config", m_AHB_master_config);
  // uvm_config_db #(AHB_master_config)::set(this, "m_AHB_master_coverage", "config", m_AHB_master_config);

  m_AHB_slave_config                 = new("m_AHB_slave_config");         
  m_AHB_slave_config.vif             = m_config.AHB_slave_vif;            
  m_AHB_slave_config.is_active       = m_config.is_active_AHB_slave;      
  m_AHB_slave_config.checks_enable   = m_config.checks_enable_AHB_slave;  
  m_AHB_slave_config.coverage_enable = m_config.coverage_enable_AHB_slave;

  // You can insert code here by setting agent_copy_config_vars in file AHB_slave.tpl

  uvm_config_db #(AHB_slave_config)::set(this, "m_AHB_slave_agent", "config", m_AHB_slave_config);
  if (m_AHB_slave_config.is_active == UVM_ACTIVE )
    uvm_config_db #(AHB_slave_config)::set(this, "m_AHB_slave_agent.m_sequencer", "config", m_AHB_slave_config);
  // uvm_config_db #(AHB_slave_config)::set(this, "m_AHB_slave_coverage", "config", m_AHB_slave_config);


  m_AHB_master_agent    = AHB_master_agent   ::type_id::create("m_AHB_master_agent", this);
  // m_AHB_master_coverage = AHB_master_coverage::type_id::create("m_AHB_master_coverage", this);
  m_scoreboard = AHB_master_scoreboard::type_id::create("m_scoreboard",this);

  m_AHB_slave_agent     = AHB_slave_agent    ::type_id::create("m_AHB_slave_agent", this);
  // m_AHB_slave_coverage  = AHB_slave_coverage ::type_id::create("m_AHB_slave_coverage", this);
  s_scoreboard = AHB_slave_scoreboard::type_id::create("s_scoreboard",this);

  checker_h = Checker::type_id::create("checker_h",this);
  checker_h.master_scb = m_scoreboard;
  checker_h.slave_scb  = s_scoreboard;

 
  // You can insert code here by setting top_env_append_to_build_phase in file common.tpl

endfunction : build_phase


function void top_env::connect_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "In connect_phase", UVM_HIGH)

  // m_AHB_master_agent.analysis_port.connect(m_AHB_master_coverage.analysis_export);
  m_AHB_master_agent.analysis_port.connect(m_scoreboard.analysis_export);

  // m_AHB_slave_agent.analysis_port.connect(m_AHB_slave_coverage.analysis_export);
  m_AHB_slave_agent.analysis_port.connect(s_scoreboard.analysis_export);

  // You can insert code here by setting top_env_append_to_connect_phase in file common.tpl

endfunction : connect_phase


// You can remove end_of_elaboration_phase by setting top_env_generate_end_of_elaboration = no in file common.tpl

function void top_env::end_of_elaboration_phase(uvm_phase phase);
  uvm_factory factory = uvm_factory::get();
  `uvm_info(get_type_name(), "Information printed from top_env::end_of_elaboration_phase method", UVM_MEDIUM)
  `uvm_info(get_type_name(), $sformatf("Verbosity threshold is %d", get_report_verbosity_level()), UVM_MEDIUM)
  uvm_top.print_topology();
  factory.print();
endfunction : end_of_elaboration_phase


// You can remove run_phase by setting top_env_generate_run_phase = no in file common.tpl

task top_env::run_phase(uvm_phase phase);
  top_default_seq vseq;
  vseq = top_default_seq::type_id::create("vseq");
  vseq.set_item_context(null, null);
  if ( !vseq.randomize() )
    `uvm_fatal(get_type_name(), "Failed to randomize virtual sequence")
  vseq.m_AHB_master_agent = m_AHB_master_agent;
  vseq.m_AHB_slave_agent  = m_AHB_slave_agent; 
  vseq.set_starting_phase(phase);
  vseq.start(null);
  // You can insert code here by setting top_env_append_to_run_phase in file common.tpl

endtask : run_phase


// You can insert code here by setting top_env_inc_after_class in file common.tpl

`endif // TOP_ENV_SV


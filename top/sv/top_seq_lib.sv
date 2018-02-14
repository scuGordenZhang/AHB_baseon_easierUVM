// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_seq_lib.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2016-08-11 on Mon Jan 22 15:51:47 2018
//=============================================================================
// Description: Sequence for top
//=============================================================================

`ifndef TOP_SEQ_LIB_SV
`define TOP_SEQ_LIB_SV

class top_default_seq extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(top_default_seq)
/******************************
Sequences menu (set option at cmd)
1- Default sequence (ideal master & slave)
2- High busy rate @master
******************************/


  AHB_master_agent  m_AHB_master_agent;
  AHB_slave_agent   m_AHB_slave_agent; 
  int option;
  string cmd_option_i;

  // Sequence handles
  default_seq     seq;
  reset_seq       r_seq;
  busy_master_seq b_seq;



  // Number of times to repeat child sequences
  int m_seq_count = 1;

  extern function new(string name = "");
  extern task body();
  extern task pre_start();
  extern task post_start();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

task reset();
  r_seq = reset_seq::type_id::create("r_seq");
  r_seq.set_item_context(this, m_AHB_master_agent.m_sequencer);
  if ( !r_seq.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize sequence")
  r_seq.set_starting_phase( get_starting_phase() );
  r_seq.start(m_AHB_master_agent.m_sequencer, this);
endtask : reset

task read_option_from_cmd();
  void'(uvm_cmdline_proc.get_arg_value("+OPTION=",cmd_option_i));
  option = cmd_option_i.atoi();
endtask : read_option_from_cmd
  
endclass : top_default_seq


function top_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task top_default_seq::body();
  read_option_from_cmd();

  repeat (m_seq_count)
  begin
    fork
      if (m_AHB_master_agent.m_config.is_active == UVM_ACTIVE)
      begin
        // Start with reset seq
        reset();

        // Default sequence
        if(option==1) begin
          seq = default_seq::type_id::create("seq");
          seq.randomize();
          seq.start(m_AHB_master_agent.m_sequencer, this);
        end else if(option==2) begin
          b_seq = busy_master_seq::type_id::create("b_seq");
          b_seq.randomize();
          b_seq.start(m_AHB_master_agent.m_sequencer, this);
        end



        // End with reset seq
        reset();
      end
    join
  end
  
endtask : body


task top_default_seq::pre_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null)
    phase.raise_objection(this);
endtask: pre_start


task top_default_seq::post_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null) 
    phase.drop_objection(this);
endtask: post_start


`ifndef UVM_POST_VERSION_1_1
function uvm_phase top_default_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void top_default_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// You can insert code here by setting top_seq_inc in file common.tpl

`endif // TOP_SEQ_LIB_SV


class Checker extends  uvm_component;
	`uvm_component_utils(Checker)

	AHB_master_scoreboard master_scb;
	AHB_slave_scoreboard  slave_scb;

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new


	function bit compare_bytes(input ver_byte byte1,input ver_byte byte2);
		if (byte1.data=='hff || byte2.data=='hff) $fatal("Driver is supposed to write ff bytes to non-active bytes");
		return (byte1.data==byte2.data && byte1.address==byte2.address);
	endfunction : compare_bytes

	function void show_comparison(input ver_byte byte1,input ver_byte byte2);
		$display("Compare - START",);
		$display("byte1.address=%0h\tbyte1.data=%0h",byte1.address,byte1.data);
		$display("byte2.address=%0h\tbyte2.data=%0h",byte2.address,byte2.data);
		$display("Compare - END",);
	endfunction : show_comparison

	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(),$sformatf("Verification bytes left at master scoreboard %0d",master_scb.num()),UVM_MEDIUM);
		`uvm_info(get_type_name(),$sformatf("Verification bytes left at slave  scoreboard %0d",slave_scb.num()),UVM_MEDIUM);
      if(master_scb.num()>0) $fatal("Verification bytes left at master scoreboard");
      if(slave_scb.num()>0)  $fatal("Verification bytes left at slave  scoreboard");
   endfunction : report_phase

/*-------------------------------------------------------------------------------
-- Tasks
-------------------------------------------------------------------------------*/
	
	ver_byte master_byte,slave_byte;
	task run_phase(uvm_phase phase);
		forever begin 
			#1;
			while (master_scb.num()>0 && slave_scb.num()>0) begin 
				master_byte = master_scb.read();
				slave_byte  = slave_scb.read();
				if(!compare_bytes(master_byte,slave_byte)) 
					`uvm_fatal(get_type_name(), $sformatf("Bytes not equal\n", 
							 "Master scb address=%0h data=%0h\n", master_byte.address, master_byte.data, 
							 "Slave  scb address=%0h data=%0h\n", slave_byte.address,  slave_byte.data))
					// $fatal("Bytes not equal\n", 
					// 		 "Master scb address=%0h data=%0h\n", master_byte.address, master_byte.data, 
					// 		 "Slave  scb address=%0h data=%0h\n", slave_byte.address,  slave_byte.data);
				// show_comparison(master_byte,slave_byte);
			end
		end
	endtask : run_phase

endclass : Checker
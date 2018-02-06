class AHB_master_scoreboard extends  uvm_subscriber#(ver_byte);
	`uvm_component_utils(AHB_master_scoreboard)

	protected ver_byte ver_queue[$];

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new


	function void write(ver_byte t);
		$display("@%03t",$time()/1000/10,"cycle Master_scb:: Pushing byte=%02h @address=%0h",t.data,t.address);
		ver_queue.push_back(t);
	endfunction : write

	function int num();
		return ver_queue.size();
	endfunction : num

	function ver_byte read();
		return ver_queue.pop_front();
	endfunction : read

endclass : AHB_master_scoreboard
// data must fit in the bus
constraint size_c {size>=MIN_BURST_SIZE && size<=MAX_BURST_SIZE;}
constraint size_fit_in_bus_c {(2**size)*8<=DATA_WIDTH;}
// ahb -> only aligned transfers
constraint address_c {(start_address%(2**size))==0;}
// 
constraint length_c {length>=MIN_BURST_LEN && length<=MAX_BURST_LEN;}
// 
constraint solve_order {solve size before start_address;}
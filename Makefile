

build:
	verilator -Wall --trace --cc ca3.v ca_cell.v --exe ca.cpp

comp:
	make -C obj_dir -j -f Vca3.mk Vca3

run:
	obj_dir/Vca3

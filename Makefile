all: build comp run

build:
	verilator -Wall --trace --cc ca_cell.sv --exe ca_cell.cpp
	verilator -Wall --trace --cc ca2.v ca_cell.sv --exe ca2.cpp
	verilator -Wall --trace --cc ca3.sv ca_cell.sv --exe ca3.cpp

comp:
	make -C obj_dir -j -f Vca_cell.mk Vca_cell
	make -C obj_dir -j -f Vca2.mk Vca2
	make -C obj_dir -j -f Vca3.mk Vca3

run:
	obj_dir/Vca_cell
	obj_dir/Vca2
	obj_dir/Vca3

clean:
	rm -rf obj_dir

# Configurable variables
STOP_TIME?=10000ns
SIM_DIR?=out
SRC_DIR?=work
TST_DIR?=tst
WRK_DIR=$(SIM_DIR)
GHDL=ghdl
GHDLFLAGS=--workdir=$(WRK_DIR) --std=02 --ieee=synopsys --warn-unused -fexplicit
GTK=gtkwave
GTKFLAGS=--tcl_init init.tcl

# Rules
test: all $(TESTBENCH:.vhd=.vcd)
	$(GTK) $(GTKFLAGS) $(TESTBENCH:.vhd=.vcd)

# Generic Targets
%.o : %.vhd
	$(GHDL) -s $(GHDLFLAGS) $<
	$(GHDL) -a $(GHDLFLAGS) $<

%.vcd: %.o
	$(GHDL) -r $(GHDLFLAGS) $(*F) --vcd=$@ --stop-time=$(STOP_TIME)

# Elaboration Targets
all: $(shell ls $(SRC_DIR)/*.vhd | sed 's/\.vhd/\.o/g') 

# Clean Rule
clean:
	rm -f $(TST_DIR)/*.vcd
	rm -f $(SIM_DIR)/*

# 'make depend'      uses makedepend to automatically generate dependencies
#                    (dependencies are added to end of Makefile)
# 'make'             build executable file 'mycc'
# 'make clean'       removes all .o files
# 'make clean all'   removes all .o files and executable file

# define the C++ compiler to use
RUST := cargo build
RUST_CLEAN := cargo clean && rm -rf Cargo.lock

# define any compile-time flags
#RUST_FLAGS := debug
RUST_FLAGS := release

# define the executable file
MAIN := target/$(RUST_FLAGS)/$(shell basename $(CURDIR))

.PHONY: depend clean

all:    $(MAIN)
	@echo Simple compiler has been compiled

$(MAIN): $(OBJS)
	$(RUST) --$(RUST_FLAGS)
	cp $(MAIN) . # Copy the binary out

clean:
	$(RUST_CLEAN)

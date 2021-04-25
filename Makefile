# 'make'             build executable file
# 'make clean'       removes all extra files

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

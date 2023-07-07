CC=riscv64-elf-gcc
CFLAGS=-g -Wl,-T,linker/virt.lds -nostartfiles -nostdlib
QEMU=qemu-system-riscv64
QEMUFLAGS=-machine virt -cpu rv64 -smp 1 -m 128M -nographic -serial mon:stdio -bios none -device virtio-keyboard-device

libs := src/boot.S src/uart.S

.PRECIOUS: bin/%
bin/%: $(libs) src/%.S
	mkdir -p bin
	$(CC) $(CFLAGS) $^ -o $@

.PHONY: task%
task%: bin/task%
	-$(QEMU) $(QEMUFLAGS) -kernel $^

.PHONY: clean
clean:
	rm -rf bin

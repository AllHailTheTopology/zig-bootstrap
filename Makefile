.PHONY: bootstrap run run-debug

bootstrap:
	zig build -Doptimize=Debug

run: bootstrap
	qemu-system-i386 -nographic -kernel ./zig-out/bin/bootstrap  \
	-debugcon file:debug.log

run-debug: bootstrap
	qemu-system-i386 -S -s -nographic -kernel ./zig-out/bin/bootstrap \
	-debugcon file:debug.log

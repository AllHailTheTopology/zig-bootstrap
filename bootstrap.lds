ENTRY(_start)

SECTIONS {
	. = 1M;

	.multiboot : {
		KEEP(*(.multiboot))
	}
	.text ALIGN(4K) : {
		*(.text .text.*)
	}
	.rodata ALIGN(4K) : {
		*(.rodata .rodata.*)
	}
	.data ALIGN(4K) : {
		*(.data .data.*)
	}
	.bss ALIGN(4K) : {
		bss_start = .;
		*(.bss .bss.*)
		. = ALIGN(4K);
		bss_end = .;
	}
	.stack ALIGN(4K) (NOLOAD) : {
		. = . + 16K;
		stack = .;
	}
}

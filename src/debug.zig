/// Methods for writing to QEMU's virtual console.
/// The virtual console's output facility is defined by the -debugcon flag, see
/// the MAN page for more details.
const DEBUG_IO_PORT: u16 = 0xE9;

pub fn writeByte(byte: u8) void {
    asm volatile (
        \\outb %[byte], %[port]
        :
        : [byte] "{al}" (byte),
          [port] "{dx}" (DEBUG_IO_PORT),
    );
}

pub fn writeString(string: []const u8) void {
    for (string) |byte| {
        writeByte(byte);
    }
}

const std = @import("std");

pub fn build(b: *std.Build) void {
    const bootstrap = b.addExecutable(.{
        .name = "bootstrap",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = b.resolveTargetQuery(.{
                .cpu_arch = .x86,
                .os_tag = .freestanding,
                .abi = .none,
            }),
            .optimize = b.standardOptimizeOption(.{}),
        }),
        .use_llvm = true,
        .use_lld = true,
    });

    bootstrap.setLinkerScript(b.path("bootstrap.lds"));
    b.installArtifact(bootstrap);
}

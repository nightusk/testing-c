const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("test", .{
        .root_source_file = b.path("zig/test.zig"),
        .target = target,
        .optimize = optimize,
    });
    mod.addCSourceFile(.{ .file = b.path("c/lib.c") });
    mod.addIncludePath(b.path("c"));

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
}

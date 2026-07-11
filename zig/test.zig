const std = @import("std");
const c = @cImport(@cInclude("lib.h"));

test "fibonacci number" {
    try std.testing.expect(c.fibonacci(6) == 8);
}

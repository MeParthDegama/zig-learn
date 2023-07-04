const std = @import("std");
const memAll = @import("./memAllo.zig");

pub fn main() !void {
    memAll.al(memAll.personInfo{
        .age = 1,
        .name = "Are Port!",
    }) catch std.debug.print("Error\n", .{});
}

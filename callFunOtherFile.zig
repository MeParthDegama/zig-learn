const std = @import("std");
const memAll = @import("./memAllo.zig");

const m = enum {
    qqq,
    www,
    q111,
};

pub fn main() !void {
    var pp = memAll.r(30);

    switch (pp) {
        memAll.m.apple=> std.debug.print("Apple...", .{}),
        memAll.m.orange=> std.debug.print("Orange...", .{}),
        memAll.m.banana => std.debug.print("Banana...", .{}),
    }

    std.debug.print("\n", .{});

    memAll.al(memAll.personInfo{
        .age = 1,
        .name = "Are Port!",
    }) catch std.debug.print("Error\n", .{});
}

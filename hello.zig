const std = @import("std");

pub fn main() !void{
    _ = try std.io.getStdOut().write("Hello, Conputers!\n");
    hello();
}

fn hello() void{
    std.debug.print("Hello, Computers!\n", .{});
}

const std = @import("std");

const myStruct = struct {
    const Self = @This();

    val: ?i64,

    fn init() Self {
        return myStruct{ .val = 123 };
    }

    fn print(self: Self) void {
        std.debug.print("{}", .{self.val orelse 12});
    }

    fn set(self: *Self, v: ?i64) void {
        self.val = v;
    }
};

pub fn main() void {
    var v1 = myStruct.init();
   
    v1.set(123333);
    v1.print();
    std.debug.print("\n", .{});
   
    v1.set(null);
    v1.print();
    std.debug.print("\n", .{});
   
    v1.set(42);
    v1.print();
    std.debug.print("\n", .{});
}

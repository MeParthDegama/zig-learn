const std = @import("std");

const personInfo = struct {
    name: []const u8,
    age: i32,
};

pub fn main() void {
    
    var me = personInfo{
        .age = 18,
        .name = "Paa!",
    };

    var myLeptop = personInfo{
        .age = 1,
        .name = "Are Po",
    };

    std.debug.print("", .{});

    std.debug.print("Name: {s} Age: {d}\n", .{me.name, me.age});
    std.debug.print("Name: {s} Age: {d}\n", .{myLeptop.name, myLeptop.age});

}

const std = @import("std");

const personInfo = struct {
    name: []const u8,
    age: i32,
};

pub fn main() !void {
    al(personInfo{
        .age = 18,
        .name = "Parthka!",
    }) catch std.debug.print("Error\n", .{});

    al(personInfo{
        .age = 1,
        .name = "Are Port!",
    }) catch std.debug.print("Error\n", .{});

    al(personInfo{
        .age = 1,
        .name = "xyz",
    }) catch std.debug.print("Error\n", .{});

    al(personInfo{
        .age = 2,
        .name = "Are Pi!",
    }) catch std.debug.print("Error\n", .{});
}

fn al(per: personInfo) !void {
    var allo = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = allo.deinit();

    if (std.mem.eql(u8, "xyz", per.name)) {
        return error.PermissionDenied;
    }

    var allocater = allo.allocator();

    var newPerson = try allocater.create(personInfo);
    newPerson.* = per;

    std.debug.print("Name: {s} Age: {d}\n", .{ newPerson.name, newPerson.age });

    allocater.destroy(newPerson);
}

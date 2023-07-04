const std = @import("std");

fn dynArr(comptime T: type) type {
    return struct {
        const Self = @This();
        //var allo = std.heap.GeneralPurposeAllocator(.{}){};
        var allo = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        var allocater = allo.allocator();

        head: ?*Node,
        last: ?*Node,

        const Node = struct {
            val: ?T,
            next: ?*Node,
        };

        fn init() Self {
            return Self{
                .last = null,
                .head = null,
            };
        }

        fn appendFirst(self: *Self, v: T) !void {
            var newNode = try allocater.create(Node);
            newNode.val = v;
            newNode.next = null;

            self.head = newNode;
            self.last = newNode;
        }

        fn append(self: *Self, v: T) !void {
            // var i = Node{
            //     .val = v,
            //     .next = null,
            // };

            var newNode = try allocater.create(Node);
            newNode.val = v;
            newNode.next = null;

            self.last.?.next = newNode;
            self.last = newNode;
        }

        fn get(self: Self) T {
            var l = self.last orelse &Node{
                .next = null,
                .val = null,
            };
            return l.val orelse 0;
        }

        fn print_all_debug(self: Self) void {
            var cur = self.head;

            while (true) {
                
                if (cur == null) {
                    break;
                }

                var l = cur orelse &Node{
                    .next = null,
                    .val = null,
                };

                std.debug.print("{}\n", .{l.val orelse 0});
            
                cur = cur.?.next;

            }

        }

        fn deinit(self: Self) void {
            _ = self;
            _ = allo.deinit();
        }
    };
}

pub fn main() !void {
    var a1 = dynArr(i64).init();
    defer a1.deinit();

    try a1.appendFirst(123);
    try a1.append(12222);
    try a1.append(454654);
    try a1.append(15544);

    a1.print_all_debug();
}

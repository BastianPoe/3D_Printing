union() {
    difference() {
        cube([42 + 2, 42 + 2 + 2, 63]);

        translate([2, 2, -1]) {
            cube([43, 42, 82]);
        }
    }

    translate([0, 0, 30]) {
        cube([10, 42 + 2 + 2, 3]);
    }
}
difference() {
    union() {
        // Main block
        cube([2, 26, 45]);

        translate([0, 1, 0]) {
            cube([10, 24, 45]);
        }

        translate([8, 0, 0]) {
            cube([2, 26, 45]);
        }

        // Circular top
        translate([0, 13, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=2, d=26);
            }
        }

        translate([0, 13, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=10, d=24);
            }
        }

        translate([8, 13, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=2, d=26);
            }
        }
    }

    // Main block opening
    translate([-1, 2.75, -1]) {
        cube([12, 20.5, 41]);
    }

    // Light opening
    translate([-1, 8, 42]) {
        rotate([10, 0, 0]) {
            cube([12, 12, 10]);
        }
    }
}

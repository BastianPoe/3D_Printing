difference() {
    union() {
        // Main block
        cube([2, 32.5, 45]);

        translate([0, 2, 0]) {
            cube([10, 28.5, 45]);
        }

        translate([8, 0, 0]) {
            cube([2, 32.5, 45]);
        }

        // Circular top
        translate([0, 16.25, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=2, d=32.5);
            }
        }

        translate([0, 16.25, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=10, d=28.5);
            }
        }

        translate([8, 16.25, 45]) {
            rotate([0, 90, 0]) {
                cylinder(h=2, d=32.5);
            }
        }
    }

    // Main block opening
    translate([-1, 6, -1]) {
        cube([12, 20.5, 41]);
    }

    // Light opening
    translate([-1, 11.25, 45]) {
        cube([12, 10.5, 8.5]);
    }
}

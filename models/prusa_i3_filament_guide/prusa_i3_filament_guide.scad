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
        
        // Front Donut
        difference() {
            translate([-3, 3, 42]) {
                rotate([90, 0, 0]) {
                    rotate_extrude(convexity = 10) {
                        translate([6, 0, 0]) {
                            circle(r = 3, $fn = 100);
                        }
                    }
                }
            }

            cube([10, 50, 50]);
        }

        // Back Donut
        difference() {
            translate([-3, 29.5, 42]) {
                rotate([90, 0, 0]) {
                    rotate_extrude(convexity = 10) {
                        translate([6, 0, 0]) {
                            circle(r = 3, $fn = 100);
                        }
                    }
                }
            }

            cube([10, 50, 50]);
        }
    }

    // Main block opening
    translate([-1, 6, -1]) {
        cube([12, 20.5, 41]);
    }
}
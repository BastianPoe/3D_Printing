length = 20;
glas = 6.3;

union() {
    difference() {
        translate([0, 0, -7]) {
            cube([8 + glas, 36, 19]);
        }
        
        translate([3.9, -1, 4]) {
            cube([glas, 38, 10]);
        }
        
        translate([-1, 10, 4]) {
            cube([16, 36, 12]);
        }
        
        translate([14, 10, -7.1]) {
            rotate([0, 0, 10.8]) {
                cube([10, 30, 80]);
            }
        }

        translate([-10, 10, -7.1]) {
            rotate([0, 0, -10.8]) {
                cube([10, 30, 80]);
            }
        }

    }

    difference() {
        translate([3.9, 25, -7]) {
            cube([30 + length, 11, 21]);
        }
        
        translate([10 + length, 26.9, -3]) {
            cube([16, 9.2, 50]);
        }
    }
}
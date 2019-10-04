difference() {
    cube([23.8, 23.8, 40]);
    
    translate([1.65, 1.65, -0.1]) {
        cube([20.8, 20.8, 41]);
    }

    translate([5, 32, 10]) {
        rotate([90, 0, 0]) {
            cylinder(h=50, r = 2);
        }
    }

    translate([17, 32, 10]) {
        rotate([90, 0, 0]) {
            cylinder(h=50, r = 2);
        }
    }

    translate([5, 32, 30]) {
        rotate([90, 0, 0]) {
            cylinder(h=50, r = 2);
        }
    }

    translate([17, 32, 30]) {
        rotate([90, 0, 0]) {
            cylinder(h=50, r = 2);
        }
    }    
}

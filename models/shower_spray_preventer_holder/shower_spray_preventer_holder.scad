
difference() {
    cube([14, 36, 12]);

    translate([3.9, -1, 4]) {
        cube([6.2, 38, 10]);
    }
    
    translate([-1, 10, 4]) {
        cube([16, 36, 12]);
    }
    
    translate([14, 10, -1]) {
        rotate([0, 0, 6.8]) {
            cube([10, 30, 8]);
        }
    }

    translate([-10, 10, -1]) {
        rotate([0, 0, -6.8]) {
            cube([10, 30, 8]);
        }
    }

}
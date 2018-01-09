$fn=50;

union() {
    hull() {
    
        translate([28, -28, 0]) {
            cube([40, 2, 29]);
        }
        
        translate([28, -30.5, 3.5]) {
            rotate([0, 90, 0]) {
                cylinder(h=40, r=4);
            }
        }
    }

    translate([28, -28, 27]) {
        cube([40, 50, 2]);
    }
}
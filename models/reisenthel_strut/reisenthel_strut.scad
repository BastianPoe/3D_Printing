$fn = 100;

difference() {
    cube([245, 24, 2.5]);
    
    translate([234.01, 12, -0.1]) {
        union() {
            cylinder(d=4.68, h=3);
            
            translate([0, -2, 0]) {
                cube([11, 4, 3]);
            }

            difference() {
                translate([11-3, -5, 0]) {
                     cube([3, 10, 2.7]);
                }
                
                translate([11-3, -2-3, -0.1]) {
                    cylinder(h=3, d=6);
                }

                translate([11-3, 2+3, -0.1]) {
                    cylinder(h=3, d=6);
                }
            }
        }
    }
    
    for ( i = [0.75  : 3 : 22] ) {           
        translate([0, i, 2]) {
            cube([245, 1.5, 1]);
        }

        translate([0, i, -0.5]) {
            cube([245, 1.5, 1]);
        }
    }
}
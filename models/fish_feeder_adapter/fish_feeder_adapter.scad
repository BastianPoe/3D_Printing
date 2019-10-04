$fn=40;

difference() {
    union() {
        // Internal Plate
        translate([0, 0.5, 0]) {
            cube([51.2, 46.7, 7]);
        }
        
        // Support plate
        translate([-2.5, -2.5, -2]) {
            cube([56.2, 118.6, 2]);
        }
    }
    
    // Cutout
    translate([1, 1, 0]) {
        // cube([49, 33, 10]);
    }

    // Pin Cutout
    translate([0, 35.7, 0]) {
        cylinder(r=4.5, h=10);
    }
    
    // Hole
    translate([16.5, 33/2, -3]) {
        cylinder(r1=7, r2=17, h=11);
    }
}
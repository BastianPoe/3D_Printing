$fn = 100;

difference() {
    union() {
        // Base Plate
        cylinder(h=3, r=20, center=true);

        // Pin
        translate([0, 0, 50]) {
            cylinder(h=100, r=8, center = true);
        }
        
        // Front Plate
        translate([0, 0, 100]) {
            cylinder(h=3, r=18, center=true);
        }
    }
    
    // Screw hole
    translate([0, 0, 52]) {
        cylinder(h=110, r=3, center=true);
    }
    
    // Mounting hole
    translate([0, 0, 45]) {
        cylinder(h=58, r=5, center=false);
    }
    
    // Printing surface
    translate([-22, -26.5, -5]) {
        cube([44, 20, 110]);
    }
}

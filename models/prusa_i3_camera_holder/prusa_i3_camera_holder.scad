camera_x = 30.4;
camera_y = 13;
camera_z = 29.4;

difference() {
    union() {
        // Main Cylinder
        translate([0, 0, -40]) {
            //cylinder(camera_z + 4 + 40, d=12, d=12);
        }
    
        // Main Cube
        translate([-6, -6, 0]) {
            cube([12, 12, camera_z + 4 + 34]);
        } 
        
        // Camera Holder
        translate([0, -6, 0]) {
            cube([camera_x + 14, 12, camera_z + 4]);
        }
        
        // Mounting Piece
        translate([-50, 4, 11]) {
            // cube([50, 2, camera_z + 4 - 11]);
        }
        
    }
    
    // Axis Mover
    translate([0, 0, -1]) {
        cylinder(12, d=22, d=22);
    }
    
    // Inner Cylinder
    translate([0, 0, 0]) {
        cylinder(camera_z + 6 + 40, d=8.4, d=8.4);
    }
    
    // Camera Holder Hole
    translate([12, -7, 2]) {
        cube([camera_x, 14, camera_z]);
    }
    
    // Cable Gland
    translate([12, 2, 2 + camera_z - 1]) {
        cube([camera_x, 5, 4]);
    }
    
    // Open Cylinder
    translate([-7, -7, camera_z+4]) {
        cube([14, 10, 41]);
    }
}
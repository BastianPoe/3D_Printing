$fn = 50;

cable_diameter = 7;
wall_thickness = 2;
spacing = 1;
tolerance = 0.2;

fastener_x = 10;
fastener_y = 10;
fastener_z = 10;

pcb_x = 137.5;
pcb_y = 56;
pcb_z = 19;

cable_y = 25;
cable_pin_diameter = 8;

pcb_hole1_diameter = 4;
pcb_hole1_x = 2.5;
pcb_hole1_y = 2.5;
pcb_hole1_height = 4;

pcb_hole2_diameter = pcb_hole1_diameter;
pcb_hole2_x = 135;
pcb_hole2_y = 2.5;
pcb_hole2_height = 4;

pcb_hole3_diameter = pcb_hole1_diameter;
pcb_hole3_x = 2.5;
pcb_hole3_y = 53;
pcb_hole3_height = 4;

pcb_hole4_diameter = pcb_hole1_diameter;
pcb_hole4_x = 135;
pcb_hole4_y = 53;
pcb_hole4_height = 4;

screw_hole1_x = pcb_hole1_x;
screw_hole1_y = pcb_hole1_y;
screw_hole1_diameter = 3;

screw_hole2_x = pcb_hole2_x;
screw_hole2_y = pcb_hole2_y;
screw_hole2_diameter = 3;

screw_hole3_x = pcb_hole3_x;
screw_hole3_y = 78;
screw_hole3_diameter = 3;

screw_hole4_x = pcb_hole2_x;
screw_hole4_y = screw_hole3_y;
screw_hole4_diameter = 3;

nut_diameter = 7;
nut_height = 2;

wall_y_end = 23;
wall_z = 15;

cable_opening_x = 52;
cable_opening_y = 2;
cable_opening_length = 30;
cable_opening_width = 4;

difference() {
    union() {
        // Housing
        difference() {
            cube([pcb_x + 2 * spacing + 2 * wall_thickness, pcb_y + cable_y + 2 * spacing + 2 * wall_thickness, pcb_z + spacing + 2 * wall_thickness + spacing]);
            
            translate([wall_thickness, wall_thickness, wall_thickness]) {
                cube([pcb_x + 2 * spacing, pcb_y + cable_y + 2 * spacing, pcb_z + spacing + 1 + spacing + wall_thickness]);
            }

            // Cable hole 1
            translate([-1, wall_thickness + spacing + pcb_y + cable_pin_diameter + spacing + wall_thickness, wall_thickness]) {
                // cube([1 + wall_thickness + 1, cable_diameter, spacing + pcb_y + spacing]);
            }

            translate([-1, wall_thickness + spacing + pcb_y + cable_pin_diameter + spacing + wall_thickness + cable_diameter/2 + tolerance, wall_thickness + cable_diameter/2 + tolerance]) {
                rotate([0, 90, 0]) {
                    cylinder(h=10, d = cable_diameter + 2 * tolerance);
                }
            }

            // Cable hole 2
            translate([-1 + wall_thickness + spacing + pcb_x + spacing, wall_thickness + spacing + pcb_y + cable_pin_diameter + spacing + wall_thickness, wall_thickness]) {
                // cube([1 + wall_thickness + 1, cable_diameter, spacing + pcb_y + spacing]);
            }
            translate([-1 + wall_thickness + spacing + pcb_x + spacing, wall_thickness + spacing + pcb_y + cable_pin_diameter + spacing + wall_thickness + cable_diameter / 2 + tolerance, wall_thickness + cable_diameter / 2 + tolerance]) {
                rotate([0, 90, 0]) {
                    cylinder(h=10, d = cable_diameter + 2 * tolerance);
                }
            }
        }

        // Pin 1 Support
        translate([wall_thickness + spacing + pcb_hole1_x, wall_thickness + spacing + pcb_hole1_y, wall_thickness]) {
            cylinder(h=pcb_hole1_height/2, d=max(pcb_hole1_diameter + tolerance + 3, nut_diameter + 1.5));
        }

        // Pin 2 Support
        translate([wall_thickness + spacing + pcb_hole2_x, wall_thickness + spacing + pcb_hole2_y, wall_thickness]) {
            cylinder(h=pcb_hole2_height/2, d=max(pcb_hole2_diameter + tolerance + 3, nut_diameter + 1.5));
        }

        // Pin 3 Support
        translate([wall_thickness + spacing + pcb_hole3_x, wall_thickness + spacing + pcb_hole3_y, wall_thickness]) {
            cylinder(h=pcb_hole3_height/2, d=max(pcb_hole1_diameter + tolerance + 3, nut_diameter + 1.5));
        }

        // Pin 4 Support
        translate([wall_thickness + spacing + pcb_hole4_x, wall_thickness + spacing + pcb_hole4_y, wall_thickness]) {
            cylinder(h=pcb_hole4_height/2, d=max(pcb_hole1_diameter + tolerance + 3, nut_diameter + 1.5));
        }

        // Strain relief 1
        translate([wall_thickness + spacing, wall_thickness + spacing + pcb_y + spacing + wall_thickness, wall_thickness]) {
            translate([cable_pin_diameter / 2, cable_pin_diameter / 2, 0]) {
                cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
            }
            
            translate([cable_pin_diameter / 2, cable_pin_diameter  + cable_diameter + cable_pin_diameter / 2, 0]) {
                cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
            }

            translate([cable_pin_diameter + sqrt(3/4 * cable_diameter * cable_diameter) + cable_pin_diameter / 2, cable_pin_diameter / 2 + cable_diameter, 0]) {
                cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
            }
            
        }

        // Strain relief 2
        translate([wall_thickness + spacing + pcb_x, wall_thickness + spacing + pcb_y + spacing + 23 + wall_thickness, wall_thickness]) {
            rotate([0, 0, 180]) {
                translate([cable_pin_diameter / 2, cable_pin_diameter / 2, 0]) {
                    cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
                }
                
                translate([cable_pin_diameter / 2, cable_pin_diameter  + cable_diameter + cable_pin_diameter / 2, 0]) {
                    cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
                }

                translate([cable_pin_diameter + sqrt(3/4 * cable_diameter * cable_diameter) + cable_pin_diameter / 2, cable_pin_diameter / 2 + cable_diameter, 0]) {
                    cylinder(h = 1.5 * cable_diameter, d = cable_pin_diameter);
                }
            }
        }
                    
        // Mounting Point 1
        difference() {
            translate([wall_thickness, wall_thickness, wall_thickness + spacing + pcb_z - 5]) {
                cube([screw_hole1_diameter*2.4, screw_hole1_diameter*2.4, 5]);
            }
            
            translate([wall_thickness + spacing + screw_hole1_x, wall_thickness + spacing + screw_hole1_y, wall_thickness + 9]) {
                cylinder(h=15, d=screw_hole1_diameter + tolerance);
            }
        }

        // Mounting Point 2
        difference() {
            translate([wall_thickness + spacing + pcb_x + spacing - screw_hole2_diameter*2.4, wall_thickness, wall_thickness + spacing + pcb_z - 5]) {
                cube([screw_hole2_diameter*2.4, screw_hole2_diameter*2.4, 5]);
            }
            
            translate([wall_thickness + spacing + screw_hole2_x, wall_thickness + spacing + screw_hole2_y, wall_thickness + 9]) {
                cylinder(h=15, d=screw_hole2_diameter + tolerance);
            }
        }

        // Mounting Point 3
        difference() {
            translate([wall_thickness, pcb_y + cable_y + 2 * spacing + wall_thickness - screw_hole3_diameter*2.4, wall_thickness + spacing + pcb_z - 5]) {
                cube([screw_hole3_diameter*2.4, screw_hole3_diameter*2.4, 5]);
            }
            
            translate([wall_thickness + spacing + screw_hole3_x, wall_thickness + spacing + screw_hole3_y, wall_thickness + 9]) {
                cylinder(h=15, d=screw_hole3_diameter + tolerance);
            }
        }

        // Mounting Point 4
        difference() {
            translate([wall_thickness + spacing + pcb_x + spacing - screw_hole3_diameter*2.4, pcb_y + cable_y + 2 * spacing + wall_thickness - screw_hole3_diameter*2.4, wall_thickness + spacing + pcb_z - 5]) {
                cube([screw_hole3_diameter*2.4, screw_hole3_diameter*2.4, 5]);
            }
            
            translate([wall_thickness + spacing + screw_hole4_x, wall_thickness + spacing + screw_hole4_y, wall_thickness + 9]) {
                cylinder(h=15, d=screw_hole4_diameter + tolerance);
            }
        }
    }

    // Nut Pin 1
    translate([wall_thickness + spacing + pcb_hole1_x, wall_thickness + spacing + pcb_hole1_y, -1]) {
        cylinder(h=1+nut_height, d=nut_diameter);
        cylinder(h=spacing + pcb_hole1_height + 5, d = pcb_hole1_diameter + tolerance);
    }

    // Pin 2
    translate([wall_thickness + spacing + pcb_hole2_x, wall_thickness + spacing + pcb_hole2_y, -1]) {
        cylinder(h=1+nut_height, d=nut_diameter);
        cylinder(h=spacing + pcb_hole2_height + 5, d = pcb_hole2_diameter + tolerance);
    }
 
    // Pin 3
    translate([wall_thickness + spacing + pcb_hole3_x, wall_thickness + spacing + pcb_hole3_y, -1]) {
        cylinder(h=1+nut_height, d=nut_diameter);
        cylinder(h=spacing + pcb_hole3_height + 5, d = pcb_hole3_diameter + tolerance);
    }

    // Pin 4
    translate([wall_thickness + spacing + pcb_hole4_x, wall_thickness + spacing + pcb_hole4_y, -1]) {
        cylinder(h=1+nut_height, d=nut_diameter);
        cylinder(h=spacing + pcb_hole4_height + 5, d = pcb_hole4_diameter + tolerance);
    }
}



// Top part
translate([0, pcb_y + cable_y + 10, 0]) {
    difference() {
        union() {
            // Deckel
            cube([pcb_x + 2 * spacing + 2 * wall_thickness, pcb_y + cable_y + 2 * spacing + 2 * wall_thickness, wall_thickness]);
            
            // Einsatz
            translate([wall_thickness + tolerance, wall_thickness + tolerance, wall_thickness]) {
                cube([pcb_x + 2 * spacing - 2 * tolerance, pcb_y + cable_y + 2 * spacing - 2 * tolerance, wall_thickness]);
            }
            
            // Isolationswand
            translate([wall_thickness + spacing, wall_thickness + spacing + wall_y_end - wall_thickness, wall_thickness * 2]) {
                cube([pcb_x, wall_thickness, wall_z]);
            }
            
            // Runterdrücker 1
            translate([wall_thickness + spacing + 10, wall_thickness + spacing + pcb_y + cable_y - cable_y, wall_thickness]) {
                cube([4, cable_y, (spacing + pcb_z + spacing) - 1.5 * cable_diameter - spacing]);
            }

            // Runterdrücker 2
            translate([wall_thickness + spacing + pcb_x + spacing - 10 - 4 - spacing, wall_thickness + spacing + pcb_y + cable_y - cable_y, wall_thickness]) {
                cube([4, cable_y, (spacing + pcb_z + spacing) - 1.5 * cable_diameter - spacing]);
            }
            
        }
        
        // Pin 1
        translate([wall_thickness + spacing + screw_hole1_x, wall_thickness + spacing + screw_hole1_y, -1]) {
            cylinder(h=1 + 2*wall_thickness + 1, d=pcb_hole1_diameter + tolerance);
            cylinder(h=1 + wall_thickness * 0.75, d=nut_diameter);
        }

        // Pin 2
        translate([wall_thickness + spacing + screw_hole2_x, wall_thickness + spacing + screw_hole2_y, -1]) {
            cylinder(h=1 + 2*wall_thickness + 1, d=pcb_hole1_diameter + tolerance);
            cylinder(h=1 + wall_thickness * 0.75, d=nut_diameter);
        }

        // Pin 3
        translate([wall_thickness + spacing + screw_hole3_x, wall_thickness + spacing + screw_hole3_y, -1]) {
            cylinder(h=1 + 2*wall_thickness + 1, d=pcb_hole1_diameter + tolerance);
            cylinder(h=1 + wall_thickness * 0.75, d=nut_diameter);
        }

        // Pin 4
        translate([wall_thickness + spacing + screw_hole4_x, wall_thickness + spacing + screw_hole4_y, -1]) {
            cylinder(h=1 + 2*wall_thickness + 1, d=pcb_hole1_diameter + tolerance);
            cylinder(h=1 + wall_thickness * 0.75, d=nut_diameter);
        }
        
        // Cable Opening
        translate([wall_thickness + spacing + pcb_x - cable_opening_x - cable_opening_length, wall_thickness + spacing + cable_opening_y, -1]) {
            cube([cable_opening_length, cable_opening_width, 1 + wall_thickness * 2 + 1]);
        }
    }
}

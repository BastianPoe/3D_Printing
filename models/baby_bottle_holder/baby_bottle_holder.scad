wall = 1;
diameter = 66;
height = 100;
holder_thick=2;
holder_length=30;
$fn=100;

difference() {
    hull() {
        cylinder(h=height*2, r=diameter/2+wall);
        
        // translate([-diameter/2-holder_thick-wall, -holder_length/2, 0]) {
        //     cube([2*holder_thick + diameter + 2*wall, holder_length, height*2]);
        // }
        oval(diameter/2+wall+holder_thick, diameter/2+wall, height*2);
    }
    
    translate([0, 0, wall]) {
        cylinder(h=height*2-wall+.1, r=diameter/2);
    }
    translate([0, 0, wall + height/2]) {
        cylinder(h=height*2-wall+.1, r=diameter/2+wall+0.1);
    }
    
    translate([-diameter/2, -diameter/2, wall + height/2]) {
        cube([diameter, diameter/2, height*1.45]);
    }
}

difference() {
    translate([diameter/2+wall, -holder_length, height*2]) { 
        rotate([0, 90, 90]) {
            difference() {
                cube([diameter+2*wall, diameter+2*wall, holder_length*2]);
                
                translate([5+diameter/2+wall, diameter/2+wall, -.1]) {
                    cylinder(r=diameter/2+2*wall, h=holder_length*2+.2);
                }
                
                translate([diameter/2, -.1, -.1]) {
                    cube([diameter+2*wall, diameter+2*wall+.2, holder_length*2+.2]);
                }
            }
        }
    }

    translate([0, 0, height]) {
        difference() {
            cylinder(h=height*2, r=diameter/2+wall+100);
            
            translate([0, 0, -.1]) {
                cylinder(h=height*2+.2, r=diameter/2+wall);
            }
        }
    }
}




module oval(w,h, height, center = false) {
    scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

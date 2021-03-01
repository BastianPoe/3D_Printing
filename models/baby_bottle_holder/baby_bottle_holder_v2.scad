wall = 1;
diameter = 66;
height = 100;
holder_thick=4;
holder_length=30;
mount_height=12;
mount_width=50;
margin=1;
$fn=200;

difference() {
    // Main Body
    hull() {
        cylinder(h=height*2, r=diameter/2+wall);
        oval(diameter/2+wall+holder_thick, diameter/2+wall, height*2+mount_height+2*wall+2*margin+2);
    }
    
    // Bottle stand
    translate([0, 0, wall]) {
        cylinder(h=height-wall+.1, r=diameter/2);
    }
    
    translate([0, 0, wall + height/2]) {
        cylinder(h=height*1-wall+.1, r=diameter/2+wall+0.1);
    }
    
    translate([0, -holder_length*2, height*2-diameter/2-wall]) { 
        rotate([0, 90, 90]) {
            cylinder(r=diameter/2, h=holder_length*4+.2);
        }
    }

    translate([-diameter/2, -diameter/2-wall, wall + height/2]) {
        cube([diameter, diameter+2*wall, height*1.15]);
    }
    
    // Aufnahme Querbalken
    translate([-diameter/2-wall-holder_thick, -diameter/2-wall, height*2+wall]) {
        cube([diameter+2*wall+2*holder_thick+.2, mount_width + 2*wall + 5, mount_height + 2*wall]);
    }
}

translate([-12, -diameter/2-wall+5, height*2+wall]) {
    // cube([18*2, 2*wall, 4*wall]);
}

translate([-8, -diameter/2-wall+5, height*2+1.5*wall]) {
    rotate([0, 90, 0]) {
        cylinder(r=2.5*wall, h=8*2);
    }
}

module oval(w,h, height, center = false) {
    scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

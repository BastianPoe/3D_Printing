difference() {
    cube([200, 29, 20]);

    translate([-1, 4.5, 11]) {
        rotate([360-20]) {
            cube([202, 13, 16]);
        }
    }
}
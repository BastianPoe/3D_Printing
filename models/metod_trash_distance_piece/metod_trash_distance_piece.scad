width = 20;
height = 20;
walls = 3;
gap = 14.5;
distance = 56;

difference() {
    // Main block
    cube([width, walls + gap + distance, height]);
    
    // Holder
    translate([-1, walls, -1]) {
        cube([width + 2, gap, height - walls + 1]);
    }
    
    // Lighter
    translate([-1, walls + gap + walls, walls]) {
        cube([width + 2, distance - 2 * walls, height - 2 * walls]);
    }
  
}
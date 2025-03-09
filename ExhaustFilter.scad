$fn = 128;

// height of ring
height = 10;

// printed wall thickness
thickness = 2;

// diameter of seal ring
ring = 5;

// diameters
diameter0 = 150;
diameter1 = 154;
diameter2 = 172 + 1 - ring;


module filter() {
    difference() {
        union() {
            cylinder(height, d = diameter2);
        }

        // make hollow
        translate([0, 0, -1]) {
            cylinder(height + 1 - thickness, d = diameter1);   
            cylinder(height + 2, d = diameter0);   
        }
        
        // notch for seal
        rotate_extrude(convexity = 10)
        translate([diameter2 / 2, height - ring, 0])
        circle(r = ring / 2);
    }
}

filter();


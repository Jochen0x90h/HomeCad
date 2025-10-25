$fn = 128;

// height of ring
height = 9.1;

// printed wall thickness
thickness = 2;

// diameters
diameter1 = 154 + 1; // tolerance
diameter2 = diameter1 + 2 * thickness;
//diameter3 = 170;
diameter3 = 182;
//diameter3 = 250;

// cable diameters
cable1 = 7;
cable2 = cable1 + 2 * thickness;
cable3 = 20;


module bushing(withCableRun) {
    difference() {
        union() {
            translate([0, 0, thickness])
            cylinder(height, d = diameter2);

            // rim
            rotate([0, 0, 45])
            cylinder(thickness, d1 = diameter3 - 2 * thickness, d2 = diameter3,
                $fn=$fn);
                //$fn=4);
        
            // cable run
            if (withCableRun)
            translate([(diameter1 + cable1) / 2, 0, 0]) {
                translate([0, 0, thickness])
                cylinder(height, d = cable2);
                
                cylinder(thickness, d1 = cable3 - 2 * thickness, d2 = cable3);
                translate([-cable2/2, 0, thickness + height/2])
                cube([cable2, cable2, height], center=true);
            }
            
            // pegs
            for (i = [1:1:35]) {
                rotate([0, 0, 2.5 + i * 10])
                translate([diameter1 / 2 + thickness / 2, 0, thickness])
                cylinder(h=height + 1, d=thickness);
            }
        }

        // make hollow
        translate([0, 0, -1])
        cylinder(height + 10, d = diameter1);   
        
        // cable run
        if (withCableRun)
        translate([(diameter1 + cable1) / 2, 0, -1]) {
            cylinder(height + 10, d = cable1);
            translate([-cable1/2, 0, (height + 10)/2])
            cube([cable1, cable1, height + 10], center=true);
        }

        // pegs
        for (i = [1:1:35]) {
            rotate([0, 0, -2.5 + i * 10])
            translate([diameter1 / 2 + thickness / 2, 0, thickness + height - 1.1])
            cylinder(h=2, d=thickness + 0.1);
        }
    }
}

//bushing(0);
bushing(1);


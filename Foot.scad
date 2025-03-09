$fn = 128;

difference() {

    minkowski() {
        difference() {
            intersection() {    
                union() {
                    translate([-4, 0, -12])
                    cylinder(h=50, d=24);

                    translate([4, 0, -12])
                    cylinder(h=50, d=24);        
                }    
                cube([100, 18, 100], center=true);
            }

            // cut off lower end
            rotate([0, 22, 0])
            translate([0, 0, -58])
            cube([100, 100, 100], center=true);
        }
        sphere(2);
    }

    // make hollow
    intersection() {    
        union() {
            translate([-4, 0, 0])
            cylinder(h=41, d=24);

            translate([4, 0, 0])
            cylinder(h=41, d=24);        
        }    
        cube([100, 18, 100], center=true);
    }
}
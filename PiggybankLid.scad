$fn = 128;

// Lid for a ceramic piggybank, prevents coins falling out

height = 6.5;
diameter = 30;
notch = 6;


difference() {
    union() {
        cylinder(h=height, d=diameter);

        cylinder(h=1.5, d=diameter+4);

        // notches
        translate([diameter/2, 0, 1.5+3])
        cylinder(h=2, d=notch);
        translate([-diameter/2, 0, 1.5+3])
        cylinder(h=2, d=notch);
    }


    translate([0, 0, -1])
    cylinder(h=height-2, d=diameter-4);
}

translate([0, 0, height/2])
cube([diameter-1, 1.5, height], center=true);
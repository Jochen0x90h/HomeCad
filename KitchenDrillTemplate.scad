$fn = 128;

width = 12;

difference() {
    translate([-width/2, -65, 0])
    cube([width, 70, 5]);

    translate([0, -60, -1])
    cylinder(h=7, d=3);
    
    translate([-7.5/2, -55, -1])
    cube([7.5, 20, 7]);

    translate([0, -65, -1])
    cylinder(h=7, d=1);
}

translate([-width/2, 0, -10])
cube([width, 5, 15]);

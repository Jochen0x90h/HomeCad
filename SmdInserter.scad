$fn = 128;

width = 12;
height = 10;


cube([width, 2, 30]);

translate([0, 0, 5 + 10])
rotate([-90, 0, 0])
intersection() {
    cylinder(h=height, d=10);
    translate([0, -5, 0])
    cube([10, 10, 10]);
}

translate([9, 0, 10])
cube([3, height, 10]);

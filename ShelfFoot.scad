$fn = 128;

height = 30;
insert = 12;

width = 60.5;
depth = 31.5;

w1 = 10;
d1 = 12;

w2 = 15.5;
d2 = 11.5;
x2 = 31.5;


// screw head M8
screwLength = 30.5;
screwDiameter = 8;
headWidth = 12.8;
headDiameter = 14.8;
headHeight = 5.4;

difference() {
    union() {
        // base
        translate([0, -5, 0])
        cube([width, depth + 10, 2]);

        // foot
        cube([width, depth, height]);

        // insert
        translate([2, 2, 0])
        cube([width-4, depth-4, height+insert]);
    }
    
    // notches
    translate([0, (depth-d1)/2, height])
    cube([w1, d1, insert+1]);
    translate([width-w1, (depth-d1)/2, height])
    cube([w1, d1, insert+1]);

    translate([-0.1, (depth-d1+4)/2, 2])
    cube([w1-2, d1-4, 100]);
    translate([width-w1+2.1, (depth-d1+4)/2, 2])
    cube([w1-2, d1-4, 100]);


    // side notches
    translate([x2, 0, height])
    cube([w2, d2, insert+1]);
    translate([x2, depth-d2, height])
    cube([w2, d2, insert+1]);
    
    translate([x2+2, -0.1, 2])
    cube([w2-4, d2-2, 100]);
    translate([x2+2, depth-d2+2.1, 2])
    cube([w2-4, d2-2, 100]);
    
    // fixation screw
    translate([x2+w2/2, 0, height + 7.5])
    rotate([-90, 0, 0])
    cylinder(h=100, d=4.4);
}


// board holders
translate([13.5, -5, 0])
difference() {
    cube([12, 4, 10]);

    translate([-1, 4, 8])
    rotate([30, 0, 0])
    cube([14, 4, 4]);
}

translate([13.5, depth + 1, 0])
difference() {
    cube([12, 4, 10]);

    translate([-1, 0, 8])
    rotate([60, 0, 0])
    cube([14, 4, 4]);
}

$fn = 128;

// Holder for a flat cover e.g. to hide the power supply of an LED stip

distance = 23; // at least 12
screwDepth = 2; // at least 0.3
tolerance = 0.2;

module base(tolerance) {
    w = (distance - 7) / 2;
    h = 70 + tolerance;
    translate([0, -w, 0])
    cube([10, w, h + 20]);

    translate([4-tolerance/2, -(w+4), 0])
    cube([2+tolerance, w+4, h + 5]);

    translate([5, -w-3-0.5, 0])
    cylinder(h=h, d=6+tolerance);
}

module screw() {
    w = (distance - 7) / 2;
    rotate([90, 0, 0]) {
        translate([0, 0, w - screwDepth])
        cylinder(h=20, d=8);

        translate([0, 0, w - screwDepth - 1.9])
        cylinder(h=2, d1=4, d2=8);

        translate([0, 0, -1])
        cylinder(h=20, d=4);
    }
}

module part1() {
    difference() {
        base(0);
        
        // screws
        translate([5, 0, 10])
        screw();
        translate([5, 0, 35])
        screw();
        translate([5, 0, 60])
        screw();
    }

    // "catcher"
    translate([5, -2, 75])
    rotate([90, 0, 0])
    linear_extrude(height = 10)
    polygon(points=[[-1,0], [1,0], [0,1.5]]);

}
    
module part2() {
    w = (distance - 7) / 2;
    w2 = distance - w;
    
    difference() {
        translate([0, -distance, 0])
        cube([10, w2-tolerance, 70]);

        base(tolerance);

        // "catcher"
        translate([5, -w-3-0.5, -0.1])
        cylinder(h=2.5, d1=8, d2=6);

        translate([5, 0, -4])
        rotate([90, 0, 0])
        linear_extrude(height = 10)
        polygon(points=[[-5,0], [5,0], [0,10]]);

        // screws
        translate([5, -distance, 0])
        rotate([0, 0, 180]) {
            translate([0, 0, 10])
            screw();
            translate([0, 0, 35])
            screw();
            translate([0, 0, 60])
            screw();
        }
    }
}


part1();

//part2();

//screw();

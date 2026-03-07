$fn=128;



// Holder for Ikea HÅLLBAR dustbin

thickness = 3.5;
hull() {
    translate([0, (thickness+1.5)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([0, (35-thickness)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([-10, (thickness+1.5)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([-10, (35-thickness)/2, thickness/2 + 1.5])
    sphere(d=thickness);
}
hull() {
    translate([0, -(thickness+1.5)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([0, -(35-thickness)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([-10, -(thickness+1.5)/2, thickness/2 + 1.5])
    sphere(d=thickness);
    translate([-10, -(35-thickness)/2, thickness/2 + 1.5])
    sphere(d=thickness);
}

difference() {
    translate([0, -20, 0])
    cube([100, 40, 19]);

    // screw holes
    translate([10, 0, -0.1]) {
        cylinder(h=50, d=4.4);
        cylinder(h=3.1, d1=9, d2=4.4);
    }
    translate([85, 0, -0.1]) {
        cylinder(h=50, d=4.4);
        cylinder(h=3.1, d1=9, d2=4.4);
    }
}

// distance holder
difference() {
    translate([90, -20, -6])
    cube([10, 40, 6]);

    hull() {
        translate([90, -20, -6])
        sphere(d=12);
        translate([90, 20, -6])
        sphere(d=12);
    }
}

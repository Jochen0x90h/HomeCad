$fn = 128;


d1 = 4.3 + 0.2; // M4 + tolerance
d2 = 5.6 + 0.2; // radius of nut + tolerance
d3a = 7.1;
d3b = 7.4;
d4 = 10.5;

h1 = 4;
h2 = 6;
h3 = h2 + 2;


difference() {
    union() {
        cylinder(h=h2, d=d4);
        translate([0, 0, h2])
        cylinder(h=h3 - h2, d1=d3a, d2=d3b);

        // dents to prevent rotation
        hull() {
            translate([d4 / 2, 1.5, 0])
            cylinder(h2, d=3);

            translate([d4 / -2, 1.5, 0])
            cylinder(h2, d=3);
        }
    }

    translate([0, 0, -1]) {
        cylinder(h=h3 + 2, d=d1);
        cylinder(h=h1 + 1, d=d2);
    }

    translate([0, 0, h1])
    cylinder(h=h2 - h1, d2=d1, d1=d2);
}

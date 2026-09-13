$fn = 128;

// Conical washer with 10mm outer diameter


difference() {
    cylinder(h=3.5, d=10);
    cylinder(h=3.6, d1=4.5, d2=10);
}
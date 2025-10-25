$fn = 128;

width = 12;
height = 20;

shaftDiameter = 3.5;
coneDiameter = 5.5;
coneHeight = 2;

screwDiameter = 3.0;
screwHeadDiameter = 7;
screwLength = 5;
screwConeHeight = 2.5;

difference() {
    union() {
        translate([0, -width/2, 0])
        cube([width*1.5, width, height/2]);

        // plate
        
        // position 1
        //rotate([0, 0, 0])
        
        // position 2
        //translate([width/2, -width/2, 0])
        //rotate([0, 0, 90])

        // position 3
        translate([width/2, width/2, 0])
        rotate([0, 0, -90])
        
        difference() {
            translate([0, -width, 0])
            cube([(width-shaftDiameter)/2, width*2, height]);


            // screw holes
            translate([(width-shaftDiameter)/2+0.1, width/2, height*3/4])
            rotate([0, -90, 0]) {
                cylinder(h = screwLength, d = screwDiameter, center = false);
                cylinder(h = screwConeHeight, d1 = screwHeadDiameter,
                    d2 = screwDiameter, center = false);
            }
            translate([(width-shaftDiameter)/2+0.1, -width/2, height*3/4])
            rotate([0, -90, 0]) {
                cylinder(h = screwLength, d = screwDiameter, center = false);
                cylinder(h = screwConeHeight, d1 = screwHeadDiameter,
                    d2 = screwDiameter, center = false);
            }   
        }
    }

    // slot for holding screw
    hull() {
        translate([width/2, 0, -1])
        cylinder(h = height/2+2, d = shaftDiameter, center = false);
        translate([width*2, 0, -1])
        cylinder(h = height/2+2, d = shaftDiameter, center = false);
    }
    hull() {
        translate([width/2, 0, -1])
        cylinder(h = coneHeight, d1 = coneDiameter, d2 = shaftDiameter, center = false);
        translate([width*2, 0, -1])
        cylinder(h = coneHeight, d1 = coneDiameter, d2 = shaftDiameter, center = false);
    }

    // bevel
    translate([width*1.5, 0, -9])
    rotate([0, 80, 0])
    cube([20, 20, 20], center = true);   
}


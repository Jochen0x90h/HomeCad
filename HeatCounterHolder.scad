$fn = 128;

// diameter of holder
diameter = 62.6;

// height of holder
height = 8;

// width and height of notch
notchWidth = 12;
notchHeight = 4;

// notch overlap
overlap = 2;


// screw hole diameter
holeDiameter = 3.8;



// base cylinder
difference() {
    cylinder(height, d = diameter);

    // make hollow
    translate([0, 0, 2])
        cylinder(height, d = diameter - 6);

    // drill holes
    for (i = [-20 : 40 : 20]){
        translate([i, 0, -1])
            cylinder(10, d = holeDiameter);
        //translate([i, 0, 0.1])
        //    cylinder(3, d1 = 3.2, d2 = 8);
    }

    // slits
    for (i = [90 : 120 : 330]){
        rotate([0, 0, i]) {
            translate([diameter/2, notchWidth/2, height/2])
            cube([notchWidth*2, 1, height+1], center=true);
            translate([diameter/2, -notchWidth/2, height/2])
            cube([notchWidth*2, 1, height+1], center=true);
        }
    }       

    // cut out notches
    intersection() {
        translate([0, 0, height - notchHeight/2 - overlap])
        rotate_extrude(convexity = 10)
        translate([diameter/2 + 1, 0, 0])
        circle(r = notchHeight/2, $fn = 100);

        for (i = [90 : 120 : 330]){
            rotate([0, 0, i]) {
                translate([diameter/2, 0, height/2])
                cube([notchWidth*2, notchWidth, height+1], center=true);
            }
        }       
    }

}




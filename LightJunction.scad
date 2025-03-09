$fn = 128;

sizeX = 35;
sizeY = 100;
sizeZ = 30;


module cutout(size, delta, side) {
    // hole
    rotate([90, 0, 0])
    scale([(size-delta)/size, (size+delta)/size, 1])
    cylinder(10, d=size, center=true);

    // cutout
    translate([0, 0, sizeZ*side])
    cube([size-delta, 10, 2*sizeZ], center=true);

    // chamfer
    translate([0, 0, sizeZ*0.5*side])
    rotate([0, 45, 0])
    cube([size*0.75, 10, size*0.75], center=true);
}

module cables(side) {
    // one cable at upper side
    translate([17.5, sizeY, 15]) {
        cutout(9.3, 0.5, side);
    }

    // two cables at lower side
    for (i = [10, 25]) {
        translate([i, 0, 15]) {
            cutout(9.8, 0.5, side);
        }
    }

}


module lower() {
    difference() {
        // box
        cube([sizeX, sizeY, sizeZ]);

        // make hollow
        translate([2, 2, 2])
        cube([sizeX - 4, sizeY - 4, sizeZ]);  

        // cable cutouts shifted by 0.1mm
        translate([0.1, 0, 0])
        cables(1);
    }
}

module upper() {
    difference() {
        // box
        translate([-2.25, -2.25, 0])
        cube([sizeX + 4.5, sizeY + 4.5, sizeZ + 2]);

        // make hollow
        translate([-0.25, -0.25, -2])
        cube([sizeX + 0.5, sizeY + 0.5, sizeZ + 2]);
        
        // cable cutouts shifted by 0.1mm
        translate([-0.1, 0, 0])
        cables(-1);
    }
}


/*
difference() {
    union() {
        lower();
        //translate([0, 0, 1])
        upper();
    }
    
    cube([80, 80, 80], center=true);
}*/


lower();
upper();

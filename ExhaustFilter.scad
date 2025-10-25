$fn = 128;

side = 1;

// height of ring
height = 10;

// printed wall thickness
thickness = 2;

// diameter of seal ring
ring = 2.5;

// diameters of screw holes
mount0 = 4.3; // M4
mount1 = 7;
mount2 = 12;
mountAngle = 30 * side;

// diameters of fan hole
fan1 = 144;
fan2 = 150;

// diameters of filter
filter2 = 171;
filter1 = filter2 - thickness * 2;

// diameters of seal ring
seal2 = filter2 + 1 - ring;
seal1 = seal2 - ring - thickness * 2;

// diameters of center "pipe" and bayonet
center2 = 27;
center1 = center2 - 2 * thickness;
center3 = center2 + 2 * 2;

// position of filter
filterY = -20;
filterX = -5 * side;

// heights
height1 = 13 + thickness; // height of filter support
height0 = height1 - 1 - ring; // lower border of seal ring
height2 = 23.5 + thickness;
height3 = 27.5 + thickness; // height of bayonet
height4 = height3 + 3;


module sector(radius, angles, $fn = $fn) {
    r = radius / cos(180 / $fn);
    step = 360 / $fn;
    points = concat(
        [[0, 0]],
        [for(a = [angles[0] : step : angles[1]])
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );
    polygon(points);
}


// filter mount
module mount(angle) {
    rotate([0, 0, angle])
    translate([123/2, 0, 0]) {
        difference() {
            hull() {
                cylinder(thickness, d = mount2);
                translate([10, -10, 0])
                cube([1, 20, thickness]);
            }

            // hole
            translate([0, 0, -1])
            cylinder(thickness + 2, d = mount0);
        }
    }
}

// seal ring
module seal() {
    rotate_extrude(convexity = 10)
    translate([seal2 / 2, height1 - ring / 2 - 1, 0])
    circle(r = ring / 2, $fn = 16);
}


// fan ring
difference() {
    union() {
        cylinder(thickness, d = fan2);
        translate([filterX, filterY, 0])
        cylinder(thickness, d = filter2);
    }

    // make hollow
    translate([0, 0, -1])
    intersection() {
        cylinder(thickness + 2, d = fan1);
        translate([filterX, filterY, 0])
        cylinder(thickness + 2, d = filter1);
    }
}

// fan mounts
for (i = [1:1:4]) {
    mount(mountAngle + i * 90);
}

// filter holder
translate([filterX, filterY, 0]) {
    difference() {
        // outer ring
        union() {
            cylinder(height0, d = filter2);
            cylinder(height1, d = seal2);
            cylinder(thickness, d = filter2 + 4);
        }

        // make hollow
        translate([0, 0, -2]) {
            cylinder(height0, d = filter1);
            translate([0, 0, height0])
            cylinder(2, d1 = filter1, d2 = seal1);
            cylinder(height1 + 3, d = seal1);
        }
        
        // notch for seal
        seal();
    }
  
    difference() {
        union() {
            // support
            translate([0, 0, height0/2]) {
                cube([filter1, thickness, height0], center = true);
                cube([thickness, filter1, height0], center = true);
            }
            translate([0, 0, height1/2]) {
                cube([seal1, thickness, height1], center = true);
                cube([thickness, seal1, height1], center = true);
            }
            translate([0, 0, height2/2]) {
                cube([100, thickness, height2], center = true);
                cube([thickness, 100, height2], center = true);
            }

            // center pipe
            cylinder(height4-2, d = center2);
            translate([0, 0, height4-2])
            cylinder(2, d1 = center2, d2 = center2-2);
        
            // bayonet
            translate([0, 0, height3]) {
                /*intersection() {
                    cylinder(height4 - height3, d = center3);
                    
                    for (i = [1:1:3]) {
                        rotate([0, 0, i * 120])
                        translate([center2 / 2, 0, 0])
                        cube([10, 13, 10], center = true);
                    }                    
                }*/
                
                for (i = [1:1:3]) {
                    linear_extrude(height = height4 - height3,
                        center = false, convexity = 10)
                    sector(center3 / 2, [i * 120, i * 120 + 54]);
                }
            }
        }
        
        // make hollow
        translate([0, 0, -1])
        cylinder(height4 + 2, d = center1);
    }
}

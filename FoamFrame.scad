$fn = 100; // smoothness

use <bottom_pin.scad>
          
// Parameters
frame_x = 8;
frame_y = 1.5;
frame_z = 8;
frame_width = 2;

module full_model() {
    union() {
        // Frame plate
        translate ([0, 0, frame_z/2])
        difference() {
            cube([frame_x, frame_y, frame_z], center=true);
            cube([frame_x-frame_width, frame_y+1, frame_z-frame_width], center=true);
        }
        // "Real" pin at the bottom
        translate ([0, 0, -20]) cylinder(d=6.2, h=20);

        // small holder pin at the top
        translate ([0, 0, frame_z]) cylinder(d=6.2,h=10);
    }
}

// split via duplication

translate([15,0,0]) {
difference() {
    full_model();
    union(){
        // cutting face
        translate([-frame_x, 0, -30])#cube([2*frame_x, 10, 60]);
        // peg
        translate([0, 0, -7]) rotate([0, 0, 0]) #cube([2, 25, 5], center=true);
        translate([0, 0, 13]) rotate([0, 0, 0]) #cube([2, 25, 5], center=true);
    }
}
}

slack=0.5;
difference() {
    full_model();
    difference(){
        // cutting face
        translate([-frame_x, -10, -30])#cube([2*frame_x, 10, 60]);
        // peg
        translate([0, 0, -7]) rotate([0, 0, 0]) #cube([2-slack, 25-slack, 5-slack], center=true);
        translate([0, 0, 13]) rotate([0, 0, 0]) #cube([2-slack, 25-slack, 5-slack], center=true);
    }
}

$fn = 100; // smoothness

use <bottom_pin.scad>
          
// Parameters
frame_x = 12;
frame_y = 4;
frame_z = 12;
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
        pin();
        // small holder pin at the top
        translate ([0, 0, frame_z + 5]) pin(height=5);
    }
}

// Split vertical front
module front_half() {
    intersection() {
        full_model();
        translate([0, -100, 0])
            #cube([200, 200, 200], center=true); // Front half
    }
}

// Split vertical back
module back_half() {
    intersection() {
        full_model();
        translate([0, 100, 0])
            #cube([200, 200, 200], center=true); // Front half
    }
}

front_half();
back_half();

// Exploded view
explode_offset = 5;  // How far to pull parts apart

translate([25, -explode_offset, 0])
    front_half();

translate([25, explode_offset, 0])
    back_half();
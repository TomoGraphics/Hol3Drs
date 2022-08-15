// For a collaboration with the University hospital in Bern were scanning 'bone domes' into which the bone grows into
// The goal is to look at volume and bone density, so we need to also scan a bone density phantom 
$fn=50;

use <bottom_pin.scad>


// define variables
height=7;
diameter=9;
wall_thickness=2;

// generate the two things we need
module dome() {
    #cylinder(d=diameter, h=height, center=true );
    }
module holder() {
    union() { // Collect the bottom pin and the cylinder
        translate([0,0,-wall_thickness]) {
            pin(height=15);
            cylinder(d=diameter+2*wall_thickness,h=height+2*wall_thickness, center=true);
            }
            // guard rails (one with a hole for orientation)
            translate([0, (-diameter-wall_thickness)/2, (height+wall_thickness)/2]) cube([diameter, wall_thickness, wall_thickness], center=true);            
            translate([0, (diameter+wall_thickness)/2, (height+wall_thickness)/2]) difference() {
                cube([diameter, wall_thickness,wall_thickness], center=true);
                cube([wall_thickness, wall_thickness, wall_thickness],center=true);
            }
        }
    }

// Collect dome and holder and 'drill' the latter into the former
difference(){
    holder();
    dome();
    }
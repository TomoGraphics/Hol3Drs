$fn = 25;

use <bottom_pin.scad>

wall_thickness=3;
box_width=100;
box_height=100;

pin(height=30);
translate([0, 0, box_height/2]) {
    difference(){
        union(){
            translate([0, 0, -box_height/2]) cube([5, 25, 5], center=true);
            translate([0, 0, -box_height/2]) cube([25, 5, 5], center=true);
            translate([0, 0, -box_height/2]) sphere(7.5);
            cube([box_width + wall_thickness/2, box_width+wall_thickness/2, box_height], center=true);
        }
    translate([0,0,wall_thickness]) #cube([box_width, box_width, box_height], center=true);
    }
}
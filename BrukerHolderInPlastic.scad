$fn = 100; // smoothness

use <bottom_pin.scad>

height = 30; 
// "Table" approximated by cylinder
difference(){
    cylinder(h=height, r1=3.5, r2=50);
    for ( i = [1:40:360]) 
        rotate([0, 0, i])
        translate([5, 5, height * 0.1])
        #cube([50, 5, height * 0.8]);
    for ( i = [20:40:360]) 
        rotate([0, 0, i])    
        translate([20, 5, height * 0.1])
        #cube([50, 5, height * 0.8]);
}
// pin at the bottom
pin();
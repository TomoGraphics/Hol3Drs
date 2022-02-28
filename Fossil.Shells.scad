$fn=250;

use <bottom_pin.scad>
          
module fishholder(cylinder_height,
            diameter,
            wall_thickness=1) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus the wall thickness
        union() { // Collect the bottom pin and the cylinder
            pin(height=15);
            cylinder(d=diameter+2*wall_thickness,h=cylinder_height);
                                }
                translate([0,0,wall_thickness * 2]) {
                
                    #cylinder(d=diameter, h=cylinder_height+1);
                                    }
                }
            }
// Print several of them
for (x = [1:3]) {
    for (y = [1:3]) {
        translate([x*15,y*15,0]) fishholder(15, 5, (x+y)/4);
        }
        }
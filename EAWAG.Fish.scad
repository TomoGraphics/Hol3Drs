$fn=25;

use <bottom_pin.scad>
          
module fishholder(cylinder_height,
            ellipse_diameter1,
            ellipse_diameter2,
            wall_thickness=2) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            pin(height=30);
            scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                cylinder(d=ellipse_diameter1+2*wall_thickness,h=cylinder_height);
                }
                }
                translate([0,0,wall_thickness * 2]) {
                    scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                    #cylinder(d=ellipse_diameter1, h=cylinder_height+1);
                        }
                    }
                }
            }

fishholder(170, 60, 40, wall_thickness=2);
translate([0,45,0]) fishholder(140, 50, 30, wall_thickness=2);
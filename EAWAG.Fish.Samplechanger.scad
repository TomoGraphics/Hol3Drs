$fn=50;

use <bottom_pin.scad>
          
module fishholder(cylinder_height,
            ellipse_diameter1,
            ellipse_diameter2,
            wall_thickness=2) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            pin(height=20);
            scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                cylinder(d=ellipse_diameter1+wall_thickness,h=cylinder_height);
                }
                }
                translate([0,0,wall_thickness]) {  // Move the drilling sphere and cylinder up
                    scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                    #cylinder(d=ellipse_diameter1, h=cylinder_height+1);
                        }
                    }
                }
            }

fishholder(100, 40, 30);
translate([0,30,0]) fishholder(100, 40, 25);
rotate([0,0,90]) translate([10,40,0]) fishholder(120, 60, 30);


            

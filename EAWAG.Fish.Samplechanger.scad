$fn=100;

module samplechanger(cylinder_height,
                    ellipse_diameter1,
                    ellipse_diameter2,
                    wall_thickness=1.5,
                    pin_height=3,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=21.5, h=pin_height); // Bottom pin
            scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                translate([0,0,pin_height]) { // Move the actual holder cylinder up
                    cylinder(d=ellipse_diameter1+wall_thickness,h=cylinder_height);
                    }
                }
                }
                translate([0,0,pin_height+wall_thickness]) {  // Move the drilling sphere and cylinder up
                    scale([1, ellipse_diameter2/ellipse_diameter1, 1]) { // squash the tube
                    #cylinder(d=ellipse_diameter1, h=cylinder_height+1);
                        }
                    }
                }
            }


use <bottom_pin.scad>
          
module fishholder(cylinder_height,
                    ellipse_diameter1,
                    ellipse_diameter2,
                    wall_thickness=1.5) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            pin(height=8);
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

samplechanger(70, 20.5, 13, pin_height=1.5);            
translate([25,0,0]) fishholder(70, 20.5, 13, pin_height=1.5);
            

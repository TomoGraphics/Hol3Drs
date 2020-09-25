$fn=100;

module sampleholder(cylinder_height,
                    ellipse_diameter1,
                    ellipse_diameter2,
                    wall_thickness=1,
                    pin_height=5,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=21, h=pin_height); // Bottom pin
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

sampleholder(70, 20.5, 13, pin_height=3);
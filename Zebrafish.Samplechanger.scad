$fn=50;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=1,
                    pin_height=10,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=8.4, h=pin_height); // Bottom pin
            scale([1, 0.618, 1]) { // squash the tube
                translate([0,0,pin_height]) { // Move the actual holder cylinder up
                    cylinder(d=cylinder_diameter+wall_thickness,h=cylinder_height);
                    }
                }
                }
                translate([0,0,pin_height+wall_thickness]) {  // Move the drilling sphere and cylinder up
                    scale([1, 0.618, 1]) { // squash the tube
                    #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                        }
                    }
                }
            }

sampleholder(25, 9, pin_height=3);
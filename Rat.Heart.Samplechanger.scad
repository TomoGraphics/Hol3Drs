$fn=100;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=2,
                    connector_height=2) {
    // Copied from 'GenericSampleHolder'
    sphere_center=connector_height+0.5*(cylinder_diameter-0.75*wall_thickness);
    difference() {
        union() { // Collect the bottom pin, the sphere and the cylinder
            cylinder(d=21.75, h=connector_height); // Connector to sample changer
            translate([0,0,sphere_center]) { // Move the sphere and cylinder up
                difference() { // Cut off the top half of the sphere with a cube
                        scale([1, 1, 1]) { // squash the sphere height if desired
                            sphere(d=cylinder_diameter+wall_thickness);
                        }
                        translate([-0.5*(cylinder_diameter+wall_thickness),
                                   -0.5*(cylinder_diameter+wall_thickness),
                                   0]) {
                            cube([cylinder_diameter+wall_thickness,
                                  cylinder_diameter+wall_thickness,
                                  0.5*(cylinder_diameter)+wall_thickness]);
                            }
                        }
                    cylinder(d=cylinder_diameter+wall_thickness,
                             h=cylinder_height);
                    }
            }
            translate([0,0,sphere_center]) { // Move the drilling sphere and cylinder up
                union() { // Collect the drilling sphere and cylinder
                    scale([1, 1, 1]) {
                        scale([1, 1, 1]) { // squash the sphere height if desired
                            #sphere(d=cylinder_diameter);
                        }
                        #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                    }
                }
            }
        }
    }
        

sampleholder(35, 24);
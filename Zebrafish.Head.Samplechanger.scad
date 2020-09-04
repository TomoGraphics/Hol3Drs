$fn=50;

module sampleholder(height=15,
                    upper_radius=10,
                    lower_radius=2,
                    wall_thickness=0.3,
                    pin_height=5,
                    ) {
    // Bottom; connector to sample holder
    cylinder(d=8.4, h=pin_height); 
    // Cup
    translate([0,0,pin_height])
        scale([1,.618,1]) {
            difference() {
                cylinder(h=height,
                         r1=lower_radius+wall_thickness,
                         r2=upper_radius+wall_thickness);
                translate([0,0,wall_thickness])
                cylinder(h=height,
                         r1=lower_radius,
                         r2=upper_radius);
                }
            }
        }

sampleholder(height=12, upper_radius=5, pin_height=3);
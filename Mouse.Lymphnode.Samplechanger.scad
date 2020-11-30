$fn=50;

module sampleholder(height=10,
                    upper_radius=3,
                    lower_radius=1,
                    wall_thickness=0.3,
                    pin_height=2,
                    ) {
    // Bottom; connector to sample holder
    cylinder(d=3.95, h=pin_height); 
    // Cup
    translate([0,0,pin_height])
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


for (i = [-1:2]){
    for (k = [-1:2]){
        translate([10*i, 10*k, 0])
            sampleholder();
    }
}
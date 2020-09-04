$fn=50;

module sampleholder(height=4,
                    upper_radius=1,
                    lower_radius=0.5,
                    wall_thickness=0.2,
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


for (i = [-1:1]){
    for (k = [-1:1]){
        translate([5*i, k*5, 0])
            sampleholder();
    }
}

for (i = [-1:1]){
    for (k = [-1:1]){
        translate([15+5*i, k*5, 0])
            sampleholder(upper_radius=1.25);
    }
}
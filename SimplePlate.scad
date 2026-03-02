// Some simple plates with an increasing diameter
$fn = 50;

plate_thickness = 3;
sphere_r = 6.3;
diameters = [20, 30, 40, 50, 60, 70]; 

use <bottom_pin.scad>

// Use a range-based loop to get an index (j)
for (i = [0 : len(diameters) - 1]) {
    d = diameters[i];
    translate([i * d * 0.618, i * d * 0.618, 0]) {     
        pin(height=30);
        cylinder(d=d, h=plate_thickness); 
        difference() { 
            sphere(r=sphere_r); 
            translate([-sphere_r, -sphere_r, plate_thickness])
                cube([sphere_r*2, sphere_r*2, sphere_r*2]);
        }
    }
}
// Some simple plates, efficiently packed
$fn = 50;

plate_thickness = 3;
sphere_r = 6.3;
diameters = [20, 30, 40, 50]; 

// maximize packing
num_plates = len(diameters);
columns = ceil(sqrt(num_plates)); // Rounds up to the nearest whole column
spacing = max(diameters) + 1;

use <bottom_pin.scad>

for (i = [0 : len(diameters) - 1]) {
    d = diameters[i];

    col = i % columns; 
    row = floor(i / columns); 

    translate([col * spacing, row * spacing, 0]) {
        pin(height=30);
        cylinder(d=d, h=plate_thickness); 

        difference() { 
            sphere(r=sphere_r); 
            translate([-sphere_r, -sphere_r, plate_thickness])
                cube([sphere_r*2, sphere_r*2, sphere_r*2]);
        }
    }
}
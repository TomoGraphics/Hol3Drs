$fn = 50;

use <bottom_pin.scad>

// --- Parameters ---
wall_thickness = 1.5;
outer_diameter = 55;
height = 25;
inner_diameter = outer_diameter - (2 * wall_thickness);

// Bottom pin
pin(height=25);
// Outer "Petri Dish"
difference() {
    cylinder(d=outer_diameter, h=height);
    translate([0, 0, wall_thickness]) 
        cylinder(d = inner_diameter, h = height);
}

// Receptables for the two small phantoms
cylinder(d=10, h=10);
translate([0, 0, (height / 2) - (10 / 2)]) { 
    for (p = [0:1]) {
        rotate([0, 0, 180 * p])
        translate([3, 0, 0])
        difference() {
            cylinder(d=4, h=10);
            translate([0, 0, wall_thickness]) cylinder(d = 4 - (wall_thickness / 2), h = 11);
        }
    }
    difference() {
        cylinder(d=10, h=10);
        translate([0, 0, wall_thickness]) cylinder(d = 10 - 1, h = 11);
    }
}

// Dividers and labels
num_holders = 8;
for (i = [0 : num_holders - 1]) {
    angle = i * 360 / num_holders;  
    // Walls
    rotate([0, 0, angle]) {
        translate([5, -0.5, 0]) 
            cube([inner_diameter/2 - 5, 1, height - 0.1]);
    }
    // Construct labels in the loop. Assisted by Google Gemini.
    // If 'i' is even (0, 2, 4, 6), letter is "A". If odd (1, 3, 5, 7), letter is "C".
    letter = (i % 2 == 0) ? "A" : "C";
    // Calculate the number group. 
    // floor(0/2)+1 = 1, floor(1/2)+1 = 1 -> (A1, C1)
    // floor(2/2)+1 = 2, floor(3/2)+1 = 2 -> (A2, C2)...
    number = floor(i / 2) + 1;
    // Combine them into a single string ("A1", "C1", etc.)
    current_label = str(letter, number);
    
    // Draw the Labels
    rotate([0, 0, angle + 22.5]) {
        translate([10, 0, wall_thickness]) { 
            rotate([0, 0, -90]) 
            linear_extrude(height = 2) { 
                text(
                    current_label,
                    size = 4, 
                    halign = "center", 
                    valign = "center"
                );
            }
        }
    }
}
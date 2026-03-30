$fn = 50;

// --- Configuration Variables ---
bucket_diameter = 111;
bucket_height = 150;
wall_thickness = 2.5;
wall_count = 4;
hole_frequency = 12;
seed_value = 42;

module single_wall(unique_seed) {
    // position single wall: move out by radius/2 and up by height/2 since we draw it centered
    translate([bucket_diameter/4, 0, bucket_height/2]) {
        difference() {
            // wall
            cube([bucket_diameter/2, wall_thickness, bucket_height], center=true);           
            // generate random (seeded) holes to save some material
            for (h = [1 : hole_frequency]) {
                // horizontally from center to edges of the wall segment
                random_x = rands(-bucket_diameter/4, bucket_diameter/4, 1, unique_seed + h)[0];
                // vertically
                random_z = rands(-bucket_height/2,
                    bucket_height/2,
                    1,
                    unique_seed + h + 100)[0];
                translate([random_x, 0, random_z])
                    rotate([90, 0, 0])
                        cylinder(d=5, h=wall_thickness + 2, center=true);
            }         
        }
    }
}

// Bucket (only for visualization)
%cylinder(d=bucket_diameter, h=bucket_height);
// Central post for stability
cylinder(h=bucket_height, r=5);
// some walls, N=wall_count
for (i = [0 : wall_count - 1]) {
    rotate([0, 0, i * (360 / wall_count)])
        single_wall(unique_seed = seed_value + (i * 500));
}
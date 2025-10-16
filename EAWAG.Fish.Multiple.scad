$fn = 25;

use <bottom_pin.scad>

wall_thickness=1.5;
fish_dorsoventral=38;
fish_lateral=20;
fish_anterioposterior=100;
shiftout = 0.62;

module sticklebackholder(label="lbl") {  
    // make a elliptic outer tube by scaling a cylinder and drilling out a thinner one inside it
    difference(){
        scale([0.5 * (fish_lateral + wall_thickness),
                0.5 * (fish_dorsoventral + wall_thickness),
                1])
        translate([0, 0, fish_anterioposterior * 0.25]) // move up a quarter of the fish length to accomodate for the chute             
        cylinder(r=1, h=fish_anterioposterior * 0.75); // outer
        translate([0, 0, fish_anterioposterior * 0.25])
        scale([0.5*fish_lateral,
            0.5*fish_dorsoventral,
            1])
        cylinder(r=1, h=fish_anterioposterior * 0.75 + wall_thickness);  // inner
    }
    // "chute" for the snout
    // rotate([3,0,0]) // tilt chute slightly    
    difference(){
        scale([0.5 * (fish_lateral + wall_thickness),
            0.5 * (fish_dorsoventral + wall_thickness),
            1])
        cylinder(h=fish_anterioposterior * 0.25, r1=0.5, r2=1);
        //translate([0, 0, wall_thickness])
        scale([0.5*fish_lateral,
            0.5*fish_dorsoventral,
            1])
        # cylinder(h=fish_anterioposterior * 0.25, r1=0.25, r2=1);
    }
    // label at the bottom
    translate([0, 0, -wall_thickness])
    #linear_extrude(wall_thickness)
    rotate([0,0,-90])
    text(str(label), size = fish_dorsoventral/4, halign = "center", valign = "center");
    }

// Bottom pin
pin(height=25);
cylinder(d=fish_dorsoventral * 1.25, h=wall_thickness);

num_holders = 3;

for (i = [0:num_holders - 1]) {
    angle = i * 360 / num_holders;
    // Fish
    rotate([0,0,angle]) // Rotate each holder around the center of the total holder
    translate([(fish_lateral + 3* wall_thickness) * shiftout, 0, 0]) // Move each holder out a bit
    rotate([0,0,0]) // Rotate each holder around itself
    {
        // Holders
        sticklebackholder(label=i+1);
        // Markers
        for (k = [1:i+1]) {
            translate([0, 0, -wall_thickness]) // translate them out
            rotate([0, 0, -2*k])
            translate([-fish_lateral / 2 - (0.5 * wall_thickness), (2 * k) - i, 0]) // translate them out
            #cylinder(r=0.618 * wall_thickness, h=fish_anterioposterior +  wall_thickness); //actual cylindrical markers
            } 
    }
}
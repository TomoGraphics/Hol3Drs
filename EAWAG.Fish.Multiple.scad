$fn = 100;

use <bottom_pin.scad>

wall_thickness=1;
fish_dorsoventral=35;
fish_lateral=22;
fish_anterioposterior=100;

module sticklebackholder(label="lbl") {  
    // make a cylinder and drill out a thinner one inside it
    difference(){
        scale([0.5 * (fish_lateral+wall_thickness),
                0.5 * (fish_dorsoventral+wall_thickness),
                1])
        cylinder(r=1, h=fish_anterioposterior);
        translate([0, 0, wall_thickness])
        scale([0.5*fish_lateral, 0.5*fish_dorsoventral, 1])
        # cylinder(r=1, h=fish_anterioposterior);
    }
    // label at the bottom
    translate([0, 0, -wall_thickness])
    #linear_extrude(wall_thickness)
    rotate([0,0,-90])
    text(str(label), size = fish_dorsoventral/4, halign = "center", valign = "center");
    }

// Bottom pin
pin(height=25);
cylinder(d=fish_dorsoventral, h=wall_thickness);

num_holders = 3;

for (i = [0:num_holders - 1]) {
    angle = i * 360 / num_holders;
    //echo(angle)
    rotate([0,0,angle]) // Rotate each holder around the center of the total holder
    translate([0.7 * fish_lateral, 0, 0]) // Move each holder out a bit
    rotate([0,0,0]) // Rotate each holder around itself
    sticklebackholder(label=i+1);
}
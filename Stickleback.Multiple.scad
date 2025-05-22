// Extrusion based on OpenSCAD example offset.scad
$fn = 50;

use <bottom_pin.scad>

wall_thickness=1;
fish_dorsoventral=15;
fish_anterioposterior=65;
fish_lateral=12;

module sticklebackholder(label="lbl") {
    // squash the cylinders below
    scale([1, fish_lateral/fish_dorsoventral, 1])
    // make a cylinder and cut out a thinner one from it
    difference() {
        cylinder(d=fish_dorsoventral+5+wall_thickness, h=fish_anterioposterior+5);
        translate([0, 0, wall_thickness]) #cylinder(d=fish_dorsoventral+5-(wall_thickness*2), h=fish_anterioposterior+5);
        }
    // label at the bottom
    translate([0, 0, -wall_thickness])
    #linear_extrude(wall_thickness)
    rotate([0,0,-90])
    text(str(label), size = fish_dorsoventral/4, halign = "center", valign = "center");
    }


// Bottom pin
pin(height=20);

// Collate holders
difference(){
    // Several holders
    for (angle=[0:60:359]) {
    rotate([0,0,angle]) translate([fish_dorsoventral*.8, 0, 0]) sticklebackholder(label=angle/60+1);
    }
    // "Drill" out the central part, but not too deep
    translate([0,0,wall_thickness]) #cylinder(d=fish_dorsoventral*2.0-wall_thickness+2.5, h=fish_anterioposterior+5+wall_thickness);
}
// Separation walls between flower buds
for (angle=[0:60:359]) {
        rotate([0,0,angle])
        translate([-wall_thickness/2,0, 0])
        cube([wall_thickness,fish_dorsoventral*1.1,fish_anterioposterior+5]);
}
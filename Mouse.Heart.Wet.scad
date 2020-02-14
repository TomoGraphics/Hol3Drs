$fn=100;

use <bottom_pin.scad>

module cup(inner_diameter=10, height=15, wall_thickness=1)
{
    difference(){
        // upper cup
        translate([0,0,5]) cylinder(d=inner_diameter+(2*wall_thickness),
            h=height,
            center=true);
        translate([0,0,5]) cylinder(d=inner_diameter,
            h=height+wall_thickness,
            center=true);
        }
    difference(){        
        // lower cup (to be filled with fluid
        translate([0,0,-5]) #cylinder(d=inner_diameter+(2*wall_thickness),
            h=5,
            center=true);
        translate([0,0,-5+wall_thickness]) #cylinder(d=inner_diameter,
            h=5-2*wall_thickness,
            center=true);
        
        }
        //separator
        for (i=[0:5])
            rotate([1,0,i*60])
                translate([2*wall_thickness,-2*wall_thickness,-5/2-wall_thickness])
                    cube([wall_thickness,inner_diameter-4*wall_thickness,wall_thickness]);
}

pin(height=30);
height = 15;
wall_thickness = 0.75;
translate([0,0,height/2-wall_thickness]) cup(height=height, wall_thickness=wall_thickness);

// Sometimes we just have to put one single Falcon tube upright...

$fn=100;

module ring(inner_diameter=6.15, height=2, wall_thickness=2)
{
    difference(){
        cylinder(d=inner_diameter+(2*wall_thickness),
            h=height,
            center=true);
        #cylinder(d=inner_diameter,
            h=height+0.5,
            center=true);
    }
}

// upper ring
translate([0,0,80])
    ring(inner_diameter=33, height=5);
// lower ring
translate([0,0,20])
    ring(inner_diameter=15);
// legs, connectors and cutting to put on table
difference(){
    union(){
        // legs
        for (i = [0:60:359]) {
            rotate([15,0,i])
            translate([0,41,30])
            cube([2,6,90], center=true);
            } 
        // connector to lower ring
        for (i = [30:60:359]) {
            translate([0,0,22])        
            rotate([0,0,i])
            translate([24,0,-2])        
            cube([30,2,2], center=true);
            }    
    }    
    //table
    %translate([0,0,-5])
        cube([120,120,10], center=true);
    }
$fn=100;

use <bottom_pin.scad>
          
module connector(cylinder_height,
                diameter,
                wall_thickness=1) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus the wall thickness
        union() { // Collect the bottom pin and the cylinder
            pin(height=10);
            cylinder(d=diameter+2*wall_thickness,h=cylinder_height);
          }
        translate([0,0,wall_thickness]) union(){
            #translate([0,0,wall_thickness]) cylinder(d=diameter, h=cylinder_height+1);
            // write diameter into it
            #linear_extrude(2*wall_thickness) {
    text(str(round(diameter*10)/10), size = diameter/3, halign = "center", valign = "center");
}               }             
                }
            }

for ( angle = [1:60:360]){
    diameter = 10 + angle/300 - 0.2;
    echo(diameter);
    rotate(angle,[0,0,1]){
        translate([15,0,0]) connector(5, diameter);
        }
    }
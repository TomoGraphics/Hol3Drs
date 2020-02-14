// Sample holder for (instilled) rat eyes
$fn = 100;

eyediameter = 8;
wallthickness = 0.5;

use <bottom_pin.scad>

// Bottom pin
difference(){
    pin(height=25);
    translate([0,0,eyediameter/2]) scale([1,1,2]){sphere(d=eyediameter-wallthickness*2);}
}

// Cup
translate([0,0,eyediameter/2])
    difference(){
        difference(){
            scale([1,1,2]){sphere(d=eyediameter);}
            scale([1,1,2]){sphere(d=eyediameter-wallthickness*2);}
        }
        translate([0,0,5]) cube(10, center=true);
    }
// Good for putting something very small on top of a needle into the scanner
$fn=100;

use <bottom_pin.scad>

pin(height=5);
translate([0,0,1.5])
difference(){
    // outer
    cube([29,19,3], center=true);
    // measured bottom, rounded up to the next mm
    #translate([0,0,1.5]) cube([26,16,3], center=true);   
}
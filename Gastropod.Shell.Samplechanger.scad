// For scanning a small gastropod shell on the smallest sample changer holder
 
$fn=50;
height=5;
holderdiameter=3.8;
 
// hollow 'connector' to sample changer holder
difference(){
    cylinder(height, d=holderdiameter);
    cylinder(height, d=holderdiameter-1);
    }   
translate([0,0,height-2]) cylinder(0.5, d=holderdiameter);

translate([5,5,0]) {    
    difference(){
        cylinder(height, d=holderdiameter);
        cylinder(height, d=holderdiameter-0.5);
        }   
    translate([0,0,height-2]) cylinder(0.5, d=holderdiameter);
    }
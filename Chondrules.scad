// For scanning space chondrules on the smallest sample changer holder
 
$fn=50;
height=5;
pindiameter=1.5;
holediameter=1;
holderdiameter=3.8;
 
// connector to sample changer holder
difference(){
    cylinder(height, d=holderdiameter);
    cylinder(height, d=holderdiameter-1);
    }
// cone     
difference(){
    translate([0,0,height]) cylinder(height/2, d1=holderdiameter, d2=pindiameter);
    translate([0,0,height-1]) cylinder(height/2, d1=holderdiameter, d2=pindiameter);
    }
// top pin with holes for the chondrules
difference(){
    translate([0,0,1.5*height]) cylinder(h=3.5,d=pindiameter);
    for (i = [0 : 2]){
        #translate([0, 0, 1.5*height+0.5+i*(1.5*holediameter)]) rotate([0,90,0])
        cylinder(h=1.5*pindiameter, d=holediameter, center=true);
        }
    }

translate([5,5,0]) {
    // connector to sample changer holder
    difference(){
        cylinder(height, d=holderdiameter);
        translate([0,0,-0.5]) cylinder(height, d=holderdiameter-1);
        }
    difference(){
        for (r = [0 : 5]){
            rotate(r*60, [0, 0, 1])
            translate([1,0,0])
            translate([0,0,height])
            cylinder(h=4-110*r/180,d=pindiameter*.618);
            }
        }
    }
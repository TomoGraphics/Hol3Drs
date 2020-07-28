 // For scanning space chondrules on the smallest sample changer holder
 
 $fn=100;
 height=5;
 
 difference(){
     cylinder(height, d=4);
     cylinder(height, d=4-1);
     }
 difference(){
     translate([0,0,height]) cylinder(height/2, d1=4, d2=0.25);
     translate([0,0,height-1]) cylinder(height/2, d1=4, d2=0.25);
 }
 difference(){
     translate([0,0,1.5*height]) cylinder(h=0.25,d=0.25);
     translate([0,0,1.5*height+.25]) sphere(d=0.25);
 }
 
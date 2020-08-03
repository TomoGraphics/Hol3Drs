 // For scanning space chondrules on the smallest sample changer holder
 
 $fn=100;
 height=5;
 
 difference(){
     cylinder(height, d=4);
     cylinder(height, d=4-1);
     }
 difference(){
     translate([0,0,height]) cylinder(height/2, d1=4, d2=0.75);
     translate([0,0,height-1]) cylinder(height/2, d1=4, d2=0.75);
 }
 difference(){
     translate([0,0,1.5*height]) cylinder(h=3,d=0.75);
     holediameter=0.5;
for ( i = [0 : 3] ){
    #translate([0,0,1.5*height+0.3+i*(holediameter+0.2)]) rotate([0,90,0]) cylinder(h=1,d=holediameter,center=true);
    }
 }
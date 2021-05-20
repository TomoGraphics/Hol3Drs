$fn = 100;

module drillhole() {
    cylinder(d=2.5, h=8);
            }

height = 25;
difference(){
       cylinder(d=6.3, h=height);        
       for ( angle = [1:120:360])
           rotate([0,0,angle]) translate([2.25,0,height-7.9]) drillhole();
   }
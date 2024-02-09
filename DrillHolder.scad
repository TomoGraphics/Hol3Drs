$fn = 62;

depth = 5;
module drillhole() {
    #cylinder(d=1.25, h=depth);
            }
                       
height = 15;
randomnumbers = rands(0,0.5,7,seed=123456);

difference(){
    cylinder(d=6.3, h=height);
    translate([randomnumbers[0]*.5,randomnumbers[1]*.5,height-depth+0.5]) drillhole();
    for ( i = [1:1:6])
        rotate([0,0,30+i*60]) translate([1.75+randomnumbers[i],0,height-depth+0.5]) drillhole();
    translate([6.3/2,0,height-depth+0.5]) drillhole();    
   }
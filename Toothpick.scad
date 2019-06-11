$fn=100;
height = 30;
difference(){
    cylinder(d=6.2, h=height);
    cylinder(d=4, h=height-5);
    cylinder(d=2.2, h=55);
}

translate([10,10,0])
difference(){
    cylinder(d=6.2, h=height-5);
    cylinder(d=4, h=height-10);
    cylinder(d=2.2, h=55);
}

translate([20,20,0])
difference(){
    cylinder(d=6.2, h=height-10);
    cylinder(d=4, h=height-15);
    cylinder(d=2.2, h=55);
}
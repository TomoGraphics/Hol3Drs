// Some random pins, with help from https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Mathematical_Functions

for(i=[0:100]){
    translate([rands(0,10,1)[0], rands(0,10,1)[0], 0]) cylinder(d=1, h=10);
    }
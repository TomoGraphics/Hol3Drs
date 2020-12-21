// For Alex
$fn=50;

// stamp or insert into the gel wells
module insert(depth=30, diameter=15, embryodiameter=1.5) {
    translate([0,0,-depth])
    hull(){
        rotate([90, 0, 0]) cylinder(h=diameter*0.618,
            d=embryodiameter,
            center=true);
        translate([0,0,depth/2]) cylinder(h=depth/2, d=diameter);
    }
}

// well plate cover
cube([290,180,5]);
// for-loop the inserts to a 96-well plate
xdistance=23;
ydistance=19;
for (x = [1:12], y = [1:8])
        translate([x*xdistance,y*ydistance,0]) insert();
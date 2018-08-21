// We have a disected rabbit retina with its partial [vitreous body] on top
// We need to scan this without disturbing the configuration of the whole 'assembly'.
// And also while keeping it hydrated, so we need some 'slack' below to add some fluid.
//
// [vitreous body]: https://en.wikipedia.org/wiki/Vitreous_body

// Setup
$fn=25;
wallthickness=1;
commonradius=11;

// We always need the bottom pin
use <bottom_pin.scad>
pin(height=20);

// Put a cylinder on the pin and hollow it out
difference(){
    cylinder(r=commonradius, h=13);
    #translate([0,0,wallthickness]) cylinder(r=commonradius-wallthickness, h=13);
    }

// In the outer cylinder we need something to rest the retina on
difference(){
    // E.g. some random hollow pins...
    intersection(){ // Pins only inside the outer cylinder, please
        cylinder(r=commonradius, h=10);
        // Make us some (seeded) random variables
        num_pins = 100;
        rand_x=rands(-commonradius,commonradius,num_pins,42);
        rand_y=rands(-commonradius,commonradius,num_pins,99);
        rand_ang=rands(0,180,num_pins,1796);
        for(i=[0:num_pins]){ // make us 'i' pins at random locations
            translate([rand_x[i], rand_y[i], 0])
                rotate(rand_ang[i]) 
                    cube([4,1,10]);
                }
            }
    // ...and a squashed sphere removed from them.<
    translate([0,0,10])
        scale([1,1,0.309])
        sphere(r=commonradius);
    }    
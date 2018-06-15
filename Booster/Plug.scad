use <Common.scad>

module plug(diameter, height, numberOfScrews = 4, holderScrew = 6.4) {
    difference() {
        cylinder(d=diameter, h=height);
        translate([0,0,17.5]) screws(diameter, numberOfScrews, 5, 9.9);
        translate([0,0,3]) ring(d=diameter+0.1, w=1.05, h=3);
        translate([0,0,9]) ring(d=diameter+0.1, w=1.05, h=3);
        translate([0,0,height-10]) cylinder(d=holderScrew,h=10.1);
    }
}

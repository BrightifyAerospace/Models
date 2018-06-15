use <Common.scad>

module chamber(height, diameter, wall, numberOfScrews = 4) {
    difference() {
        cylinder(d=diameter + 2 * wall, h=height);
        translate([0,0,-5]) cylinder(d=diameter, h=height+10);
        translate([0,0,5.5]) screws(diameter+2*wall, numberOfScrews, 5, wall);
        translate([0,0,height-5.5]) screws(diameter+2*wall, numberOfScrews, 5, wall);
    }
}

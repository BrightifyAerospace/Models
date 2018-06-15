module screws(outerDiameter, count, diameter, length) {
    for(i=[0:count-1]) rotate([0,0,i*(360/count)]) translate([outerDiameter/2, 0, 0]) rotate([0,-90,0]) cylinder(d=diameter*0.8,h=length);
}

module ring(d, w, h) {
    difference() {
        cylinder(d=d,h=h);
        translate([0,0,-.1]) cylinder(d=d-w*2,h=h+.2);
    }
}

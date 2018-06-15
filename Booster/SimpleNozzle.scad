use <Common.scad>

module simple_nozzle(diameter, throat, throatLength, bellWidth, bellLength, bellBottomDiameter, height) {
    difference() {
        union() {
            cylinder(d=diameter, h=height);
            translate([0,0,height]) cylinder(d1=throat + 2*bellWidth, d2=bellBottomDiameter + 2*bellWidth, h= bellLength);
        }
        translate([0,0,-5]) cylinder(d=throat, h=height+10);
        translate([0,0,height-1]) cylinder(d1=throat, d2=bellBottomDiameter, h=bellLength+2);
        translate([0,0,-0.1]) cylinder(d1=diameter,d2=throat,h=10);
        translate([0,0,8]) ring(d=diameter+0.1, w=4.5, h=5.1);
    }
    /*translate([0,0,-10]) */
}

use <../Booster/Booster.scad>
use <extrusion_profile.scad>

$vpr = [45, 0, 45];
$vpt = [0, 0, 125];
$vpd = 1000;

module loadCell() {
    // cube([width,depth,height], center)
}
module loadTransferWedge() {

}

// booster();

module copy_mirror(vec=[0,1,0]) {
    children();
    mirror(vec) children();
}

module base(width, height) {
    size = 30;
    widthDelta = width / 2 - size / 2;
    heightDelta = height / 2 - size / 2;
    adjustedWidth = width + size * 2;
    adjustedHeight = height - size * 2;

    // Outer profiles
    rotate([90, 0, 0])
    copy_mirror([1, 0, 0])
    translate([widthDelta, 0, - adjustedWidth / 2])
    extrusion_profile(height = adjustedWidth, size = size);

    rotate([0, 90, 0])
    copy_mirror([0, 1, 0])
    translate([0, heightDelta, - adjustedHeight / 2])
    extrusion_profile(height = adjustedHeight, size = size);

    translate([0, heightDelta, size / 2])
    extrusion_profile(height = /* booster height */200, size = size);
}

/* extrusion_profile(height=100, size=30); */

base(width = 300, height = 300);

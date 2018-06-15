use <Nozzle.scad>
use <Chamber.scad>
use <Plug.scad>
use <SimpleNozzle.scad>

/* module topPlug(radius, height) {
    cylinder(h = height, r = radius);
}

topPlug(radius = 50, height = 10); */


$fn = 100;

// Working in mm
chamberHeight = 250;
chamberDiameter = 41;
chamberWallWidth = 2;
plugHeight = 23;
nozzleThroat = 7;
nozzleThroatLength = 5.55;
nozzleBellWidth = 2;
nozzleBellLength = 40;
nozzleBellBottomDiameter = 25.47;

$vpr = [45, 0, 45];
$vpt = [0, 0, chamberHeight / 2];
$vpd = 1000;

/*booster(boosterHeight, boosterDiameter, boosterWallWidth, boosterPlugHeight, boosterNozzleThroat);*/

module booster() {
    union() {
        chamber(chamberHeight, chamberDiameter, chamberWallWidth);
        translate([0,0,plugHeight]) rotate([0,180,0]) plug(chamberDiameter, plugHeight);
        translate([0,0,chamberHeight])
        //nozzle(chamberDiameter);
        simple_nozzle(chamberDiameter, nozzleThroat, nozzleThroatLength, nozzleBellWidth, nozzleBellLength, nozzleBellBottomDiameter, plugHeight);
    }
}

use <Common.scad>

module nozzle(diameter, numberOfScrews = 4, holderScrew = 6.4) {
    difference() {
        rotate_extrude()
        rotate([180,0,90])
        _2d_nozzle(outerRadius = diameter / 2, expansionRatio = 2, throat = 5, bellWidth = 2, divergence = 45);

        translate([0,0,-5.5]) screws(diameter, numberOfScrews, 5, 9.9);
        translate([0,0,-14]) ring(d=diameter+0.1, w=1.05, h=3);
        translate([0,0,-20]) ring(d=diameter+0.1, w=1.05, h=3);
    }
}

module _2d_nozzle(outerRadius, expansionRatio, bellWidth, throat, convergence = 30, divergence = 30) {
    a1 = (2.5 * throat) - (1.5 * throat * cos(convergence));
    b1 = (1.5 * throat) * sin(convergence);

    y0 = (1.382 * throat) - (0.382 * throat * cos(divergence));
    x0 = (0.382 * throat) * sin(divergence);

    exitRadius = sqrt(expansionRatio) * throat;

    translate([0,throat+1.5*throat,0]) difference() {
        circle(r=1.5 * throat);
        translate([0,-1.5*throat,0]) square([1.5*throat, 3*throat]);
    }
    translate([0,throat+0.382*throat,0]) intersection() {
        circle(r=0.382 * throat);
        translate([0,-0.382*throat,0]) square([0.382*throat, 0.382*throat]);
    }
    polygon(points = [[-b1, a1], [0, a1], [0, outerRadius], [-b1, outerRadius], [-b1-((outerRadius - a1)*tan(90-convergence)), outerRadius]]);
    translate([x0, y0, 0]) {
        /*% polygon(points = [[-((outerRadius - y0)*tan(90-divergence)), -outerRadius+y0], [0, 0], [((outerRadius - y0)*tan(90-divergence)), outerRadius-y0], [x0, outerRadius-y0]]);*/

        step = 1/$fn;
        startY = sqrt(pow(1/(2 * tan(divergence)), 2)); // x0 - pow(y0,2); // 2 * tan(divergence);

        startX = pow(startY, 2);
        /*polygon(points=[[-x0, startY+bellWidth], [-x0, startY], [startX, startY], [startX, -y0]]);*/
        translate([-startX, -startY, 0]) {
            polygon(points = [[startX, startY], [startX, startY+bellWidth], [startX-x0, startY+bellWidth], [startX-x0, startY]]);
            step = 1/$fn;
            for(y1=[startY:step:exitRadius-step]) {
                x1 = pow(y1, 2);
                y2 = y1+step;
                x2 = pow(y2, 2);
                polygon(points = [[x1, y1], [x2, y2], [x2, y2+bellWidth], [x1, y1+bellWidth]]);
            }
        }
    }
}

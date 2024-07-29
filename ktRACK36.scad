//
// ktRACK36
//
//



gap1 = 0.001;
gap2 = 0.002;
th = 2;



difference()
{
    union()
    {
        translate([0, 0, 7.5-1]) rotate([0, 0, 90]) cylinder(r=20.5/2, h=3.5, center=true, $fn=6);
        translate([0, 0, 7.5/2]) rotate([0, 0, 90]) cylinder(r=20.5/2, h=7.5, center=true, $fn=6);
        //translate([0, 0, -2/2]) rotate([0, 0, 0]) cylinder(r=36/2, h=2, center=true, $fn=100);
    }
    translate([0, 15, 7.5-1+gap1]) rotate([0, 0, 90]) cylinder(r=18/2, h=3.5, center=true, $fn=6);
    translate([0, 0, 7.5-1+gap1]) rotate([0, 0, 90]) cylinder(r=18/2, h=3.5, center=true, $fn=6);
    translate([8, -7/2, 7.5-2.5/2-1]) rotate([0, 45, 0]) cube([2, 7, 2]);
    translate([-8, 7/2, 7.5-2.5/2-1]) rotate([0, 45, 180]) cube([2, 7, 2]);
    translate([8, -15/2, 8.5]) rotate([0, 45, 0]) cube([2, 15, 2]);
    translate([-8, 15/2, 8.5]) rotate([0, 45, 180]) cube([2, 15, 2]);
    translate([-2.5/2, -8, 7.5-2.5/2-3.2+gap1]) cube([2.5, 15, 2]);
    
    translate([0, -36/2-5, -5+gap1]) rotate([0, 0, 60+90]) cube([30, 30, 5]);
    translate([0, -36/2-5, -5+gap1]) rotate([0, 0, -60]) cube([30, 30, 5]);
    translate([-30/2, 36/2-4, -5+gap1]) rotate([0, 0, 0]) cube([30, 30, 5]);
}

difference()
{
    union()
    {
        translate([3.2-1.8/2, -9/2, 7.5-3.5]) cube([1.8, 9, 4.3]);
        translate([-3.2-1.8/2, -9/2, 7.5-3.5]) cube([1.8, 9, 4.3]);
    }
    //translate([3.2-1.8/2, -3/2+3, 7.5-3.5]) cube([1.8, 3, 4.3]);
    //translate([3.2-1.8/2, -3/2, 7.5-3.5]) cube([1.8, 3, 4.3]);
    //translate([3.2-1.8/2, -3/2-3, 7.5-3.5]) cube([1.8, 3, 4.3]);
    
    translate([-3.2-1.8/2, -3/2+3, 7.5-3.5]) cube([1.8, 3, 4.3]);
    //translate([-3.2-1.8/2, -3/2, 7.5-3.5]) cube([1.8, 3, 4.3]);
    //translate([-3.2-1.8/2, -3/2-3, 7.5-3.5]) cube([1.8, 3, 4.3]);
}



height = 10;
module heart_sub_component(radius) {
    rotated_angle = 45;
    diameter = radius * 2;
    $fn = 48;

    translate([-radius * cos(rotated_angle), 0, 0]) 
        rotate(-rotated_angle) union() {
            circle(radius);
            translate([0, -radius, 0]) 
                square(diameter);
        }
}
module heart(radius, center = false) {
    offsetX = center ? 0 : radius + radius * cos(45);
    offsetY = center ? 1.5 * radius * sin(45) - 0.5 * radius : 3 * radius * sin(45);

    translate([offsetX, offsetY, 0]) union() {
        heart_sub_component(radius);
        mirror([1, 0, 0]) heart_sub_component(radius);
    }

}
translate([-17.5, -36/2, -2]) linear_extrude(height = 2) heart(32 / (3 * sin(45) + 1));
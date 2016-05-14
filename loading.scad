module draw_circles(angle_offset, distance, size)
{
	for (angle = [0:45:360]) {
		rotate(a=angle + angle_offset + 22.5)
			translate([distance,0,0])
				color("black")
					circle(r=size);
	}
	// center
	/*color("red")
	circle(r=10);
	rotate(a = 45){
		translate([50, 0, 0])
			circle(r=10);
		translate([-50, 0, 0])
			circle(r=10);
		translate([0, 50, 0])
			circle(r=10);
		translate([0, -50, 0])
			circle(r=10);
	}
	translate([50, 0, 0])
			circle(r=10);
	translate([-50, 0, 0])
		circle(r=10);
	translate([0, 50, 0])
		circle(r=10);
	translate([0, -50, 0])
		circle(r=10);*/
}


function rot_values(step) = lookup(step, [
 		[ 0, 0 ],
 		[ 40, 0 ],
 		[ 60, 45 ],
 		[ 100, 45 ]
 	]);
module loading(step)
{
	trans = 50 * exp(-pow((step-50),2)/500);
	size = 7 * exp(-pow((step-50),2)/500) + 3; 

	// this is bad, reaaaaaly bad but i don't know how i can
	// define a variable and change it's value in another scope :-(
	rot = rot_values(step);
	draw_circles(rot, trans, size);

}

$vpt = [0,0,0];
$vpr = [0,0,0];
$vpd = 300;
loading($t * 100);
loading(100 - $t * 100);
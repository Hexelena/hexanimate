module draw_circles(angle_offset, distance, size, col)
{
	for (angle = [0:45:360]) {
		rotate(a=angle + angle_offset + 22.5)
			translate([distance,0,0])
				color(col)
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
 		[ 0, 45 ],
 		[ 30, 45 ],
 		[ 60, 0 ],
 		[ 80, 0 ],
 		[ 100, 0]
 	]);

function trans_values(step) = lookup(step, [
		[0, 0],
		[30, 50],
		[50, 50],
		[80, 0],
		[100, 0]
	]);

function size_values(step) = lookup(step, [
		[0, 3],
		[30, 10],
		[50, 10],
		[80, 3],
		[90, 25],
		[100 ,3]
	]);
module loading(step, col)
{
	step = step % 100;
	//trans = 50 * exp(-pow((step-50),2)/500);
	trans = trans_values(step);
	//size = 7 * exp(-pow((step-50),2)/500) + 3; 
	size = size_values(step);

	// this is bad, reaaaaaly bad but i don't know how i can
	// define a variable and change it's value in another scope :-(
	rot = rot_values(step);
	draw_circles(rot, trans, size, col);

}

$vpt = [0,0,0];
$vpr = [0,0,0];
$vpd = 300;
loading($t * 100, "DarkSlateGray");
loading($t * 100 + 50, "LightSlateGray");
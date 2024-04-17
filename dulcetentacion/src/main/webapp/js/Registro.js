function goPaso1(){
	jQuery('#part2').removeClass("d-block");
	jQuery('#part2').addClass("d-none");
	jQuery('#part1').addClass("d-block");
	jQuery('#part1').removeClass("d-none");
}

function goPaso2(){
	jQuery('#part1').removeClass("d-block");
	jQuery('#part1').addClass("d-none");
	jQuery('#part2').addClass("d-block");
	jQuery('#part2').removeClass("d-none");
}
function goPaso1(){
	jQuery('#part2').removeClass("d-block");
	jQuery('#part2').addClass("d-none");
	jQuery('#part1').addClass("d-block");
	jQuery('#part1').removeClass("d-none");
}

function goPaso2(){
	var mensaje = "";
	var error = false;
	
	if(jQuery('#document').val() == null || jQuery('#document').val() == undefined || jQuery('#document').val() == ""){
		mensaje = "debes de rellenar el documento!"
		error = true;
	}else if(jQuery('#email').val() == null || jQuery('#email').val() == undefined || jQuery('#email').val() == ""){
		mensaje = "debes de rellenar el correo electronico!"
		error = true;
	}else if(jQuery('#pass').val() == null || jQuery('#pass').val() == undefined || jQuery('#pass').val() == ""){
		mensaje = "debes de rellenar la Contraseña!"
		error = true;
	}
	
	if(error){
		Swal.fire({
		  icon: "error",
		  title: "Oops...",
		  text: mensaje
		});
	}else{
		jQuery('#part1').removeClass("d-block");
		jQuery('#part1').addClass("d-none");
		jQuery('#part2').addClass("d-block");
		jQuery('#part2').removeClass("d-none");
	}
}
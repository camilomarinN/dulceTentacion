jQuery("#precioProducto").on({
    "focus": function (event) {
        jQuery(event.target).select();
    },
    "keyup": function (event) {
        jQuery(event.target).val(function (index, value ) {
            return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });
    }
});

function validarFormulario(){
	if(jQuery('nombreProducto').val()== "" || jQuery('descripcionProducto').val()== "" || jQuery('precioProducto').val()== "" ||
		jQuery('tipoProducto').val()== "0" || jQuery('nombreProducto').val()== undefined || jQuery('descripcionProducto').val()== undefined || 
		jQuery('precioProducto').val()== undefined ||jQuery('tipoProducto').val()== undefined)
		{
		Swal.fire({
		  icon: "error",
		  title: "Oops...",
		  text: "Debes de rellenar todos los campos obligatorios! (*)"
		});
	}else{
		
	}
}
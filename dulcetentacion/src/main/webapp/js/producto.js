jQuery("#precioProducto").on({
    "focus": function (event) {
        jQuery(event.target).select();
    },
    "input": function (event) {
        var typingTimer;

        clearTimeout(typingTimer);
        typingTimer = setTimeout(function() {
            var value = jQuery(event.target).val().replace(/[^\d.]/g, '');
            var parts = value.split(/[.]/);
            var integerPart = parts[0].slice(0, 9); // Limita a 9 dígitos antes del punto
            var decimalPart = parts[1] ? '.' + parts[1].slice(0, 2) : ''; // Limita a 2 dígitos después del punto si existe
            value = integerPart + decimalPart;

            jQuery(event.target).val(value);
        }, 500);
    }
}).on("keypress", function (event) {
    // Permitir el punto decimal solo si aún no se ha ingresado y no hay ya un punto decimal presente
    if ((event.which != 46 || jQuery(this).val().indexOf('.') != -1) &&
       ((event.which < 48 || event.which > 57) &&
       (event.which != 0 && event.which != 8))) {
        event.preventDefault();
    }
});

function validarFormulario(){
	if(jQuery('#nombreProducto').val()== "" || jQuery('#descripcionProducto').val()== "" || jQuery('#precioProducto').val()== "" ||
		jQuery('#tipoProducto').val()== "0" || jQuery('#nombreProducto').val()== undefined || jQuery('#descripcionProducto').val()== undefined || 
		jQuery('#precioProducto').val()== undefined ||jQuery('#tipoProducto').val()== undefined)
		{
		Swal.fire({
		  icon: "error",
		  title: "Oops...",
		  text: "Debes de rellenar todos los campos obligatorios! (*)"
		});
	}else{
		jQuery("#ProductForm").submit();
	}
}

function validarDeleteProducto(idProducto){
	Swal.fire({
  title: "¿Hey, Estas seguro de esto?",
  text: "¡esta acción no se puede revertir!",
  showDenyButton: true,
  confirmButtonText: "Aceptar",
  denyButtonText: `cancelar`
	}).then((result) => {
	  if (result.isConfirmed) {
	     window.location.href = 'Controlador?accion=deleteProduct&productid=' + idProducto;
	  }
	});
}
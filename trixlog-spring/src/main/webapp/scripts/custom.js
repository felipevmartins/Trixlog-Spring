$( document ).ready(function() {
	 $('.selectpicker').selectpicker();
	 
	 $('.selectpicker').selectpicker({
	      style: 'btn-info',
	      size: 4
	  });
});

function clicaalterarlocation(id){
	var id = id;
	idLocation = id;
	$.ajax({
		url : 'buscar/'+id,
		contentType: 'application/json',
	    mimeType: 'application/json',
		success : function(data) {
			if (data != null) {
				$('#alterar-location').removeClass('hidden');
				$('#nome').val(data.name);
				$('#latitude').val(data.latitude);
				$('#longitude').val(data.longitude);
				$('#alterar-location-form').prop('action', "editar/"+id );
			}
		}
	});
}

function clicadeletarlocation(id){
	var id = id;
	idLocation = id;
	$.ajax({
		url : 'buscar/'+id,
		contentType: 'application/json',
	    mimeType: 'application/json',
		success : function(data) {
			if (data != null) {
				$('#deletar-location').removeClass('hidden');
				$('#nome').val(data.name);
				$('#latitude').val(data.latitude);
				$('#longitude').val(data.longitude);
				$('#deletar-location-form').prop('action', "deletar/"+id );
			}
		}
	});
}
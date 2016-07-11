$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
  $( "form" ).submit( function( event ) { 
      
      event.preventDefault();
      // alert( "Hola" );

    

    var $form = $( this ),
    term = $form.find( "input:first" ).val(),
    url = $form.attr( "action" );

    var info = 'user_input=' + term ;

    // console.log($form);
    // console.log(term);
    // console.log(url);

    $.post(url, info, function(data){
      console.log(data);
      var grandma_says = 'Tu Abuelita Dice: ' + data ;
      $( "span" ).empty().append( grandma_says);

    });

  });
});


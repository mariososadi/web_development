$(document).ready(function() {

  $( "form" ).submit( function( event ) { 
      
    event.preventDefault();
    
    var $form = $( this ),
    term = null
    url = $form.attr( "action" );

    $.post(url, term, function(data){
       html = $(data).find("#die")
       $( "#die" ).empty().append( html );

    });

  });
  
});

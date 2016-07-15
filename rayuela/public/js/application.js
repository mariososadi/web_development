$(document).ready(function() {

    $( '#Player1' ).each( function( key, el )  {
    for ( var i = 0; i < 64; i++ ) {
    $(this).append('<td>'+ '</td>');
     };
    });
    $( '#Player1 td:nth-child(2)' ).addClass('active');

    $( '#start_btn' ).click( function() { 

      $( '#Player1 td:nth-child(2)' ).removeClass('active');
      
      for ( var i = 3; i < 64; i++ ) {

        //Esta parte todavía no funciona (LOL), ponte a hacerla mejor

            // setTimeout(function(){
            $( '#Player1 td:nth-child(#{i})' ).addClass('active');
        // }, 1000);


      
      // $( '#Player1 td:nth-child(i)' ).removeClass('active');
     };
    


    });




	// Tu código va aquí

});

// Paso #1 = CSS 1.0 de Rayuela
// Paso # 2 = Lógica de 'class= active' después del submit

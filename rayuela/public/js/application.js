$(document).ready(function() {
  
  tabla_completa(); //Esta función crea el tablero completo dinámicamente.

  //Valores iniciales de tablero.
  function valores_iniciales(){
    counter = 0;
    cancel_1 = 0;
    valida1 = false;
    valida2 = false;
    $( '#start_btn' ).empty().append('Jugar')
    $( '#Player1 td' ).removeClass('active');
    $( '#Player2 td' ).removeClass('active');
    $( '#Player1 td:nth-child(2)' ).addClass('active');
    $( '#Player2 td:nth-child(2)' ).addClass('active');
  }

  // Función inicial de arrojar las monedas y reiniciar el juego (botón de Jugar/Reiniciar)
  $( '#start_btn' ).click( function() {
  if (counter == 0) { 
    my_var = setInterval(function(){ throw_coin_1() }, 10);
    my_var_2 = setInterval(function(){ throw_coin_2() }, 10);
    $(this).empty().append('Reiniciar');
    counter+=1
  }
  else {
    valores_iniciales();
  }
  });

  // Función para detener monedas.
  function myStopFunction(x){
    clearInterval(x);

  }

  // Función para generar tablero cpompleto.
  function tabla_completa(){
    $( '#Player1' ).each( function( key, el ) {
      for ( var i = 0; i < 64; i++ ) { $(this).append('<td>' + '</td>'); };
    });
    $( '#Player2' ).each( function( key, el ) {
      for ( var i = 0; i < 64; i++ ) { $(this).append('<td>' + '</td>'); };
    });
    valores_iniciales();
  }

  // Función para iniciar moneda 1.
  function throw_coin_1(){

    $(' #Player1 ').find(' td.active ').next().addClass("active");
    $(' #Player1 ').find(' td.active ').first().removeClass("active");
    if ($(' #Player1 ').find("td:nth-child(66)").attr("class") === "active")
      { myStopFunction(my_var)
        valida1 = true;
        valida_juego();  
        }
  }

  // Función para iniciar moneda 2.
  function throw_coin_2(){
    $(' #Player2 ').find(' td.active ').next().addClass("active");
    $(' #Player2 ').find(' td.active ').first().removeClass("active");
    if ($(' #Player2 ').find("td:nth-child(66)").attr("class") === "active")
      { myStopFunction(my_var_2);
        valida2 = true;
        valida_juego();
        }
  }

  function valida_juego(){
    if ( valida1 == true && valida2 == true ){
      winner();
    }
  }

  function winner(){
    res_1 = $(' #Player1 ').find(' td.active ').index();
    res_2 = $(' #Player2 ').find(' td.active ').index();

    if ( res_1 < 56 && res_2 < 56 ){
      if ( res_1 > res_2 )
        { console.log("Gana player 1")}
       if ( res_1 < res_2 )
        { console.log("Gana player 2")}
       if ( res_1 == res_2 )
        { console.log("Empate")}

    } else {
      if (res_1 < 56 ){
        console.log("Gana player 1")
      }
      else if (res_2 < 56 ){
        console.log ("Gana player 2")
      } 
      else {
      console.log("Perdieron los dos, babosos")
      }
    }
  }

  $(document).keydown(function(e) {
      if(e.keyCode == 81) {
        i = true;
        myStopFunction(my_var);
        valida1 = true
        valida_juego()
        // counter += 1;
      }

      if(e.keyCode == 82) {
        i = true;
        myStopFunction(my_var_2);
        valida2 = true
        valida_juego()
        // valida_vars()
        // counter += 1;
      }
    });
});

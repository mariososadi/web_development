$(document).ready(function() {

  $( 'form' ).submit( function(event) {

    event.preventDefault();
    myFunction();

  });


 function myFunction() {

    var x, y, text;
    x = document.getElementById("email").value;
    y = document.getElementById("password").value;

    if (x.length != 0 && validation_mail(x)) {
        $("#mensaje_a").empty().append('<li>' + "Email OK" +'</li>');
    } else {
        $("#mensaje_a").empty().append('<li>' + "Debes escribir una dirección de email válida" +'</li>');
    }

    if (y.length != 0 && number_password(y) && y.length > 7 && capital_password(y)) {
        $("#mensaje_b").empty().append('<li>' + "Password OK" +'</li>');
    } else {
        $("#mensaje_b").empty()
        $("#mensaje_b").append('<li>' + "El password debe tener al menos un caracter numérico (0-9)" +'</li>');
        $("#mensaje_b").append('<li>' + "El password debe contener al menos una mayúscula" +'</li>');
        $("#mensaje_b").append('<li>' + "El password debe tener al menos 8 caracteres" +'</li>'); 
    }
}

function number_password(password){
  var res = (/[0-9]/g).test(password);
  return res
}

function capital_password(password){
  var res = (/[A-Z]/g).test(password);
  return res
}

function validation_mail(email) {
  var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
  var valid = re.test(email)
  return valid
}
});
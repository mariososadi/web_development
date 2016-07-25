$(document).ready(function() {


  $( '#signup' ).submit( function(event) {

    event.preventDefault();
    myFunction();

  });


 function myFunction() {

    var a,b,x, y;
    a = document.getElementById("first_name").value;
    b  = document.getElementById("last_name").value;
    x = document.getElementById("email").value;
    y = document.getElementById("password").value;

    if (x.length != 0 && validation_mail(x) && y.length != 0 && number_password(y) && y.length > 7 && capital_password(y)) {
        formulario = $('#signup').serialize();
        console.log(formulario);
        $.post('/signup',formulario);
        window.location.replace("/login");

    } else {
        $("#para").empty()
        $("#mensaje_b").empty()
        $("#mensaje_b").append('<li>' + "You must write a valid email adress (ex. hello@quora.com)" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must have at least one digit (0-9)" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must include at least one capital letter" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must be at least 8 characters" +'</li>'); 
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

$(document).ready(function() {

  // JQuery for Sign Up validation (front-end)
  $( '#signup' ).submit( function(event) {

    event.preventDefault();
    signupValidation();

  });
  
  // JQuery for Survey creation (quesion-dynamic)
  $( '#add_answer').hide();
  $( '.initial' ).hide();
  $( '#finish_question' ).hide();
  cont_survey = 0;

  $( '#generate_question' ).on( 'click' , function(event) {

    event.preventDefault();
    questionGenerator();

  });

  $( '#generate_answer' ).on( 'click' , function(event) {

    event.preventDefault();
    answerGenerator();

  });

  $( '#finish_question' ).on( 'click' , function(event) {

    event.preventDefault();
    setQuestion();

  });

//-----------------------------------------------------------------//
// Sign Up validation functions
//-----------------------------------------------------------------//

function signupValidation() {

    var a,b,x, y;
    a = document.getElementById("first_name").value;
    b  = document.getElementById("last_name").value;
    x = document.getElementById("email").value;
    y = document.getElementById("password").value;

    if (x.length != 0 && validationMail(x) && y.length != 0 && numberPassword(y) && y.length > 7 && capitalPassword(y)) {
        formulario = $('#signup').serialize();
        $.post('/signup',formulario, function(data) {
          if(data.indexOf('Oops! you enter an invalid email or password. Plase, try again.') !== -1) {
            $( location ).attr("href", '/signup?mess=0')
          } else if ( data.indexOf('That email adress is already taken.') !== -1) {
            $( location ).attr("href", '/signup?mess=1')
          } else if ( data.indexOf('Please, introduce a valid email adress and password.') !== -1) {
            $( location ).attr("href", '/signup?mess=0')
          } else {
            $( location ).attr("href", '/user')
          }     
        });

    } else {
        $("#para").empty()
        $("#mensaje_b").empty()
        $("#mensaje_b").append('<li>' + "You must write a valid email adress (ex. hello@quora.com)" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must have at least one digit (0-9)" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must include at least one capital letter" +'</li>');
        $("#mensaje_b").append('<li>' + "Password must be at least 8 characters" +'</li>'); 
    }
}

function numberPassword(password){
  var res = (/[0-9]/g).test(password);
  return res
}

function capitalPassword(password){
  var res = (/[A-Z]/g).test(password);
  return res
}

function validationMail(email) {
  var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
  var valid = re.test(email)
  return valid
}


//-----------------------------------------------------------------//
// Survey AJAX functions
//-----------------------------------------------------------------//

// Question generator
function questionGenerator() {

    $( 'form #error' ).empty();
    if (document.getElementById("question").value.length === 0 ){
      $( 'form #error' ).append( 'Please, enter a valid question' )
    } else {
      $( '#create_question' ).hide();
      $( '.initial' ).show();
      var c = document.getElementById("question").value;
      $( 'form' ).append('<div class="form-group"><h4>'  + cont_survey + '. ' + c + '</h4><ol></ol></div>')
      $( '#add_answer' ).show();
      $( '#finish_question' ).show();
      $( '#question').val('');
      cont_survey++;
    }    
}

// Answer generator
function answerGenerator() {
    var d = document.getElementById("answer").value;
    $( 'form div:last ol' ).append('<li>' + d + '</li>');
    $( '#answer').val('');  
}

// Question and Answers set to screen
function setQuestion() {   
    $( '#add_answer').hide();
    $( 'form div:last' ).css('background','#87CEFA')
    $( 'form' ).append('<br>');
    $( '#create_question' ).show();  
}


//-----------------------------------------------------------------//
});

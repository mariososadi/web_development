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
  $( 'div #error' ).hide();
  $( 'div #error_question' ).hide();
  $( '#create_question' ).show();  


  $( '#create_question' ).submit(function(event) {

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


  // JQuery for Survey post
  $( '#create_survey' ).hide();
  $( 'div #error_survey' ).hide();
  $( '#create_survey' ).on( 'click' , function(event) {

    event.preventDefault();
    surveyGenerator();

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
        console.log(formulario)
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
        $("#para").empty();
        $("#mensaje_b").empty();
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
  var valid = re.test(email);
  return valid
}


//-----------------------------------------------------------------//
// Survey AJAX functions
//-----------------------------------------------------------------//

// Question generator
function questionGenerator() {

    if (document.getElementById("question").value.length === 0 ){
      $( 'div #error' ).show();
    } else {
      $( '#create_survey' ).show();
      $( 'div #error_survey' ).hide();
      $( '#create_question' ).hide();
      $( '.initial' ).show();
      var c = document.getElementById("question").value;
      $( '#survey_form' ).append('<div class="form-group"><h4>'  +  c + '</h4><ol></ol><br></div>')
      var question = $( '#create_question' ).serialize()
      $.post('/question/create', question, function(data){
        question_id = data;
      });      
      $( '#add_answer' ).show();
      $( '#finish_question' ).show();
      $( '#question').val('');
      $( 'div #error' ).hide();
      
    }    
}

// Answer generator
function answerGenerator() {

    if (document.getElementById("answer").value.length === 0 ){
      $( 'div #error' ).show();
      $( 'div #error_survey' ).hide();  
    } else {
      $( 'div #error_question' ).hide();
      $( 'div #error_survey' ).hide();   
      var d = document.getElementById("answer").value;
      $( '#survey_form div:last ol' ).append('<li>' + d + '</li>');
      var answer = $( '#add_answer' ).serialize() +'&question_id=' + question_id
      $.post('/answer/create', answer, function(data){
        question_id = data;
      });
      $( '#answer').val('');  
      $( 'div #error' ).hide();
    }
}

// Question and Answers set to screen
function setQuestion() {

  if ($( '#survey_form div:last ol' ).is(':empty')){
    $( 'div #error' ).hide();
    $( 'div #error_question' ).show();
    $( 'div #error_survey' ).hide();  
  } else {
    $( '#finish_question' ).hide();
    $( 'div #error_question' ).hide();
    $( 'div #error_survey' ).hide();   
    $( 'div #error' ).hide(); 
    $( '#add_answer').hide();
    $( '#survey_form div:last' ).css('background','#87CEFA');
    $( '#create_question' ).show();    
  } 
}

function surveyGenerator() {
    
  if ($( '#survey_form div ol' ).is(':empty')) {
    $( 'div #error_survey' ).show();
  } else {
    $( location ).attr("href", '/user')
  } 
}


//-----------------------------------------------------------------//

});

$( document ).ready(function() {

  $("#new_comment_button").click(function(){
  	
  	$("#new_comment_button").hide();
  	$("#comment_list").append("<li> <form id=\"nuevo\" >Comentario:<br><input type=\"text\" id=\"comment\"><br>Nombre:<br><input type=\"text\" id=\"author\"><br><br><input type=\"submit\" value=\"Enviar\"></form></li>");
    

    $("form").submit(function(event){

      event.preventDefault();

      var comment = document.getElementById("comment").value;
      var author = document.getElementById("author").value;

      $("#comment_list li:last").remove();
      $("#comment_list").append("<li>" + comment  + "<span class=\"author\">" + author  + "</span></li>");  
      $("#new_comment_button").show();

    });
  });
});

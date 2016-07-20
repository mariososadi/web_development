$( '#button').click(function(event) {
  event.preventDefault();
   my_function();

});

function my_function() {

      x = document.getElementById("selector").value;
      y = document.getElementById("property").value;
      z = document.getElementById("value").value;

      console.log(x)
      console.log(y)
      console.log(z)

      $(x).css(y, '');
      $(x).css(y, z);

};

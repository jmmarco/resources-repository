$(document).ready(function() {

  $(".fa-heart").on("click", function(event) {
    event.preventDefault();

    var $t = $(this);

    var a = { post_id: $t.attr("id") };

    if ($t.hasClass("red")) {

      console.log("fired");

      $.ajax({
        url: "/favorites/"+ $t.attr("id"),
        method: "delete",
        data: a,
        success: function(response) {
          $t.removeClass("red");
        },
        error: function(error) {
          console.log(error);
        }

      });
    } else {
      // Make the AJAX call
      $.ajax({
        url: "/favorites",
        method: "post",
        data: a,
        success: function(response) {
          console.log(response);
          $t.addClass("red");
        },
        error: function(error) {
          console.log("Error");
          console.log(error);
        }

      });
    }

    console.log($t);



  });




});

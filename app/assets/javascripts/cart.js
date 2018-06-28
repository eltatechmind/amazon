document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();


    $('.addcart').on('click', function() {
        var item_div = $(this).parents('.addo');
        var item_id = item_div.attr('id');
        var x = "http://localhost:3000/addcart?item_id=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                alert("Added To Cart");
            },
            error: function() {
                alert("Error");
            }
        });
    });




    $('.removeitem').on('click', function() {
        var item_div = $(this).parents('.removeitemparent');
        var item_id = item_div.attr('id');
        var x = "http://localhost:3000/removecart?item_id=" + item_id;
        //alert(x)
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                alert("Item Removed From Cart");
                location.reload();
            },
            error: function() {
                alert("Error");
            }
        });
    });









});

/*document.getElementById("myBtn").addEventListener("click", function(){
    alert("fouad")
 });*/
 

    
  



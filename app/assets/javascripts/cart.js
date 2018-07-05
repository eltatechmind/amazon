document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();


    $('.editaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editaddrparent');
        var item_id = item_div.attr('id');
        var x = "http://localhost:3000/addresses/" + item_id + "/edit";
        $(location).attr('href', x);
    });

    $('.addcart.btn.btn-primary').on('click', function() {
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




    $('.removeitem.btn.btn-primary').on('click', function() {
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



    $('.makeorder.btn.btn-primary').on('click', function() {
        var x = "http://localhost:3000/addorder";
        //alert(x)
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                alert("Order Created");
                $(location).attr('href', 'http://localhost:3000/order');
                //location.reload();
            },
            error: function() {
                alert("Error");
            }
        });
    });

    $('.cancelorder.btn.btn-primary').on('click', function() {
        var x = "http://localhost:3000/cancelorder";
        //alert(x)
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                alert("Order Canceled");
                $(location).attr('href', 'http://localhost:3000/order');
                //location.reload();
            },
            error: function() {
                alert("Error");
            }
        });
    });




    $('.removeaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removeaddrparent');
        var item_id = item_div.attr('id');
        var x = "http://localhost:3000/deleteaddress?id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                alert("Address Deleted");
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
 

    
  



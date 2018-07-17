document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();

    //go to edit address page
    $('.editaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editaddrparent');
        var item_id = item_div.attr('id');
        var x = "../addresses/" + item_id + "/edit";
        $(location).attr('href', x);
    });

    // go to edit phone page
    $('.editphone.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editphoneparent');
        var item_id = item_div.attr('id');
        var x = "../phones/" + item_id + "/edit";
        $(location).attr('href', x);
    });

    // choose address and create order 
    $('.orderaddress.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.orderaddressparent');
        var item_id = item_div.attr('id');
        var x = "../addorder?id=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successl"+ item_id ).text(success).show(0).delay(6000).hide(0);
                setTimeout(function () {
                $(location).attr('href', '../order');
                }, 7000);

            },
            error: function( req, status, err ) {
                var error = req['responseJSON']['error_message'];
                $(".errorl"+ item_id ).text(error).show(0).delay(2000).hide(0);

            }
        });
    });


// add units to your cart, success if added, print error if not available, print error if can't add more

    $('.addcart.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.addo');
        var item_id = item_div.attr('id');
        var x = "../addcart?item_id=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successl"+item_id).text(success).show(0).delay(3000).hide(0);
            },
            error: function( req, status, err ) {
                var error = req['responseJSON']['error_message'];
                $(".errorl" + item_id).text(error).show(0).delay(2000).hide(0);
            }
        });
    });


// remove item from cart, all item units

    $('.removeitem.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removeitemparent');
        var item_id = item_div.attr('id');
        var x = "../removecart?item_id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+item_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function(req, status, err ) {
                var error = req['responseJSON']['error_message'];
                $(".errorl"+item_id).text(error).show(0).delay(2000).hide(0);
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        });
    });

// when pressing on this button, it redirects you to choose addresss page

    $('.gotoaddress.btn.btn-primary').on('click', function() {
        var success = "Redirecting to choosing address"
        $(".successl").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../chooseaddress');
        }, 2000);
        
    });

// when pressing on this button, it redirects you to create address page

    $('.addaddress.btn.btn-primary').on('click', function() {
        var success = "Redirecting to add address"
        $(".successp").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../createaddress');
        }, 2000);
        
    });

// cancel order, either successfully, or error cancelled before, or you're not authorized to cancel it (not the user who did this orde)

    $('.cancelorder.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.cancelorderparent');
        var item_id = item_div.attr('id');
        var x = "../cancelorder?id="+ item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successl"+item_id).text(success).show(0).delay(2000).hide(0);
                setTimeout(function () {
                location.reload();
                }, 2000);    
            },
            error: function(req, status, err) {
                var error = req['responseJSON']['error_message'];
                $(".errorl"+item_id).text(error).show(0).delay(2000).hide(0); 
                setTimeout(function () {
                location.reload();
                }, 2000); 
            }
        });
    });


// delete the address you choose

    $('.removeaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removeaddrparent');
        var item_id = item_div.attr('id');
        var x = "../deleteaddress?id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+ item_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },

            error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    //alert(thrownError);
                    $(".errorl"+ item_id).text("Fail!, Address Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 1000);
                }
            }

        });
    });

// delete the phone you choose

    $('.removephone.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removephoneparent');
        var item_id = item_div.attr('id');
        var x = "../deletephone?id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successa"+ item_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    //alert(thrownError);
                    $(".errorb"+ item_id).text("Fail!, Phone Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 1000);
                }
            }
        });
    });






});

/*document.getElementById("myBtn").addEventListener("click", function(){
    alert("fouad")
 });*/
 

    
  



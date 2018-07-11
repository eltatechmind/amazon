document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();

    //edit address
    $('.editaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editaddrparent');
        var item_id = item_div.attr('id');
        var x = "../addresses/" + item_id + "/edit";
        $(location).attr('href', x);
    });

    $('.editphone.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editphoneparent');
        var item_id = item_div.attr('id');
        var x = "../phones/" + item_id + "/edit";
        $(location).attr('href', x);
    });


    $('.orderaddress.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.orderaddressparent');
        var item_id = item_div.attr('id');
        var x = "../addorder?id=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successl"+ item_id ).show(0).delay(6000).hide(0);
                setTimeout(function () {
                $(location).attr('href', '../order');
                }, 7000);

            },
            error: function() {
                $(".errorl"+ item_id ).show(0).delay(2000).hide(0); 
            }
        });
    });



    $('.addcart.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.addo');
        var item_id = item_div.attr('id');
        var x = "../addcart?item_id=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successl"+item_id).show(0).delay(1000).hide(0);
            },
            error: function() {
                $(".errorl"+item_id).show(0).delay(1000).hide(0);
            }
        });
    });




    $('.removeitem.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removeitemparent');
        var item_id = item_div.attr('id');
        var x = "../removecart?item_id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successr"+item_id).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function() {
                $(".errorl"+item_id).show(0).delay(2000).hide(0);
            }
        });
    });



    $('.gotoaddress.btn.btn-primary').on('click', function() {

        $(".successl").show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../chooseaddress');
        }, 2000);
        
    });

    $('.addaddress.btn.btn-primary').on('click', function() {

        $(".successp").show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../createaddress');
        }, 2000);
        
    });

    $('.cancelorder.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.cancelorderparent');
        var item_id = item_div.attr('id');
        var x = "../cancelorder?id="+ item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successl"+item_id).show(0).delay(2000).hide(0);
                setTimeout(function () {
                location.reload();
                }, 2000);    
            },
            error: function() {
                $(".errorl"+item_id).show(0).delay(2000).hide(0); 
            }
        });
    });




    $('.removeaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removeaddrparent');
        var item_id = item_div.attr('id');
        var x = "../deleteaddress?id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successr"+ item_id).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function() {
                 $(".errorl"+ item_id).show(0).delay(2000).hide(0); 
            }
        });
    });


    $('.removephone.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.removephoneparent');
        var item_id = item_div.attr('id');
        var x = "../deletephone?id=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successa"+ item_id).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function() {
                 $(".errorb"+ item_id).show(0).delay(2000).hide(0); 
            }
        });
    });






});

/*document.getElementById("myBtn").addEventListener("click", function(){
    alert("fouad")
 });*/
 

    
  



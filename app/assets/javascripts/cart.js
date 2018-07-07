document.addEventListener("DOMContentLoaded", function(event) {



    var xhttp = new XMLHttpRequest();

    //edit address
    $('.editaddr.btn.btn-primary').on('click', function() {
        var item_div = $(this).parents('.editaddrparent');
        var item_id = item_div.attr('id');
        var x = "../addresses/" + item_id + "/edit";
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
                $(".successl").show(0).delay(4000).hide(0);
                setTimeout(function () {
                $(location).attr('href', '../order');
                }, 5000);

            },
            error: function() {
                $(".errorl").show(0).delay(2000).hide(0); 
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
                $(".successl").show(0).delay(1000).hide(0);
            },
            error: function() {
                $(".errorl").show(0).delay(1000).hide(0);
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
                $(".successr").show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function() {
                $(".errorl").show(0).delay(2000).hide(0);
            }
        });
    });



    $('.makeorder.btn.btn-primary').on('click', function() {

        $(".successl").show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../chooseaddress');
        }, 2000);
        
    });

    $('.cancelorder.btn.btn-primary').on('click', function() {
        var x = "../cancelorder";
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                $(".successl").show(0).delay(2000).hide(0);
                setTimeout(function () {
                location.reload();
                }, 2000);    
            },
            error: function() {
                $(".errorl").show(0).delay(2000).hide(0); 
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
                $(".successr").show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
            error: function() {
                 $(".errorl").show(0).delay(2000).hide(0); 
            }
        });
    });







});

/*document.getElementById("myBtn").addEventListener("click", function(){
    alert("fouad")
 });*/
 

    
  



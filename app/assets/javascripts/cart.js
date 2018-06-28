


document.addEventListener("DOMContentLoaded", function(event) { 
 


var xhttp = new XMLHttpRequest();
 $('.addcart').on('click', function(){
 	var item_div = $(this).parents('.addo');
 	var item_id = item_div.attr('id');
 	var x = "http://localhost:3000/addcart.json?item_id="+item_id;

    $.ajax({
    	type: "POST",
    	url: x,
    	success: function(data){
    		alert("Added To Cart");
    	},
    	error: function(){
    		alert("walla3 f nfsk");
    	}
    });


 	//alert(x);
 	/*xhttp.onreadystatechange = function () {
 		if(this.readystate == 4 && this.status == 200) {
 			alert("Added To Cart");
 		}

    };
 	    xhttp.open("POST", x, true);
 	    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send();*/

 });

 });


/*document.getElementById("myBtn").addEventListener("click", function(){
    alert("fouad")
 });*/
 

    
  



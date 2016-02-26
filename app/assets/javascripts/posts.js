$(document).on("ready", function () {
	
	$(".js-submit").on('click',function (event) {  
		event.preventDefault();
		   
			var comment=$("#comment_body").val();

			var commenter=$("#comment_commenter").val();

		// if (comment && commenter){
	if (comment && commenter){
			var post_id=parseInt($(".js-submit").val());
	    $.ajax({
	        type: "POST",
	        url: `/posts/${post_id}/comments`,
	        data: {comment: { commenter: commenter, body: comment}},
			success: function(resp){
			    // Clear the boxes for name and comments.
			    $("#comment_body").val('');
			    $("#comment_commenter").val('');
	    		// console.log(resp); // prevents normal behaviour
			},
			error: function(){
				alert("Error creating message.");
			}
	    });


	    $.ajax({

	        url: ` /posts/${post_id}/comments`,
	        // data: {comment: { commenter: commenter, body: comment}},
			success: function(resp){
			    var last_element=resp.comments[resp.comments.length-1];
			   	  $(".js-list-comments").append(`<li><strong>Comment added:</strong> <span data-livestamp="1456500513"></span><br>Name: ${last_element.commenter}<br>${last_element.body}<br></li>`)
			  	  $(".error-message").empty();
			},
			error: function(){
				alert("Error getting the messages.");
			}
	    });
	  }
	  else{
	  	$(".error-message").text("Please fill the empty fields before submitting");
	  }

	});
});



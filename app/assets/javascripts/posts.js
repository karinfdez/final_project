$(document).on("ready", function () {
	
	// Set time of messages:
	function timeSince(date) {

	    var seconds = Math.floor((new Date() - date) / 1000);

	    var interval = Math.floor(seconds / 31536000);

	    if (interval > 1) {
	        return interval + " years";
	    }
	    interval = Math.floor(seconds / 2592000);
	    if (interval > 1) {
	        return interval + " months";
	    }
	    interval = Math.floor(seconds / 86400);
	    if (interval > 1) {
	        return interval + " days";
	    }
	    interval = Math.floor(seconds / 3600);
	    if (interval > 1) {
	        return interval + " hours";
	    }
	    interval = Math.floor(seconds / 60);
	    if (interval > 1) {
	        return interval + " minutes";
	    }
	    return Math.floor(seconds) + " seconds";
    }


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
			   	  $(".js-list-comments").append(`<li><strong class='comment-js'>Comment added:</strong> <span class='time-color'>${timeSince(Date.now())}</span><br>Name: ${last_element.commenter}<br>${last_element.body}<br></li>`)
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



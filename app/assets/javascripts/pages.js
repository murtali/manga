$(document).ready(function(){

$("#new_page").fileupload({
		add: function (e, data) {
			$('#new_page').append('<p>' + data.files[0].name + '</p>');
			$("#new_page").on('submit', function (e) {
				data.submit();
				});
		 	$("#preview").show();
		    },
	  done: function (e, data) {
	  	$('#new_page p').remove();
	  	$('.edit-chapter-pages').html(data.result.chapter_pages)
	    }
});


$("#new_page").on('submit', function (e) {
		return false;
	        });


});

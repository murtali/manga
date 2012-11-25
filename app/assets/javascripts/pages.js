$(document).ready(function(){

  // $('#new_page').fileupload();

$("#new_page").fileupload({
// paramName: 'myfile',
// url: '/home/upload',
		add: function (e, data) {

	        console.log(e);
	        console.log(data);

	        // $("#preview").show();
	        debugger
	        $("#upload").on('click', function () {
	        		debugger
	            data.submit();
	        debugger
	        });

	    },
	    done: function (e, data) {
	    	debugger
	        alert('done');
	    }
	});

});

$(document).ready(function(){

  // $('#new_page').fileupload();


$("#new_page").fileupload({
// paramName: 'myfile',
// url: '/home/upload',
		add: function (e, data) {

	        console.log(e);
	        console.log(data);
	        console.log(data.files);


$("#new_page").on('submit', function (e) {
							console.log(data.files[0].name)
	            data.submit();
	        });


	        $("#preview").show();
	        // debugger

	    },
	    done: function (e, data) {
	    	//debugger
	        // alert('done');
	      //  return false;
	    }
	});


$("#new_page").on('submit', function (e) {
		console.log("cancelling_submission")
		return false;
	            //data.submit();
	        });

});

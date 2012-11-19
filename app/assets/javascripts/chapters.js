$(document).ready(function(){
	var pages = $('.chapter-page');

	pages.first().attr('data-active', 'true');

	var hide_page = function(page) {
		page.attr('data-active', 'false');
		page.hide();
	};

	var show_page = function(page) {
		page.attr('data-active', 'true');
		page.show();
	};

	var hide_all = function(objs) {
		objs.each(function() {
			if ($(this).attr('data-active') == 'false') {
				hide_page($(this));	
			}
		});
	};
	
	hide_all(pages);

	var	show_next = function() {
		var active = $('[data-active="true"]');
		var next = $('[data-active="true"] + .chapter-page');

		hide_page(active);
		show_page(next);
	};

	var show_previous = function () {
		var active = $('[data-active="true"]');
		var previous = $('[data-active="true"]').prev();

		hide_page(active);
		show_page(previous);

	};

	pages.click(function (){
		show_next();
	});

	$("#chapter-previous-page").click(function() {
		show_previous();
	});

	$("#chapter-next-page").click(function() {
		show_next();
	});

	$("body").keydown(
		function(event){
			if (event.which == 39 ) { show_next(); }
			else if (event.which == 37 ) { show_previous(); }
		});

	$("li#page-dropdown a").click(function(){
		var active = $('[data-active="true"]');
		var n = parseInt($(this).text());
		var nextPage = pages.eq(n-1);
		hide_page(active);
		show_page(nextPage);
	});





});
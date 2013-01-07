jQuery(document).ready(function()
{
	var contentHeight = Math.round(jQuery(window).height() - 130);

	resizeContent(contentHeight);

	window.onresize = function()
	{
		contentHeight = Math.round(jQuery(window).height() - 130);
		resizeContent(contentHeight);
	};
	
	if(jQuery("#notice"))
	{
		setTimeout(function()
		{
			jQuery("#notice").fadeOut(500);
		}, 20000);
	};

	$('#new_art').click(function(){	  	  
		$.ajax({
			url:'/casein/articles',
			data: $('form#new_article').serialize(),			
			type: "POST"        
		});
	return false;		
	});

$('#customer_date_of_birth').datePicker({clickInput:true});

$('#product_years_of_launch').datePicker({clickInput:true});
     
//comments


$('#new_comment').click(function(e) {
    $('#form_comment').lightbox_me({
        centered: true, 
        onLoad: function() { 
            $('#form_comment').find('input:first').focus()
            }
        });
    e.preventDefault();
});


});

resizeContent = function(newHeight)
{
	jQuery("#content").css({"height": newHeight+"px"});
}




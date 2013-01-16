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

	//creating new article
	$('#new_art').click(function(e){
    spinner_call();		
		$.ajax({
			url:'/casein/articles',
			data: $('form#new_article').serialize(),			
			type: "POST",
			success: function(data,status,xhr){
				var res=xhr.getResponseHeader('error_message');
				if(res!=null)
				{
				alert(res);
				}									
			},
      complete : function() {
				$("#spinner_img img").hide();
				$("#spinner_img").trigger('close');			
			}			
		});
	e.preventDefault();
	return false;		
	});

//update existing article
$('#update_art').click(function(e){	 
		spinner_call();		
		var str=window.location.href.split("/");
		var id=str[str.length-1];    	
		$.ajax({		
		url:'/casein/articles/'+id,
		data: $('form.edit_article').serialize(),			
		type: "PUT",
		success: function(data,status,xhr){
				var res=xhr.getResponseHeader('error_message');
				if(res!=null)
				{
				alert(res);
				}       			
			},
			complete : function() {
				$("#spinner_img img").hide();
				$("#spinner_img").trigger('close');			
			}			
		});
		e.preventDefault();
		return false;
	});

	
$('#customer_date_of_birth').datePicker({clickInput:true});

$('#product_years_of_launch').datePicker({clickInput:true});
     
//comments

//lightbox on
$('#new_comment').click(function(e) {
    $('#form_comment').lightbox_me({
        centered: true, 
        onLoad: function() { 
            $('#form_comment').find('input:first').focus()
            }
        });
    e.preventDefault();
});

//lightbox close
$('#lightbox-close').click(function(e) {
	$("#form_comment").trigger('close');
	e.preventDefault();
});

$('#artice_id').click(function(e) {
    spinner_call();
	  $.ajax({
			url:'/casein/articles',			
			type: "GET",
			complete : function(){
				$("#spinner_img img").hide();
				$("#spinner_img").trigger('close');			
			}
			});
      return false;
    e.preventDefault();
});

});

resizeContent = function(newHeight)
{
	jQuery("#content").css({"height": newHeight+"px"});
}

function spinner_call()
{
		$("#spinner_img img").show();
    $('#spinner_img').lightbox_me({
        centered: true, 
        onLoad: function() { 
            $('#spinner_img').find('input:first').focus()
            }
        });
}



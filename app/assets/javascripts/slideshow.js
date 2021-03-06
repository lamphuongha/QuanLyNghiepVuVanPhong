// JavaScript Document
jQuery.fn.slideMe = function(options){
	options = $.extend({		
		speed: 5000,
		transition_duration : 1500,
		width: 500,
		height: 500,
		autoPlay: true,
		showdesc : true,
		controls : null,
		transition_bg: null,
		easing:null,
		buttonPlay: false,
		buttonPause: false						
	}, options||{});
	var slide = this;
	var pre = 0;
	var cur = 0;
	var Curtimer = null;
	var aImages = $('img', this);		
	if(options.showdesc){
		var desc = $('#'+ $(slide).attr('id')+' .description');		
		var link = $('#'+ $(slide).attr('id')+' .description a');		
	}
	if(aImages!=null && aImages.length>0){
		init();			
	}
	
	function init(){
		$(aImages[0]).css({opacity:1.0});	
		$(slide).css({height:options.height});
		
		for(i=1; i< aImages.length; i++){
			$(aImages[i]).addClass('deactive');
			$(aImages[i]).css({opacity:0.0});
		}			
		if(options.showdesc){
			$(desc).css({width:options.width});
			$(link).html($(aImages[0]).attr('alt'));
			$(link).attr('href',$($(aImages[0]).parents()[0]).attr('href'));			
		}
		
		if(aImages.length>1 && options.autoPlay){
			Curtimer = setTimeout(function(){startSlide();}, options.speed);			
		}
	}	
	
	function startSlide(){			
		pre = cur;
		if(cur+1<aImages.length){
			cur = cur + 1;			
		}else{
			cur = 0;
		}		
		doSlide();
	}
	
	function doSlide(){
		if(options.showdesc){
		$(link).html($(aImages[cur]).attr('alt'));
		$(link).attr('href',$($(aImages[cur]).parents()[0]).attr('href'));			
		}
					
		$(aImages[pre]).removeClass('active').addClass('deactive');
		$(aImages[cur]).css({opacity:0.0});			
		
		$(aImages[pre]).animate({opacity: 0.0}, options.transition_duration,function(){
			$(aImages[pre]).removeClass('active').addClass('deactive');
		} );
		
		if(options.controls!=null){
			$($(options.controls).children()[pre]).removeClass("selected");
			$($(options.controls).children()[cur]).addClass("selected");
		}
		
		$(aImages[cur]).animate({opacity: 1.0}, options.transition_duration,function(){
				
			Curtimer = setTimeout(function(){startSlide();}, options.speed);
		});
	
	}
	
	function stopSlide(){
		clearTimeout(Curtimer);
	}
}

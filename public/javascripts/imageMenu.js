
//var myNav = new ImageNav($$('#kwick .kwick'),320,onClick function);
var ImageMenu = new Class({
	
	initialize: function(myElements,options){
		options = Object.extend({
			onClick: Class.empty,
			start: -1,
			openWidth: 0,
			smallWidth: 0,
			itemWidth: 0,
			selected: -1,
			open: -1
		}, options || {});
		
		this.myElements = myElements;
		this.options = options;
		
		options.itemWidth = myElements[0].getStyle('width').toInt();
		options.smallWidth = Math.round(((options.itemWidth*myElements.length)-options.openWidth)/(myElements.length-1));
		
		var fx = new Fx.Elements(myElements, {wait: false, duration: 400, transition: Fx.Transitions.quadOut});
		
		myElements.each(function(el, i){
			el.addEvent('mouseover', function(e){
				e = new Event(e).stop();
				el.show();
			});
			
			el.addEvent('click', function(e){
				el.select();
			});
			
			el.addEvent('mouseout', function(e){
				e = new Event(e).stop();
				el.hide();
			});
			
			el.show = function(){
				var obj = {};
				obj[i] = {'width': [el.getStyle('width').toInt(), options.openWidth]};
				myElements.each(function(other, j){
					if (other != el){
						var w = other.getStyle('width').toInt();
						if (w != options.smallWidth) obj[j] = {'width': [w, options.smallWidth]};
					}
				});
				fx.start(obj);
			};
			
			el.hide = function(){
				var obj = {};
				if(options.selected == -1){
					myElements.each(function(el,i){
						obj[i] = {'width': [el.getStyle('width').toInt(), options.itemWidth]};	
					});
				}else{
					myElements.each(function(el,i){
						if(i != options.selected){
							var w = el.getStyle('width').toInt();
							if(w != options.smallWidth){obj[i] = {'width': [w, options.smallWidth]}};
						}else{
							obj[i] = {'width': [el.getStyle('width').toInt(), options.openWidth]};
						}
					});
				}
				fx.start(obj);
			};
			
			el.select = function(){
				if(options.selected == i){options.selected = -1}else{options.selected = i}
				options.onClick(options.selected,options.open);
				options.open = options.selected;
			};
		});
		
		if(options.start != -1){
			myElements[options.start].show();
			myElements[options.start].select();
		}
	},
	
	reset: function(){
		this.options.selected = -1;
		this.options.open = -1;
		this.myElements.each(function(el, i){
			el.hide();
		});
	}
	
});

$(document).ready(function() { 
	(function (){

		
		/*var elems=$('.course-content');*/

/*            new Sortable(sections, {
				draggable: '.list-sections',
				handle: '.section-drag-handle',
				revert: true,
			});*/
			
		/*	[].forEach.call(sections.getElementsByClassName('section-content'), function (el){
				new Sortable(el, { group: 'photo' });
			});*/

			
			$( "#sections" ).sortable({
				//connectWith: ".column",
				handle: ".section-drag-handle",
				update: function(){ 
		             var new_order = []; 
		             $(this).children("._Section").each(function() { 
		                new_order.push(this.id); 
		             }); 
		             var charpters = new_order.join(','); 
		             var data={charpters:charpters};
		             $.ajax({
		 				url : "cms/sortChapter.action",
		 				type : "post",
		 				data : data,
		 				success : function(s) {
		 				}				
		 			});
				}	            
			});
			
			
			$( ".section-content" ).sortable({
				connectWith: ".section-content",
				handle: ".subsection-drag-handle",
				update:function(){
			     var a=this.parentNode;
			     var b=a.parentNode;			     
			     var section_id=b.id;
				 var new_order = []; 
				  $(this).children("._Subsection").each(function() { 
		                new_order.push(this.id); 
		             }); 
		             var newid = new_order.join(','); 
		             var data={section_id:section_id,newid:newid};
		             $.ajax({
			 				url : "",
			 				type : "post",
			 				data : data,
			 				success : function(s) {
			 				}				
			 			});      	             
				}
			});
			
			
			
			$( ".subsection-content" ).sortable({
				connectWith: ".subsection-content",
				handle: ".unit-drag-handle",
				update:function(){
					var a=this.parentNode;
					var b=a.parentNode;
					var subssection_id=b.id;
					var c=b.parentNode;
					var d=c.parentNode;
					var e=d.parentNode;
					var section_id=e.id;
					var new_order = []; 
					 $(this).children("._unit").each(function() { 
			                new_order.push(this.id); 
			             }); 
					 var newid = new_order.join(','); 
					 var data={section_id:section_id,subssection_id:subssection_id,newid:newid};
		             $.ajax({
			 				url : "",
			 				type : "post",
			 				data : data,
			 				success : function(s) {
			 				}				
			 			});  
				}
			});
		
	})();
});
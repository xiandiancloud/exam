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
		             //var examId="${exam.id}"
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
				 var Ch="";
			     var a=this.parentNode;
			     var b=a.parentNode;
			     var c=b.parentNode;
			     var d=$(c).children("._Section");
			     for(var i=0;i<d.length;i++){
			     var charpter=d[i].id;
			     var e=d[i].childNodes;
			     var f=e[1].childNodes;
			      
			     var h=$(f[3]).children("._Subsection");		    
				 var new_order = []; 
				 for(var y=0;y<h.length;y++) {  
					 var j=h[y].id;					  
		               new_order.push(j); 
		             }; 
		             var sequential = new_order.join(','); 
		             var Cha="{'charpter':'"+charpter+"','sequential':'"+sequential+"'}";
		              Ch+=Cha+",";
		             }
			     Ch = Ch.substring(0,Ch.length -1);		    
			    var charpters='['+Ch+']';
			    //var examId = "${exam.id}";
			    var data={charpters:charpters};
		             $.ajax({
			 				url : "cms/sortSequential.action",
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
					 var Ch="";
				     var a=this.parentNode;
				     var b=a.parentNode;
				     var c=b.parentNode;
				     var k=c.parentNode;
				     var l=k.parentNode;
				     var m=l.parentNode;
				     var d=$(m).children("._Section");
				     for(var i=0;i<d.length;i++){
				     var charpter=d[i].id;
				     var e=d[i].childNodes;
				     var f=e[1].childNodes;				      
				     var h=$(f[3]).children("._Subsection");		
				     for(var z=0;z<h.length;z++){
				     var sequential=h[z].id;
					 var g=h[z].childNodes;
					 var n=g[1].childNodes;
					 var o=$(n[3]).children("._unit");
				    var new_order = []; 
					 for(var y=0;y<o.length;y++) {  
						 var j=o[y].id;					  
			               new_order.push(j); 
			             };     
			             var vertical = new_order.join(','); 
			             var Cha="{'charpter':'"+charpter+"','sequential':'"+sequential+"','vertical':'"+vertical+"'}";
			              Ch+=Cha+",";
				     }
			             }
				     Ch = Ch.substring(0,Ch.length -1);		    
				    var charpters='['+Ch+']';
				    //var examId = "${exam.id}";
				    var data={charpters:charpters};
			             $.ajax({
				 				url : "cms/sortVertical.action",
				 				type : "post",
				 				data : data,
				 				success : function(s) {
				 				}				
				 			});      	             
					}
				});
		
	})();
});
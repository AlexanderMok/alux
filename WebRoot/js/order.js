function check(url){
	var oInputs = document.getElementsByTagName("input");
	var ids="";
	for(var i=0;i<oInputs.length;i++){
		if(oInputs[i].checked){
			ids=ids+oInputs[i].value+",";
		}
	}
	ids = ids.substring(0,ids.length-1);
	window.location.href=url+'&ids='+ids;
}


window.onload=function(){
	var oBtn = document.getElementById("btn");
	oBtn.onclick=function(){
		var oInputs = document.getElementsByTagName("input");
		for(var i=0;i<oInputs.length;i++){
			if(!oInputs[i].checked){
				oInputs[i].checked=true;
			}else{
				oInputs[i].checked=false;
			}
		}
	};
};
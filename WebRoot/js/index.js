$(function() {
	/* loginBtn click*/
	$(".login-btn").bind("click", function() {
		maskOpen();
		$("#reg-up").hide();
		$("#sign-up").show();
	});
	/* regBtn click*/
	$(".reg-btn").bind("click", function() {
		maskOpen();
		$("#sign-up").hide();
		$("#reg-up").show();
	});

	$("#closeBtn2").bind("click", function() {
		$("#reg-up").hide();
		$("#mask").remove();
	});
	
	$("input[type=radio]").bind("click",function(){
		roleName();
	});
});

function roleName(){
	var roleNames = document.getElementsByName("role");
	var roleName = document.getElementsByName("roleName")[0];
	if(roleNames[0].checked==true){
		roleName.value="卖家";
	}else if(roleNames[1].checked==true){
		roleName.value="买家";
	}else{
		roleName.value=null;
	}
}

/*mask*/
function maskOpen() {
	var sHeight = document.documentElement.scrollHeight;
	var sWidth = document.documentElement.scrollWidth;

	var oMask = document.createElement("div");
	oMask.id = "mask";
	oMask.style.height = sHeight + "px";
	oMask.style.width = sWidth + "px";
	document.body.appendChild(oMask);

	var oClose = document.getElementById("closeBtn");
	oMask.onclick = oClose.onclick = function() {
		document.body.removeChild(oMask);
		document.getElementById("sign-up").style.display = "none";
		document.getElementById("reg-up").style.display = "none";
	};
}
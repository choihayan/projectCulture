function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
			alert(msg+" 입력");
			$(item).val("");
			$(item).focus();
			return false;
	} else { return true;}
}
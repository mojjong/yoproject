/**
 * 
 */

function viewData(bno) {
	var curbno = document.form1.bbsno;
	curbno.value = bno;
	
	var prebno = document.form1.prebbsno.value;
	
	if(prebno === "" || prebno === null){
		prebno = bno;
	}

	var prediv = document.getElementById("viewContent_"+prebno);
	if(curbno.value !== prebno && prediv !== ""){
		prediv.innerHTML = "";
		document.form1.prebbsno.value = bno;
	}
	
	if(curbno.value === prebno && prediv === ""){
		var div = document.getElementById("viewContent_"+bno); 
		div.innerHTML = "";
		prebno = "";
		return;
	}
	
	var div = document.getElementById("viewContent_"+bno);
	if(div.innerHTML !== ""){
		div.innerHTML = "";
		return;
	} 
	
	  var xhr = 
		  (typeof XMLHttpRequest != 'undefined')
	    ? new XMLHttpRequest()
	    : new ActiveXObject('Microsoft.XMLHTTP');
	  xhr.open("GET", "view?bbsno="+bno, false);
	  xhr.onreadystatechange = function() {
	    var status;
	    var data;
	    if (xhr.readyState == 4) { 
	      status = xhr.status;
	      if (status == 200) {
	    	
	        data = xhr.responseText;
	        div.innerHTML = data;
	        
	        //이벤트 추가 시키기 위해서는 head에 append시켜줘야한다.
	        var head= document.getElementsByTagName('head')[0];
	        var script= document.createElement('script');
	        script.type= 'text/javascript';
	        script.innerHTML = "EventUtil.addHandler(modifybtn, 'click', function(event){" + 
	        					"modifyData();" +
	        					"});" + 
	        					"EventUtil.addHandler(deletebtn, 'click', function(event){" + 
	        					"deleteData();" +
	        					"});" + 
	        					"EventUtil.addHandler(replybtn, 'click', function(event){" + 
	        					"reCreData();" +
	        					"});";
	        head.appendChild(script);
	        
	      } else {
	    	  alert("불러오기 실패");
	      }
	    }
	  };
	  xhr.send();
}

function deleteData(){
	document.form1.method = "get";
	document.form1.action = "delete";
	document.form1.page.value = 1;
	document.form1.submit();
}

//값이 없으면 알아서 빈칸으로 인식..
function writeData(){
	document.form1.method = "get";
	document.form1.action = "write";
	document.form1.page.value = 1;
	document.form1.submit();
	
}



function writingData(){
	var upfile = document.writeForm.upfile.value;
	console.log(upfile);
	if(upfile !== null && upfile !== ""){
		document.writeForm.action = "singleUpload";
		document.writeForm.enctype = "multipart/form-data";
		document.writeForm.submit();
	}else{
		document.writeForm.action = "write";
		document.writeForm.submit();
	}
}

function modifyData(){
	var bno = document.form1.bbsno.value;
	var div = document.getElementById("viewContent_"+bno);
	
	  var xhr = 
		  (typeof XMLHttpRequest != 'undefined')
	    ? new XMLHttpRequest()
	    : new ActiveXObject('Microsoft.XMLHTTP');
	  xhr.open("GET", "modify?bbsno="+bno, false);
	  xhr.onreadystatechange = function() {
	    var status;
	    var data;
	    if (xhr.readyState == 4) { 
	      status = xhr.status;
	      if (status == 200) {
	        data = xhr.responseText;
	        div.innerHTML = data; //그 자리에 수정 페이지를 밀어넣어준다.
	      } else {
	    	  alert("불러오기 실패");
	      }
	    }
	  };
	  xhr.send();
}

function goPage(pageNo){
	document.form1.page.value = pageNo;
	document.form1.submit();
}

function goSearch(){
	document.form1.page.value = 1;
	document.form1.submit();
}

function reCreData(){
	alert("댓글쓰기");
	document.rwForm.method = "POST";
	document.rwForm.action="reWrite";
	document.rwForm.submit();
}

function reModify(replyNo){
	/*document.reForm.method ="post";
	document.reForm.action = "reModify";
	document.reForm.submit();*/
	var div = document.getElementById("reContent_" + replyNo);
	
	
	var xhr = 
		  (typeof XMLHttpRequest != 'undefined')
	    ? new XMLHttpRequest()
	    : new ActiveXObject('Microsoft.XMLHTTP');
	  xhr.open("GET", "reModify?replyNo="+replyNo, false);
	  xhr.onreadystatechange = function() {
	    var status;
	    var data;
	    if (xhr.readyState == 4) { 
	      status = xhr.status;
	      if (status == 200) {
	    	console.log("aaaaaaa");
	        data = xhr.responseText;
	        
	        div.innerHTML = data;
	        
	        var head= document.getElementsByTagName('head')[0];
	        var script= document.createElement('script');
	        script.type= 'text/javascript';
	        script.innerHTML = "EventUtil.addHandler(reUpdatebtn, 'click', function(event){" + 
	        					"reUpdate();" +
	        					"})";
	        head.appendChild(script);
	       
	      } else {
	    	  alert("불러오기 실패");
	      }
	    }
	  };
	  xhr.send();
	
}

function reUpdate(){
	document.reForm.replyNo.value = document.reForm.update_replyNo.value;
	document.reForm.method = "post";
	
	document.reForm.action = "reUpdate";
	document.reForm.submit();
	
}


function reDelete(replyNo){
	
	document.reForm.method ="get";
	document.reForm.action = "reDelete";
	document.reForm.replyNo.value = replyNo;

	document.reForm.submit();
}








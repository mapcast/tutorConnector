function tday(ju){
	var title = document.getElementById(ju); // ���ҷ����� 
	f = document.frm; //��ư 
	f.dbtn.value= title.textContent; //��ư�� �� �ֱ�
	//�� �ٲٱ�
	  var list = ["ju2","ju3","ju5","jua"];
		  for (var i=0;i<4;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	title.style.backgroundColor="rgb(88, 193, 137)";
	title.style.color="white";
}

function tGender(man){
	var title = document.getElementById(man); // ���ҷ����� 
	f = document.frm; //��ư 
	f.gbtn.value= title.textContent; //��ư�� �� �ֱ�
	//�� �ٲٱ�
	 var list = ["man","woman","human"];
		  for (var i=0;i<3;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	title.style.backgroundColor="rgb(88, 193, 137)";
	title.style.color="white";
}

function tfee(fee){
	var title = document.getElementById(fee); // ���ҷ����� 
	f = document.frm; //��ư 
	f.fbtn.value= title.textContent; //��ư�� �� �ֱ�
	//�� �ٲٱ�
	 var list = ["f30","f40","f50","f60","f70","fa"];
		  for (var i=0;i<6;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	title.style.backgroundColor="rgb(88, 193, 137)";
	title.style.color="white";
}

function ttime(time){
	var title = document.getElementById(time); // ���ҷ����� 
	f = document.frm; //��ư 
	f.tbtn.value= title.textContent; //��ư�� �� �ֱ�
	//�� �ٲٱ�
	 var list = ["tmornig","tafternoon","tevening","tall"];
		  for (var i=0;i<4;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	title.style.backgroundColor="rgb(88, 193, 137)";
	title.style.color="white";
}

function tobj(obj){
	var title = document.getElementById(obj); // ���ҷ����� 
	f = document.frm; //��ư 
	f.tobj.value= title.textContent; //��ư�� �� �ֱ�
	//�� �ٲٱ�(������)
/*	if(obj=="obj6"){
		 var list = ["obj1","obj2","obj3","obj4","obj5","obj6"];
		  for (var i=0;i<6;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	}
	else{*/
	 var list = ["obj1","obj2","obj3","obj4","obj5","obj6"];
		  for (var i=0;i<6;i++){
	  		document.getElementById(list[i]).style.backgroundColor="white";
	  		document.getElementById(list[i]).style.color="black";
		  }
	title.style.backgroundColor="rgb(88, 193, 137)";
	title.style.color="white";
}
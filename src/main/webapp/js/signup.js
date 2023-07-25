
window.onload = function(){	
	function print(){
	                var id=document.getElementById('u_id').value;
	                var pw=document.getElementById('u_pw').value;
	                if(id==""){
	                    alert("아이디를 입력해 주세요");
	                    return false;
	                }else if(pw==""){
	                    alert("비밀번호를 입력해 주세요");
	                    return false;
	                }else{
	                  alert("회원가입이 완료되었습니다.");
	                }
	              }
	          document.getElementById('su').onclick = function(){ print() };

		function check(){
			var id = document.getElementById('u_id');
			var cf = document.getElementById('cf');
			var pw = document.getElementById('u_pw');
			var name = document.getElementById('u_name');
			var tel = document.getElementById('u_tel');
			var email = document.getElementById('email');
			var adr = document.getElementById('u_address');	
			var ereg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 	
			var treg = /^010[0-9]{4}[0-9]{4}$/;
			if(id.value.trim() == ""){
				alert("아이디를 입력해주세요");
				id.focus();
			}
			
			if(id.value.length < 4){
				alert("아이디는 4글자 이상 입니다.")
				id.focus();
			}
			
			if
			
			
			
		}
		
		var submit = document.getElementsByClassName('btn')[0];





}
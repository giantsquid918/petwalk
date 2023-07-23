$(function() {
	$("#dbidCheck").click(function() {
		var id = $('#id').val();
		$.ajax({
			url : './IdCheck',
			type : 'get',
			data : {
				id : id
			},
			success : function(result) {

				console.log("아이디 값 - " + result);
				// alert(result);
				if ($.trim(result) == 1) {
					alert("이미 등록된 아이디입니다.");
					$("#id").focus();
				} else {
					alert("등록할 수 있는 아이디입니다.");
					$('#idCheck').val("1");
					$("#name").focus();
				}
			}
		});
	});
	$("input[id='id']").on("change", function() {
		$("#idCheck").val(0);
		// console.log("1111체크값 - " + $("#idCheck").val());
	});
});

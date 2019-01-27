$(function () {
    $('.panel').css({'margin-left':'650px','margin-top':'100px'});
    $('#registerDlg').dialog({
    })
})
function register() {
    $('#registerDlg').dialog('open');
}
function submitF() {
    var username = $("input[name=username]").val();
    var pwd = $("input[type=password]").val();
    $.ajax({
        url:contextPath+"/login",
        type:"post",
        data:{
            username:username,
            password:pwd
        },
        success:function (data,status,xhr) {
            console.log(status+" "+xhr.status);
            if(status == "success"){
                window.location.href = contextPath + "/jsp/first.jsp?a=2";
            }else{
                console.log("affff");
            }

        },
        error:function (data,status,xhr) {
            console.log(status+" "+xhr.status);
        }
    })
    /*$('#ff').form('submit',{
        onSubmit:function(e){
            return $(this).form('enableValidation').form('validate');
        },
        success:function (e) {
            console.log(e);
            //window.location.href = contextPath + "/jsp/first.jsp";
        }
    });*/
}
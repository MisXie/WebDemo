$.extend($.fn.validatebox.defaults.rules, {
    confirmPass: {
        validator: function(value, param){
            var pass = $(param[0]).passwordbox('getValue');
            return value == pass;
        },
        message: '输入的密码不一致'
    }
})
$(function () {
    $('.panel').css({'margin-left':'70%','margin-top':'15%'});
    init();
})

function init() {
    $('#registerDlg').dialog({
        closed:true,
        hide:'slide',
        width:'400px',
        height:'300px',
        iconCls:'icon-save',
        resizable:true,
        modal:true,
        buttons:[{
            text:'register',
            iconCls:'icon-ok',
            handler:function (e) {
                var email = $('input[name=email]').val();
                var pass = $('#password').val();
                var pass2 = $('#pass2').val();
                var aconut = $('input[name=rUsername]').val();
                var registerInfo = validateFromDB(email,pass,pass2,aconut);
                if(!registerInfo){

                }else{
                    if(registerInfo.validateInfo != ''){
                        alert(registerInfo.validateInfo);
                    }else{
                        //注册成功，跳到登录页
                        window.location.href = contextPath + "/jsp/login.jsp?acount="+registerInfo.username;
                    }
                 }
            }
        },{
            text:'exit',
            iconCls:'icon-cancel',
            handler:function () {
                $('#registerDlg').dialog('close');
            }
        }]
    });
}

function register() {
    $('#registerDlg').dialog('open');
}

function submitF() {
    var username = $("input[name=username]").val();
    var pwd = $("input[type=password]").val();
    url = contextPath + '/login';
    data = {
        username:username,
        password:pwd
    }
    ajaxSendData(url,data,false)
}

function ajaxSendData(url,data,async,fn) {
    var responseData;
    $.ajax({
        url:url,
        type:"post",
        async:false,
        data:data,
        success:function (data,status,xhr) {
            console.log(status+" "+xhr.status);
            if(status == "success"){
                responseData = data;
            }else{
                alert('服务器异常。。。')
            }
        },
        error:function (data,status,xhr) {
            alert('服务器异常。。。');
        }
    })
    return responseData;
}

//后端认证
function validateFromDB(email,pass,pass2,aconut) {
    if(!validateEmail(email) || (pass != pass2) || (pass.trim() ==''
        || pass2.trim() == '') || aconut.trim() == ''){
        return;
    }
    url = contextPath + '/register';
    data = {
        username:aconut,
        password:pass,
        email:email
    }
    var regData = ajaxSendData(url,data,true);
    return regData;
}

// 验证邮箱函数,正确返回 true，错误返回false
function validateEmail(email) {
    //验证邮箱正则
    var re = /^(([^()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    return re.test(email);
}

function resize() {
    var clientHeight = document.documentElement.clientHeight;
    var clientWidth = document.documentElement.clientWidth;
    $('#loginDiv').css("height", clientHeight+"px");
    $('#loginDiv').css("width", clientWidth+"px");
}
resize();
window.onresize = function (ev) {
    resize();
}
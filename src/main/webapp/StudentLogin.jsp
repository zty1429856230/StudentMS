
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学会登录</title>
</head>
<body>
<form action="StudentLogin.action" method="post">
    <table align="center" width="100%">
        <tr>
            <td align="center" width="100%">
                <h1>学生信息管理系统</h1>
            </td>
        </tr>
        <tr>
            <td width="70%">
                <table border="0" align="center" >
                    <tr>
                        <td>
                            <h4>学生登录</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:textfield name="name" label="登录名" size="16"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <s:password name="pass" label="登录密码" size="16"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="确定"/>
                                 
                            <input type="reset" value="清空"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <a href="AdminLogin.jsp">管理员登录</a>
        </tr>

    </table>
</form>
</body>
</html>

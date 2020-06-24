<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<h1>学生信息管理系统</h1>
<h4>当前登陆：学生<s:property value="#session.Studentname"/> <a href="StudentLogin.jsp">退出</a></h4>

<table border="2">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>高数</td>
        <td>英语</td>
        <td>专业课</td>
    </tr>
    <s:iterator value="#session.stuScore" status="st">
        <tr>
            <td><s:property value="studentID"/></td>
            <td><s:property value="name"/> </td>
            <td><s:property value="Math"/></td>
            <td><s:property value="English"/></td>
            <td><s:property value="Major"/></td>

        </tr>
    </s:iterator>
</table>


</body>
</html>

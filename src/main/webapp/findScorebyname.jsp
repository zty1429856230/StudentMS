<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通过名字查找分数</title>
</head>
<body>
<h1>学生信息管理系统</h1>
<h4>当前登陆：<s:property value="#session.adminRole"/><s:property value="#session.adminUsername"/> <a href="AdminLogin.jsp">退出</a></h4>
<a href="findAllScore.jsp">返回</a>
<table border="2">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>高数</td>
        <td>英语</td>
        <td>专业课</td>
    </tr>
    <s:iterator value="#session.scoreList2" status="st">
        <tr>
            <td><s:property value="studentID"/></td>
            <td><s:property value="name"/> </td>
            <td><s:property value="Math"/></td>
            <td><s:property value="English"/></td>
            <td><s:property value="Major"/></td>
            <td><a href="updateScore.jsp?studentID=<s:property value="studentID"/>"> 修改</a></td>
        </tr>
    </s:iterator>
</table>


</body>
</html>

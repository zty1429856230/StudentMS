<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<h1>学生信息管理系统</h1>
<h4><s:property value="#session.adminRole"/><s:property value="#session.adminUsername"/> </h4>

<table border="2">
    <tr>
        <td>序号</td>
        <td>学号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>生日</td>
        <td>学校</td>
        <td>学院</td>
        <td>专业</td>
        <td>分数</td>
        <td colspan="2">操作</td>
    </tr>
    <s:iterator value="#session.findstuList" status="st">
        <tr>
            <td><s:property value="#st.count"/> </td>
            <td><s:property value="studentID"/></td>
            <td><s:property value="name"/></td>
            <td><s:property value="password"/></td>
            <td><s:property value="sex"/></td>
            <td><s:property value="birthday"/></td>
            <td><s:property value="university"/></td>
            <td><s:property value="department"/></td>
            <td><s:property value="major"/></td>
            <td><s:property value="grade"/></td>
            <td><a href="deleteStudent.action?stuid=<s:property value="studentID"/>"> 删除</a></td>
            <td><a href="updateMess.jsp?name=<s:property value="name"/> "> 修改</a></td>
        </tr>
    </s:iterator>
    <tr><td colspan="11" align="center"><a href="AdminSuccess.jsp">返回</a> </td></tr>
</table>


</body>
</html>

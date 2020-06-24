<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<h1>学生信息管理系统</h1>
<h4>当前登陆：<s:property value="#session.adminRole"/><s:property value="#session.adminUsername"/> <a href="AdminLogin.jsp">退出</a> </h4>

<form method="post" action="findStudent.action">
    <table>
        <tr>
            <td><input type="text" name="find"></td>
            <td><input type="submit" value="查询"></td>
        </tr>
    </table>
</form>
<form method="post" action="findStudent2.action">
    <table>
        <tr>
            <td>
                <s:select name="find2" label="学院名称" headerValue="----请选择----" headerKey="1"
                      list="{'信电学院','物理学院','马克思学院','经济学院'}">
                </s:select>
            </td>
            <td> <input type="submit" value="查询"> </td>
        </tr>

    </table>
</form>
<a href="insertStu.jsp"><input type="button" value="添加学生信息"></a>

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
    <td>年级</td>
    <td colspan="2">操作</td>

        <td><a href="findAllScore.jsp?studentID=<s:property value="studentID"/>">分数管理</a></td>
</tr>
    <s:iterator value="#session.stuList" status="st">
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
            <td><a href="updateMess.jsp?studentID=<s:property value="studentID"/> "> 修改</a></td>

        </tr>

    </s:iterator>


</table>


</body>
</html>
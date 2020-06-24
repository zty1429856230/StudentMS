<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
</head>
<body>

<form action="updateStudent.action" method="post">
    <table border="0">
        <s:iterator value="#session.stuList.{?#this.studentID == #parameters.studentID[0]}" status="st">
                <tr>
                    <td>学号:</td>
                    <td><input type="text" name="stu.studentID" value="<s:property value="studentID"/>"> </td>
                </tr>
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" name="stu.name" value="<s:property value="name"/>"> </td>
                </tr>
            <tr>
                <td>密码</td>
                <td><input type="text" name="stu.password" value="<s:property value="password"/>"> </td>
            </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                        <input type="radio" name="stu.sex" value="男" checked="checked"/>男
                        <input type="radio" name="stu.sex" value="女" />女<br>
                    </td>
<%--                    <td><input type="text" name="stu.sex" value="<s:property value="sex"/>"> </td>--%>
                </tr>
                <tr>
                    <td>生日:</td>
                    <td><input type="date" name="stu.birthday" value="<s:property value="birthday"/>"> </td>
                </tr>
                <tr>
                    <td>学校:</td>
                    <td><input type="text" name="stu.university" value="<s:property value="university"/>"> </td>
                </tr>
                <tr>
                    <td>学院:</td>
                    <td><input type="text" name="stu.department" value="<s:property value="department"/>"> </td>
                </tr>
                <tr>
                    <td>专业:</td>
                    <td><input type="text" name="stu.major" value="<s:property value="major"/>"> </td>
                </tr>
                <tr>
                    <td>年级:</td>
                    <td><input type="text" name="stu.grade" value="<s:property value="grade"/>"> </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input   type="submit" value="确 定" size="12">     
                        <input  type="reset" value="清 除" size="12">
                    </td>
                </tr>

        </s:iterator>
    </table>
</form>
</body>
</html>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改分数信息</title>
</head>
<body>

<form action="updateScore.action" method="post">
    <table border="0">
        <s:iterator value="#session.scoreList.{?#this.studentID == #parameters.studentID[0]}" status="st">
            <tr>
                <td>学号:</td>
                <td><input type="text" name="score.studentID" value="<s:property value="studentID"/>"> </td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="score.name" value="<s:property value="name"/>"> </td>
            </tr>
            <tr>
                <td>高数:</td>
                <td><input type="text" name="score.Math" value="<s:property value="Math"/>"> </td>
            </tr>
            <tr>
                <td>英语:</td>
                <td><input type="text" name="score.English" value="<s:property value="English"/>"> </td>
            </tr>
            <tr>
                <td>专业课:</td>
                <td><input type="text" name="score.Major" value="<s:property value="Major"/>"> </td>
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

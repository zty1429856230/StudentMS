<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
</head>
恭喜！<s:property value="name"/> 登陆成功
<h2 align="center">学生信息</h2>
<frameset>
<form method="post" action="findStudent.action">
    <table>
        <tr>
            <td><input type="text" name="find"></td>
            <td><input type="submit" value="查询"></td>
        </tr>
    </table>
</form>
<from>
<a href="insertStu.jsp"><input type="button" value="添加学生信息"></a>
</from>

</frameset>
</table>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生信息</title>
</head>
<body>
<h3 align="lift">添加学生信息</h3>
<form action="insertStudent.action" method="post">
    学号：<input type="text" name="stu.StudentID"><br>
    姓名：<input type="text" name="stu.name" ><br>
    密码：<input type="password" name="stu.password" ><br>
    性别：
    <input type="radio" name="stu.sex" value="男" checked="checked"/>男
    <input type="radio" name="stu.sex" value="女" />女<br>
    生日：<input type="date" name="stu.birthday"><br>
    学校：<input type="text" name="stu.university" ><br>
    学院：<input type="text" name="stu.department" ><br>
    专业：<input type="text" name="stu.major" ><br>
    年级：<input type="text" name="stu.grade" ><br>

    <input type="submit" value="提 交"/>
    <input type="reset" value="清 除"/>
</form>

</form>
</body>
</html>

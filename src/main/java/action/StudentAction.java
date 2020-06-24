package action;

import PO.Score;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import PO.Student;
import dao.HbnUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StudentAction extends ActionSupport implements SessionAware {

    private int stuid;
    private Student stu;
    private Score score;
    private String find;
    private String find2;
    private String find3;
    private String name;
    private String pass;

    private Map<String, Object> session;
     List<Student> stuList;
     List<Student> findstuList = new ArrayList<Student>();
     List<String> deptList;
     List<Score> scoreList;

    public String studentLogin(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        String hql = "from Student where name=?1 and password=?2";
        Student student = (Student) hbnSession.createQuery(hql)
                .setParameter(1, this.getName())
                .setParameter(2, this.getPass())
                .uniqueResult();

        String hql2="from Score where name like ?1";
        find3 =this.getName() ;
        System.out.println("find"+find3);
        scoreList=hbnSession.createQuery(hql2).setParameter(1, find3).list();
        System.out.println(scoreList);
        session.put("stuScore",scoreList);

        hbnSession.getTransaction().commit();
        ActionContext ac=ActionContext.getContext();
        session=ac.getSession();
        if(student == null) {
            return "login";
        } else {
            session.put("Studentname",name);
            return "success";
        }
}



    //查询所有分数
    public String findAllscore(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        String hql="from Score";
        scoreList=hbnSession.createQuery(hql).list();
        session.put("scoreList",this.scoreList);
        hbnSession.getTransaction().commit();
        if (scoreList!=null)
            return "success";
        else
            return  "error";
    }

//更新分数
    public String updateScore(){
        try{
            Session hbnSession = HbnUtils.getSession();
            hbnSession.beginTransaction();

            hbnSession.update(score);
            hbnSession.getTransaction().commit();
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return "error";
        }

    }

    //通过学生姓名查找分数
    public String findScore(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        ActionContext ac=ActionContext.getContext();
        session=ac.getSession();

        String hql="from Score where name like ?1";
        find3="%"+find3+"%";
        System.out.println("find"+find3);
        scoreList=hbnSession.createQuery(hql).setParameter(1, find3).list();
        System.out.println(scoreList);
        session.put("scoreList2",scoreList);
        hbnSession.getTransaction().commit();
        if (scoreList!=null)
            return "success";
        else
            return "error";

    }



    //HQL查询全部学生
    public String findAll(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        String hql="from Student";
        stuList=hbnSession.createQuery(hql).list();
        session.put("stuList",this.stuList);

        String hql2="from Score";
        scoreList=hbnSession.createQuery(hql2).list();
        session.put("scoreList",this.scoreList);

        hbnSession.getTransaction().commit();
        if (stuList!=null)
            return "success";
        else
            return  "error";
    }

//插入学生信息
    public String insertStudent(){
        try{
            Session hbnSession = HbnUtils.getSession();
            hbnSession.beginTransaction();
            hbnSession.save(stu);
//分数表中插入学生id和姓名
            Score sco = new Score();
            sco.setStudentID(stu.getStudentID());
            sco.setName(stu.getName());
            hbnSession.save(sco);

            hbnSession.getTransaction().commit();
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return  "error";
        }
    }

//删除学生信息
    public String deleteStudent(){
        try{
            Session hbnSession = HbnUtils.getSession();
            hbnSession.beginTransaction();
            Student s = new Student();
            Score sco = new Score();

            s.setStudentID(stuid);
            sco.setStudentID(stuid);
            hbnSession.delete(s);
            hbnSession.delete(sco);
            hbnSession.getTransaction().commit();
            return "success";
        }catch(Exception e){
            e.printStackTrace();
        }
        return  "error";
    }
    
//更新学生信息
    public String updateStudent(){
        try{
            Session hbnSession = HbnUtils.getSession();
            hbnSession.beginTransaction();

            hbnSession.update(stu);
            hbnSession.getTransaction().commit();
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return  "error";
        }

    }



    //根据学生姓名模糊查询
    public String findStudent(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        ActionContext ac=ActionContext.getContext();
        session=ac.getSession();

        String hql="from Student where name like ?1";
        find="%"+find+"%";
        System.out.println("find"+find);
        stuList=hbnSession.createQuery(hql).setParameter(1, find).list();
        session.put("findstuList",stuList);
        hbnSession.getTransaction().commit();
        if (findstuList!=null)
            return "success";
        else
            return "error";
    }

    //根据学院查询
    public String findbydept(){
        Session hbnSession = HbnUtils.getSession();
        hbnSession.beginTransaction();
        ActionContext ac=ActionContext.getContext();
        session=ac.getSession();

        String hql="from Student where department like ?1";
        find2="%"+find2+"%";
        System.out.println("find"+find2);
        stuList=hbnSession.createQuery(hql).setParameter(1, find2).list();
        session.put("findstuList2",stuList);
        hbnSession.getTransaction().commit();
        if (findstuList!=null)
            return "success";
        else
            return "error";
    }

    public int getStuid() {
        return stuid;
    }

    public void setStuid(int stuid) {
        this.stuid = stuid;
    }

    public Student getStu() {
        return stu;
    }

    public void setStu(Student stu) {
        this.stu = stu;
    }

    public String getFind() {
        return find;
    }

    public void setFind(String find) {
        this.find = find;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }


    public List<Student> getStuList() {
        return stuList;
    }

    public void setStuList(List<Student> stuList) {
        this.stuList = stuList;
    }

    public List<Student> getFindstuList() {
        return findstuList;
    }

    public void setFindstuList(List<Student> findstuList) {
        this.findstuList = findstuList;
    }

    public List<String> getDeptList() {
        return deptList;
    }

    public void setDeptList(List<String> deptList) {
        this.deptList = deptList;
    }

    public String getFind2() {
        return find2;
    }

    public void setFind2(String find2) {
        this.find2 = find2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public List<Score> getScoreList() {
        return scoreList;
    }

    public void setScoreList(List<Score> scoreList) {
        this.scoreList = scoreList;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
    }

    public String getFind3() {
        return find3;
    }

    public void setFind3(String find3) {
        this.find3 = find3;
    }
}

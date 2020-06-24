package action;

import PO.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.HbnUtils;
import org.hibernate.Session;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.Map;

public class AdminAction extends ActionSupport {

    private String name;
    private String pass;
    private Session hbnsession;
    private Map<String, Object> session;
    private ArrayList<Admin> adminArrayList = new ArrayList<Admin>();

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Session getHbnsession() {
        return hbnsession;
    }

    public void setHbnsession(Session hbnsession) {
        this.hbnsession = hbnsession;
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

    @Override
    public String execute() throws Exception {
        hbnsession = HbnUtils.getSession();
        hbnsession.beginTransaction();
        String hql = "from Admin where admin_name=?1 and admin_password=?2";
        Admin admin = (Admin)hbnsession.createQuery(hql)
                .setParameter(1, this.getName())
                .setParameter(2, this.getPass())
                .uniqueResult();
        hbnsession.getTransaction().commit();
        ActionContext ac=ActionContext.getContext();
        session=ac.getSession();
        if(admin == null) {
            return "login";
        } else {
            session.put("adminUsername",name);
            session.put("adminRole",admin.getAdmin_rolename());
            return "success";
        }

    }
}

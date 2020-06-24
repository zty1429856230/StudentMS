package action;

import PO.Score;
import com.opensymphony.xwork2.ActionSupport;
import dao.HbnUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import java.util.List;
import java.util.Map;

public abstract class ScoreAction extends ActionSupport implements SessionAware {


    List<Score> scoreList;
    private Map<String, Object> session;

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


    public List<Score> getScoreList() {
        return scoreList;
    }

    public void setScoreList(List<Score> scoreList) {
        this.scoreList = scoreList;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}

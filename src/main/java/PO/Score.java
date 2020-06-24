package PO;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "score_MS")
public class Score {
    private int studentID;
    private String name;
    private int Math;
    private int English;
    private int Major;
    public Score(){

    }

    public Score(int studentID, String name, int math, int english, int major) {
        this.studentID = studentID;
        this.name = name;
        Math = math;
        English = english;
        Major = major;
    }

    @Id
    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMath() {
        return Math;
    }

    public void setMath(int math) {
        Math = math;
    }

    public int getEnglish() {
        return English;
    }

    public void setEnglish(int english) {
        English = english;
    }

    public int getMajor() {
        return Major;
    }

    public void setMajor(int major) {
        Major = major;
    }

    @Override
    public String toString() {
        return "Score{" +
                "studentID=" + studentID +
                ", name='" + name + '\'' +
                ", Math=" + Math +
                ", English=" + English +
                ", Major=" + Major +
                '}';
    }
}

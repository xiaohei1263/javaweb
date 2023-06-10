package xiaohei.model;

public class StudentModel {
    private String id = null;
    private String name = null;
    private String age = null;
    private String jspScore = null;

    public String GetId() {
        return id;
    }

    public String GetName() {
        return name;
    }

    public String GetAge() {
        return age;
    }

    public String GetJspScore() {
        return jspScore;
    }

    public void SetId(String id) {
        this.id = id;
    }

    public void SetName(String name) {
        this.name = name;
    }

    public void SetAge(String age) {
        this.age = age;
    }

    public void SetJspScore(String jspScore) {
        this.jspScore = jspScore;
    }
}

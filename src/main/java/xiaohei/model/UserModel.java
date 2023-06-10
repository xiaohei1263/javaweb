package xiaohei.model;

public class UserModel {
    private String Username;
    private String Password;
    public String GetUsername() {
        return Username;
    }

    public String GetPassword() {
        return Password;
    }
    public void SetUsername(String Username) {
        this.Username = Username;
    }

    public void SetPassword(String Password) {
        this.Password = Password;
    }
}

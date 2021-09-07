package com.alexlin.yangocanteen.bean;

public class User {
    private String username;
    private String password;
    private int identify;
    private String token;

    public User(String username, String password, int identify, String token) {

    }

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdentify() {
        return identify;
    }

    public void setIdentify(int identify) {
        this.identify = identify;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", identify=" + identify +
                ", token='" + token + '\'' +
                '}';
    }
}

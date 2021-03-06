package com.alexlin.yangocanteen.bean;


import javax.validation.constraints.NotNull;

public class FeedBack {
    private String username;
    @NotNull(message = "内容必须传递！")
    private String feedback;
    private String contact;

    public FeedBack(String username, String feedback, String contact) {
    }

    public FeedBack() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
                "username='" + username + '\'' +
                ", feedback='" + feedback + '\'' +
                ", contact='" + contact + '\'' +
                '}';
    }
}

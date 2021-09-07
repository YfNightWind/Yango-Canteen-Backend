package com.alexlin.yangocanteen.bean;

public class Menu {
    private String name;
    private String restaurant;
    private String category;
    private double price;
    private double score;

    public Menu() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(String restaurant) {
        this.restaurant = restaurant;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "name='" + name + '\'' +
                ", restaurant='" + restaurant + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", score=" + score +
                '}';
    }
}

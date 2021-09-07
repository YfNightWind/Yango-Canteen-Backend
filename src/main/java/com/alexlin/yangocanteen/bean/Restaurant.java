package com.alexlin.yangocanteen.bean;

public class Restaurant {
    private String name;
    private int floor;
    private double score;

    public Restaurant(String name, int floor, double score) {
    }

    public Restaurant() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "name='" + name + '\'' +
                ", floor=" + floor +
                ", score=" + score +
                '}';
    }
}

package com.alexlin.yangocanteen.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {
    private String name;
    private String restaurant;
    private String category;
    private double price;
    private double score;
}

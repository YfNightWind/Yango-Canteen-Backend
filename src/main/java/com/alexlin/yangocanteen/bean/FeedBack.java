package com.alexlin.yangocanteen.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FeedBack {
    private String username;
    private String feedback;
    private String contact;
}

package com.alexlin.yangocanteen.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//出错或成功时返回的内容
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseResult {
    private int code;//200 means success
    private String msg;
    private Object data;
}

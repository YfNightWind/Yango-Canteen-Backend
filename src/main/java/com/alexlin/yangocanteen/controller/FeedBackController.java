package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.bean.FeedBack;
import com.alexlin.yangocanteen.service.FeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("feedback")
public class FeedBackController {

    @Autowired
    FeedBackService feedBackService;

    // 发送反馈
    @PostMapping("/commit")
    public BaseResult commit(FeedBack feedBack) {

        if (feedBack.getFeedback() == null) {
            return new BaseResult(400, "内容必须传", "");
        }

        if (feedBackService.sendFeedBack(feedBack) == 0) {
            return new BaseResult(406, "无法完成请求！", "");
        }

        return new BaseResult(200, "反馈成功！", "");


    }
}

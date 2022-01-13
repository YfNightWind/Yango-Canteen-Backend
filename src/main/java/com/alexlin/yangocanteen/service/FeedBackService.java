package com.alexlin.yangocanteen.service;

import com.alexlin.yangocanteen.bean.FeedBack;
import com.alexlin.yangocanteen.mapper.FeedBackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedBackService {
    @Autowired
    private FeedBackMapper feedBackMapper;

    public int sendFeedBack(FeedBack feedBack) {
        return feedBackMapper.sendFeedBack(feedBack);
    }

}

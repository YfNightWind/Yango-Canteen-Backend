package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.FeedBack;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface FeedBackMapper {
    // 发送反馈
    int sendFeedBack(FeedBack fb);
}

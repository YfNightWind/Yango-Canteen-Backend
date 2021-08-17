package com.alexlin.yangocanteen.mapper;

import com.alexlin.yangocanteen.bean.FeedBack;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FeedBackMapper {
    @Insert("INSERT INTO feedback(username,contact,feedback) VALUES (#{username},#{feedback},#{contact})")
    int feedback(FeedBack fb);
}

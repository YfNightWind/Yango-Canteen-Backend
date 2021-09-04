package com.alexlin.yangocanteen.controller;

import com.alexlin.yangocanteen.result.BaseResult;
import com.alexlin.yangocanteen.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

@RestController
@RequestMapping("upload")
public class UploadFileController {
    @PostMapping
    public BaseResult upload(@RequestParam("image") MultipartFile image) throws Exception {

        String path = "";// 路径待确定
        String result = FileUtil.upload(image,path, Objects.requireNonNull(image.getOriginalFilename()));

        return new BaseResult(200,"上传成功！",result);
    }
}

package com.alexlin.yangocanteen.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class FileUtil {
    /**
     * @param fileType MultipartFile 上传的文件的类型
     * @param path     文件路径 xxx/xxx/xxx
     * @param fileName xxx.jpg
     * @return nothing
     * @throws Exception e
     */
    public static String upload(MultipartFile fileType, String path, String fileName) throws Exception {
        // 文件类型校验

        // 原始文件名称
        String originalFileName = fileType.getOriginalFilename();
        // 解析文件后缀
        assert originalFileName != null;
        int index = originalFileName.lastIndexOf(".");
        String suffix = null;
        if (index == -1 || (suffix = originalFileName.substring(index + 1)).isEmpty()) {
            return "文件后缀不能为空！";
        }


        // 将获取到到文件名称修改成一个独一无二的新名称
        String realFilePath = path + "/" + UUID.randomUUID().toString().replace("-", "")
                + fileName.substring(fileName.lastIndexOf("."));
        File destination = new File(realFilePath);
        // 判断目录是否存在
        if (!destination.getParentFile().exists()) {
            destination.getParentFile().mkdir();
        }
        // 保存文件
        fileType.transferTo(destination);

        return realFilePath;
    }
}

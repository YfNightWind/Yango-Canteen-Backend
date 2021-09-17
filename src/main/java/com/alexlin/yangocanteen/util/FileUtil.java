package com.alexlin.yangocanteen.util;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public class FileUtil {
    /**
     * @param multipartFile MultipartFile 上传的文件的类型
     * @param path          文件路径 xxx/xxx/xxx
     * @param fileName      xxx.jpg
     * @return nothing
     * @throws IOException e
     */
    public static String upload(MultipartFile multipartFile, String path, String fileName) throws IOException {
        // 文件类型校验

        // 原始文件名称
        String originalFileName = multipartFile.getOriginalFilename();

        // 解析文件后缀
        assert originalFileName != null;
        int index = originalFileName.lastIndexOf(".");
        String suffix = null;
        if (index == -1 || (suffix = originalFileName.substring(index + 1)).isEmpty()) {
            return "文件后缀不能为空！";
        }

        // 允许上传的文件后缀列表
        Set<String> allowSuffix = new HashSet<>(Arrays.asList("jpg", "jepg", "png", "gif"));
        if (!allowSuffix.contains(suffix.toLowerCase())) {
            return "非法文件，不允许的文件类型：" + suffix;
        }

        // 先建立一个临时文件便于校验
        File tempFile = new File(System.getProperty("java.io.tmpdir"), originalFileName);

        try {
            multipartFile.transferTo(tempFile);
            try {
                // 尝试IO文件判断文件的合法性
                BufferedImage bufferedImage = ImageIO.read(tempFile);
                bufferedImage.getWidth();
                bufferedImage.getHeight();
            } catch (Exception e) {
                // IO异常，不是合法的文件图片，返回异常
                return "文件不是图片文件";
            }

            // 复制到上传目录
            FileCopyUtils.copy(new FileInputStream(tempFile), Files.newOutputStream(Paths.get(
                    "/Users/alexlin/Downloads", originalFileName
            ), StandardOpenOption.CREATE_NEW));
        } finally {
            // 始终删除临时文件
            tempFile.delete();
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
        multipartFile.transferTo(destination);

        return realFilePath;
    }
}

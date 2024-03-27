package com.it.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

public class FileUploadUtil {
    private String path=System.getProperty("user.dir")+"/temp/";

    public String  uploadFile(MultipartFile file){
        System.out.println("path===="+path);
        String fileName=file.getOriginalFilename();
        String fileExtensionName=fileName.substring(fileName.lastIndexOf(".")+1);
        String uploadFileName= UUID.randomUUID().toString()+"."+fileExtensionName;
        //log.info("开始上传文件，上传文件名{}，上传路径{}，新文件名{}",fileName,path,fileExtensionName);
        File fileDir=new File(path);
        if (!fileDir.exists()){
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        File targetFile=new File(path,uploadFileName);
        try {
            file.transferTo(targetFile);
            new FtpUtil().uploadFile(uploadFileName,new FileInputStream(targetFile));
            targetFile.delete();
        } catch (IOException e) {
            return null;
        }
        return uploadFileName;
    }
}

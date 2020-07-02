package com.chinasofti.util;

import java.io.File;

public class createFile {
    // 判断文件夹是否存在
    public static void judeDirExists(String path) {
        File file = new File(path);
        if (!file.exists()) {
            file.mkdir();
        }
    }
}

package com.qingfeng;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 * @version 1.0.0
 * @ProjectName qingfeng
 * @Description TODO
 * @createTime 2022年04月26日 22:00:00
 */
@SpringBootTest
public class FreemarkerTest {


    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;


    @Test
    void Test() throws Exception {
        Map map = new HashMap();
        map.put("title","我爱中国");
        fprint("test/index.ftl", map, "D:/home"+File.separator+"index.html");
    }


    public void fprint(String templatePath,Object obj,String outPath) throws Exception {
        Configuration configuration = freeMarkerConfigurer.getConfiguration();
        configuration.setClassForTemplateLoading(this.getClass(), "/templates/");
        System.out.println(outPath);
        //ContextLoader loader = new ContextLoader();
        Template template = configuration.getTemplate(templatePath);

        String dirpath = outPath.substring(0,outPath.lastIndexOf("/"));
        System.out.println(dirpath);
        File dirFile = new File(dirpath);
        if(!dirFile.exists()){
            dirFile.mkdir();
            dirFile.mkdirs();
        }

        File file = new File(outPath);
        Writer out = new FileWriter(file);
        template.process(obj, out);//输出
        out.close();
    }


}

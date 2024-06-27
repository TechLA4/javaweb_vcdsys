package vcd.system.service.impl;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import vcd.system.service.DBService;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DBServiceImpl implements DBService {
    private String host;

    private String username;

    private String password;

    private String backupPath;

    public DBServiceImpl(){
        super();
        init();
        this.host = "localhost";
        this.backupPath="D:\\";
    }


    public void setBackupPath(String backupPath){
        this.backupPath = backupPath;
    }

    public void setHost(String host){
        this.host = host;
    }

   public String getBackupPath(){ return this.backupPath; }

   public String getHost(){ return this.getHost(); }


    public void init(){
        try{
            // 创建一个DocumentBuilderFactory
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 创建一个DocumentBuilder
            DocumentBuilder builder = factory.newDocumentBuilder();
            // 解析XML文件并生成Document对象
            //Document doc = builder.parse("src/c3p0-config.xml");
            Document doc = builder.parse("G:\\javaweb_vcdsys\\src\\c3p0-config.xml");
            NodeList propertyList = doc.getElementsByTagName("property");

            // 遍历每个property元素
            for (int i = 0; i < propertyList.getLength(); i++) {
                Element property = (Element) propertyList.item(i);
                String name = property.getAttribute("name");

                // 获取user和password属性的值
                if ("user".equals(name)) {
                    username = property.getTextContent();
                } else if ("password".equals(name)) {
                    password = property.getTextContent();
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }



    @Override
    public boolean Backup() {
        String MYSQL_HOME = System.getenv("MYSQL_HOME");
        long timestamp = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateStr = sdf.format(new Date(timestamp));
        String filename = backupPath+"vcd_backup"+dateStr+".sql";
        try{
            ProcessBuilder pb = new ProcessBuilder(
                    MYSQL_HOME + "/bin/mysqldump",
                    "-u" + this.username,
                    "-h" + this.host,
                    "-p" + this.password,
                    "--default-character-set=utf8",
                    "--hex-blob",
                    "-RE","vcd_sale",
                    "--result-file="+filename
            );
            Process process = pb.start();
            System.out.println(filename);
            Path path = Paths.get(filename);
            int exitcode = process.waitFor();
            if(exitcode == 0){
                // 检查文件是否存在
                if (Files.exists(path)) {
                    System.out.println("文件存在");
                    // 检查文件是否可读
                    if (Files.isReadable(path)) {
                        System.out.println("文件可读");
                        return true;
                    } else {
                        System.out.println("文件不可读");
                        return false;
                    }
                } else {
                    System.out.println("文件不存在");
                    return false;
                }
            }
           else{
                System.out.println("备份进程退出异常");
                return false;
           }
        }catch (IOException | InterruptedException e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean recovery(Path tempFile) {
        String MYSQL_HOME = System.getenv("MYSQL_HOME");
        try {
            String[] command = new String[]{
                      MYSQL_HOME + "/bin/mysql",
                      "-h",this.host,
                    "-u" + this.username,
                    "-p" + this.password,
                    "vcd_sale"
            };
            ProcessBuilder pb = new ProcessBuilder(command);
            pb.redirectInput(tempFile.toFile());
            Process process = pb.start();

            int exitcode = process.waitFor();
            return exitcode == 0;
        }catch (IOException | InterruptedException e){
            e.printStackTrace();
            return false;
        }
    }
}

class Test{
    public static void main(String[] args) {
        DBServiceImpl dbService = new DBServiceImpl();
        dbService.init();
        long timestamp = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateStr = sdf.format(new Date(timestamp));

        //dbService.Backup();

//        Path path = Paths.get("D:/vcd_backup20240627125638.sql");
//        dbService.recovery(path);
    }
}
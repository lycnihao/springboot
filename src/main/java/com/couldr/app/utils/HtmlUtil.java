package com.couldr.app.utils;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import com.couldr.app.model.dto.Const;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.oauth.utils.StringUtils;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HtmlUtil {

  private static Logger logger =  LoggerFactory.getLogger(HtmlUtil.class);

  /**
   * 一层，只输出url及对应的title或描述
   * @param in
   * @return
   */
  public static Map<String, String> parseHtmlOne(InputStream in){
    Map<String, String> map = new HashMap<String, String>();
    try {
      Document doc = Jsoup.parse(in, "UTF-8", "");
      Elements metas = doc.select("a");
      for (Element meta : metas) {
        String url = meta.attr("href");
        if(url.startsWith("http")){
          map.put(url, meta.text());
        }
      }
    } catch (Exception e) {
      logger.error("解析html 文件异常：",e);
    }
    return map;
  }

  /**
   * 两层（文件夹<url+title或描述>）
   * @param in
   * @return
   */
  public static Map<String, Map<String, String>> parseHtmlTwo(InputStream in){
    Map<String, Map<String, String>> resultMap = new HashMap<String, Map<String, String>>();
    try {
      Document doc = Jsoup.parse(in, "UTF-8", "");
      Elements metasdts = doc.select("dt");
      for(Element dt : metasdts){
        String favoritesName = "";
        Elements dtcs = dt.children();
        Map<String, String> map = new HashMap<String, String>();
        for(Element dt1 : dtcs){
          if("h3".equalsIgnoreCase(dt1.nodeName())){
            favoritesName = dt1.text();
          }else if("dl".equalsIgnoreCase(dt1.nodeName())){
            Elements dts = dt1.children();
            for(Element dt11 : dts){
              if("dt".equals(dt11.nodeName())){
                if("a".equals(dt11.child(0).nodeName())){
                  String url = dt11.child(0).attr("href");
                  if(url.startsWith("http")){
                    map.put(url, dt11.child(0).text());
                  }
                }
              }
            }
          }
        }
        if(StringUtils.isNotEmpty(favoritesName) && map.size() > 0){
          resultMap.put(favoritesName, map);
        }
      }
    } catch (Exception e) {
      logger.error("解析html文件异常：",e);
    }
    return resultMap;
  }

  public static StringBuilder exportHtml(String title,StringBuilder body){
    StringBuilder sb = new StringBuilder();
    sb.append("<HTML>");
    sb.append("<HEAD>");
    sb.append("<TITLE>"+title+"</TITLE>");
    sb.append("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=utf-8\" />");
    sb.append("</HEAD>");
    sb.append("<BODY><H1>"+title+"</H1>");
    sb.append(body);
    sb.append("</BODY>");

    return sb;
  }

  public static WebSite getCollectFromUrl(String url){
    WebSite webSite = new WebSite();
    try {
      webSite.setUrl(url);
      Document doc = Jsoup.connect(url).userAgent(Const.USER_AGENT).get();
      String title = doc.title();
      if(StringUtils.isNotEmpty(title)){
        webSite.setTitle(title);
      }

      Elements metas = doc.head().select("meta");
      for (Element meta : metas) {
        String content = meta.attr("content");
        if ("description".equalsIgnoreCase(meta.attr("name"))) {
          webSite.setSummary(content);
        }
      }
      URL uri = new URL(url);
      System.out.println("-----------url-"+uri.getProtocol()+"://"+ uri.getHost()+"/favicon.ico");
      webSite.setIcon(download(uri.getProtocol()+"://"+ uri.getHost()+"/favicon.ico"));

/*      if (webSite.getIcon() == null){
        Elements linkMetas = doc.head().select("link");
        linkMetas.forEach(element ->{
          if ("image/x-icon".equals(element.attr("type")) ||  "icon".equals(element.attr("rel"))){
            String href = element.attr("abs:href");
            webSite.setIcon(download(href));
          }
        });
      }*/


    } catch (Exception e) {
      logger.error("文章解析出错：",e);
    }
    return webSite;
  }

  public static String getPageImg(String url){
    String imgUrl="";
    Document doc;
    try {
      doc = Jsoup.connect(url).userAgent(Const.USER_AGENT).get();
      Elements images = doc.select("img[src~=(?i)\\.(png|jpe?g|gif)]");
      for(Element image : images){
        imgUrl=image.attr("src");
        if(StringUtils.isNotEmpty(imgUrl) ){
          if(imgUrl.startsWith("//")){
            imgUrl = "http:" + imgUrl;
          }else if(!imgUrl.startsWith("http") && !imgUrl.startsWith("/")){
            imgUrl = URLUtil.getDomainUrl(url) + "/" + imgUrl;
          }else if(!imgUrl.startsWith("http")){
            imgUrl = URLUtil.getDomainUrl(url)+imgUrl;
          }
        }
        // 判断图片大小
        String fileUrl = download(imgUrl);
        if(fileUrl!=null){
          File picture = new File(fileUrl);
          FileInputStream in = new FileInputStream(picture);
          BufferedImage sourceImg = ImageIO.read(in);
          String weight = String.format("%.1f",picture.length()/1024.0);
          int width = sourceImg.getWidth();
          int height = sourceImg.getHeight();
          // 删除临时文件
          if(picture.exists()){
            in.close();
            picture.delete();
          }
          if(Double.parseDouble(weight) <= 0 || width <=0 || height <= 0){
            logger.info("当前图片大小为0，继续获取图片链接");
            imgUrl="";
          }else{
            break;
          }
        }
      }
    } catch (Exception e) {
      // TODO: handle exception
      logger.warn("getPageImg  失败,url:"+url,e.getMessage());
    }
    return imgUrl;
  }

  // 图片下载
  private static String download(String url) {
    try {

      final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
      uploadPath.append("/couldr/");
      uploadPath.append("upload/icon/");
      uploadPath.append(DateUtil.thisYear()).append("/").append(DateUtil.thisMonth()).append("/");

      URL uri = new URL(url);
      InputStream in = uri.openStream();

      String dateString = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss");
      final StrBuilder nameWithOutSuffix = new StrBuilder(uri.getHost().substring(0, uri.getHost().lastIndexOf('.')).replace(".", "_").replaceAll(" ", "_").replaceAll(",", ""));
      nameWithOutSuffix.append(dateString);
      nameWithOutSuffix.append(new Random().nextInt(1000));

      //文件后缀
      final String fileSuffix = uri.toString().substring(uri.toString().lastIndexOf('.') + 1);

      //带后缀
      final StrBuilder fileName = new StrBuilder(nameWithOutSuffix);
      fileName.append(".");
      fileName.append(fileSuffix);

      //映射路径
      final StrBuilder filePath = new StrBuilder("/upload/icon/");
      filePath.append(DateUtil.thisYear()).append("/").append(DateUtil.thisMonth()).append("/");
      filePath.append(fileName);

      File dirFile = new File(uploadPath.toString());
      if (!dirFile.exists()) {
        if(!dirFile.mkdirs()){
          return filePath.toString();
        }
      }

      File file = new File(dirFile,fileName.toString());
      FileOutputStream fo = new FileOutputStream(file);
      byte[] buf = new byte[1024];
      int length = 0;
      while ((length = in.read(buf, 0, buf.length)) != -1) {
        fo.write(buf, 0, length);
      }
      in.close();
      fo.close();
      return filePath.toString();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
}

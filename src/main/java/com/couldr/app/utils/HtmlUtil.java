package com.couldr.app.utils;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.oauth.utils.StringUtils;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

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
    sb.append("<TITLE>").append(title).append("</TITLE>");
    sb.append("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=utf-8\" />");
    sb.append("</HEAD>");
    sb.append("<BODY><H1>").append(title).append("</H1>");
    sb.append(body);
    sb.append("</BODY>");

    return sb;
  }

  public static WebSite getCollectFromUrl(String title,String url){
    WebSite webSite = new WebSite();
    webSite.setUrl(url);
    webSite.setTitle(title);
    try {
      URL uri = new URL(url);
      webSite.setIcon(uri.getProtocol()+"://"+ uri.getHost()+"/favicon.ico");
    } catch (Exception e) {
      webSite.setIcon("/favicon.ico");
      logger.error("文章解析出错：",e);
    }
    return webSite;
  }

  public static MultipartFile IcoFile(String url){
    MultipartFile iconFile = null;
    try {
      URL rootUrl = new URL(url);
      String rootStr = rootUrl.getProtocol()+"://"+ rootUrl.getHost();
      iconFile = HtmlUtil.getIconFile(rootStr+"/favicon.ico");
      if (iconFile == null){
        iconFile = HtmlUtil.getRequestIconFile(rootStr);
      }
    }catch (Exception e){
      logger.error("获取图片错误:"+e);
      e.printStackTrace();
    }
    return iconFile;
  }

  public static String getIcon(String url){
    Document doc = RequestUtil.requestSite(url,false, "");
    String resultUrl = null;
    if (doc != null){
      Element headElement = doc.head();
      Elements links = headElement.select("link");
      for (Element element : links){
        if ("image/x-icon".equals(element.attr("type")) ||  "icon".equals(element.attr("rel")) || element.attr("rel").contains("icon")){
          resultUrl = element.attr("abs:href");
          break;
        }
      }
    }
    return resultUrl;
  }

  public static MultipartFile getIconFile(String url){
    MultipartFile multipartFile = null;
    try {
      System.out.println("fileUrl:"+url);
      InputStream inputStream = getInputStream(url);
      if (inputStream != null){
        multipartFile = new MockMultipartFile("couldr_com_.png","couldr_com_.png","image/png", inputStream);
      }
      if (multipartFile == null || multipartFile.isEmpty()){
          System.out.println("空:"+url);
        return null;
      }
    } catch (IOException e) {
      return null;
    }
    return multipartFile;
  }

  public  static  MultipartFile getRequestIconFile(String url){
    MultipartFile multipartFile = null;
    try {
      url = getIcon(url);
      if (url == null){
        return null;
      }
      InputStream inputStream = getInputStream(url);
      if (inputStream != null){
        multipartFile = new MockMultipartFile("couldr_com_.png","couldr_com_.png","image/png", inputStream);
      }
    }catch (Exception e){
      e.printStackTrace();
      return null;
    }
    return multipartFile;
  }

  public static InputStream getInputStream(String imgUrl) {
    InputStream inputStream = null;
    try{
      HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(imgUrl).openConnection();
      httpURLConnection.setRequestMethod("GET");
      httpURLConnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36");
      /*httpURLConnection.setRequestProperty("Referer","no-referrer");
      httpURLConnection.setRequestProperty("Accept-ranges", "bytes");
      httpURLConnection.setRequestProperty("Accept-Encoding", "gzip");
      httpURLConnection.setRequestProperty("Access-control-allow-origin", "*");
      httpURLConnection.setRequestProperty("Access-control-max-age", "10000");
      httpURLConnection.setRequestProperty("Referer","no-referrer");
      httpURLConnection.setRequestProperty("Content-Type","image/*");*/
      httpURLConnection.setConnectTimeout(15000);
      httpURLConnection.setReadTimeout(20000);
      inputStream = httpURLConnection.getInputStream();

      if (httpURLConnection.getContentType().contains("html")) {
        return null;
      }

    }catch (IOException e){
      e.printStackTrace();
    }
    return inputStream;
  }

}

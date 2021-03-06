package com.couldr.app.utils;

import java.net.InetSocketAddress;
import java.net.Proxy;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.http.HttpHeaders;
import org.springframework.util.StringUtils;

public class RequestUtil {

  /**
   * 请求网站
   * @param url 网站域名
   * @param isProxy 是否使用代理
   * @param userAgent userAgent
   * @return
   */
  public static Document requestSite(String url, boolean isProxy, String userAgent){
    System.out.println("请求地址:" + url);
    Document document;
    try {
    Connection connect =  Jsoup.connect(url)
        .ignoreContentType(true)
        .timeout(100000);

    //增加userAgent
    if (StringUtils.isEmpty(userAgent)) {
      connect.header(HttpHeaders.USER_AGENT, userAgent);
    }

    //代理设置
    if (isProxy) {
      Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8080));
      connect.proxy(proxy);
    }

    document = connect.get();

    } catch (Exception e) {
      return null;
    }

    return  document;
  }
}

package com.couldr.app.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.UUID;
import org.springframework.lang.NonNull;

import javax.servlet.http.HttpServletRequest;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-10-11 14:16
 */
public class CouldrUtil {

  public static String getIp(HttpServletRequest request){
    String ipAddress = request.getHeader("x-forwarded-for");
    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getHeader("Proxy-Client-IP");
    }
    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getHeader("WL-Proxy-Client-IP");
    }
    if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getRemoteAddr();
      if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
        //根据网卡取本机配置的IP
        InetAddress inet=null;
        try {
          inet = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
          e.printStackTrace();
        }
        ipAddress= inet.getHostAddress();
      }
    }
    //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
    if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
      if(ipAddress.indexOf(",")>0){
        ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
      }
    }
    return ipAddress;
  }

  /**
   * 转换文件大小
   *
   * @param size size
   * @return String
   */
  public static String parseSize(long size) {
    if (size < 1024) {
      return size + "B";
    } else {
      size = size / 1024;
    }
    if (size < 1024) {
      return size + "KB";
    } else {
      size = size / 1024;
    }
    if (size < 1024) {
      size = size * 100;
      return size / 100 + "." + size % 100 + "MB";
    } else {
      size = size * 100 / 1024;
      return size / 100 + "." + size % 100 + "GB";
    }
  }
}

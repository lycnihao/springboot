package cn.hom1.app.utils;

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
public class HomUtil {
  /**
   * Gets random uuid without dash.
   *
   * @return random uuid without dash
   */
  @NonNull
  public static String randomUUIDWithoutDash() {
    return UUID.randomUUID().toString().replace("-","");
  }

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
}

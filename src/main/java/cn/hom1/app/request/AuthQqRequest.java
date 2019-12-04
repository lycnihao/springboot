package cn.hom1.app.request;

import com.alibaba.fastjson.JSONObject;
import java.net.URI;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.service.spi.ServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * qq登录
 *
 * @author iksen
 * @date 2019-12-03 16:41
 */
public class AuthQqRequest {

  private Logger logger = LoggerFactory.getLogger(AuthQqRequest.class);
  //QQ 登陆页面的URL
  private final static String AUTHORIZATION_URL =
      "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=%s&redirect_uri=%s&scope=%s";
  //获取token的URL
  private final static String ACCESS_TOKEN_URL = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=%s&client_secret=%s&code=%s&redirect_uri=%s";

  // 获取用户 openid 的 URL
  private static final String OPEN_ID_URL = "https://graph.qq.com/oauth2.0/me?access_token=%s";

  // 获取用户信息的 URL，oauth_consumer_key 为 apiKey
  private static final String USER_INFO_URL = "https://graph.qq.com/user/get_user_info?access_token=%s&oauth_consumer_key=%s&openid=%s";


  private  static final String CALLBACK_URL = "http://XXX/XX/XX"; // QQ 在登陆成功后回调的 URL，这个 URL 必须在 QQ 互联里填写过
  private  static final String API_KEY  = "xxxxxx";                                      // QQ 互联应用管理中心的 APP ID
  private  static final String API_SECRET = "xxxxxx";               // QQ 互联应用管理中心的 APP Key
  private  static final String SCOPE       = "get_user_info";                                  // QQ 互联的 API 接口，访问用户资料


  /**
   *  QQ 登陆页面的 URL
   * @return
   */
  public String getAuthorizationUrl() {
    String url = String.format(AUTHORIZATION_URL,API_KEY,CALLBACK_URL,SCOPE);
    return url;
  }

  public String getAccessToken(String code) {
    String url = String.format(ACCESS_TOKEN_URL,API_KEY,API_SECRET,code, CALLBACK_URL);
    UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
    URI uri = builder.build().encode().toUri();

    String resp = uri.toString();
    logger.error("getAccessToken resp = "+resp);
    if(resp.contains("access_token")){
      Map<String,String> map = getParam(resp);
      String access_token = map.get("access_token");
      return access_token;
    }else{
      throw new ServiceException(resp);
    }
  }

  //由于QQ的几个接口返回类型不一样，此处是获取key-value类型的参数
  private Map<String,String> getParam(String string){
    Map<String,String> map = new HashMap();
    String[] kvArray = string.split("&");
    for(int i = 0;i<kvArray.length;i++){
      String[] kv = kvArray[i].split("=");
      map.put(kv[0],kv[1]);
    }
    return map;
  }

  //QQ接口返回类型是text/plain，此处将其转为json
  public JSONObject ConvertToJson(String string){
    string = string.substring(string.indexOf("(")+1,string.length());
    string = string.substring(0,string.indexOf(")"));
    logger.error("ConvertToJson s = "+string);
    JSONObject jsonObject = JSONObject.parseObject(string);
    return jsonObject;
  }

  public String getOpenId(String accessToken) {
    String url = String.format(OPEN_ID_URL,accessToken);
    UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
    URI uri = builder.build().encode().toUri();

    String resp = uri.toString();
    logger.error("getAccessToken resp = "+resp);
    if(resp.contains("openid")){
      JSONObject jsonObject = ConvertToJson(resp);
      String openid = jsonObject.getString("openid");
      return openid;
    }else{
      throw new ServiceException(resp);
    }
  }


  public JSONObject getUserInfo(String accessToken, String openId){

    openId = getOpenId(accessToken);
    String url = String.format(USER_INFO_URL,accessToken, API_KEY, openId);
    UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url);
    URI uri = builder.build().encode().toUri();

    String resp = uri.toString();
    JSONObject data = JSONObject.parseObject(resp);
    logger.error("resp = "+data);
    JSONObject result = new JSONObject();
    result.put("id",openId);
    result.put("nickName",data.getString("nickname"));
    result.put("avatar",data.getString("figureurl_qq_1"));

    return result;
  }

  public String refreshToken(String code) {
    return null;
  }

}

package cn.hom1.app.service;


import cn.hom1.app.model.dto.WebContent;

public interface RequestService {

  /**
   * 热榜
   * @return
   */
    Object[] getHotList();

  /**
   * 获取标题
   * @param url 网站地址
   * @return 标题
   */
  String getTitle(String url);

  WebContent getWebContent(String url);

  Object getWeather(String city);
}

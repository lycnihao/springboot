package cn.hom1.app.service;


import cn.hom1.app.model.dto.WebContent;

public interface RequestService {

  /**
   * 热榜
   * @return
   */
    Object[] getHotList();

  WebContent getWebContent(String url);

  Object getWeather(String cityId);
}

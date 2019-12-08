package com.couldr.app.service;


import com.couldr.app.model.dto.WebContent;

public interface RequestService {

  /**
   * 热榜
   * @return
   */
    Object[] getHotList();

  WebContent getWebContent(String url);

  Object getWeather(String cityId);
}

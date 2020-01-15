package com.couldr.app.service.impl;

import com.couldr.app.model.dto.WebContent;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.RequestService;
import com.couldr.app.utils.HtmlUtil;
import com.couldr.app.utils.RequestUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-08-28 16:54
 */
@Service
public class RequestServiceImpl implements RequestService {

  @Autowired
  private AttachmentService attachmentService;

  @Cacheable(value="hotList",key="'hotList'")
  @Override
  public Object[] getHotList() {
    Object[] objects = new Object[5];
    int listSize = 0,page = 0;
    Document doc = RequestUtil.requestSite("http://top.baidu.com/buzz.php?p=top10",false, "");
    Elements trsElements = doc.select("#main > div.mainBody > div > table > tbody > tr:gt(0)").removeClass("item-tr");
    for (Element element : trsElements) {
      String title = element.select(".keyword a:eq(0)").text();
      Elements level = element.select(".last span");
      String trend = level.attr("class");
      if (!"".equals(title)) {
        listSize ++;
        Map<String,String> topMap = new HashMap<>();
        topMap.put("index", String.valueOf(listSize));
        topMap.put("title",title);
        topMap.put("level",level.text());
        topMap.put("trend", "icon-rise".equals(trend) ? "rise" : "fall");
        List<Map<String,String>> list;
        if (objects[page] == null){
          list = new ArrayList<>();
          list.add(topMap);
        } else {
          list = (List<Map<String, String>>) objects[page];
          list.add(topMap);
        }
        objects[page] = list;
        if (listSize % 10 == 0){
          page = page +1 ;
        }
      }
    }
    return objects;
  }

  @Override
  public WebContent getWebContent(String url) {

    WebContent webContent = new WebContent();
    Document doc = RequestUtil.requestSite(url,false, "");

    if (doc != null){
      webContent.setUrl(url);
      webContent.setName(doc.title());
      MultipartFile iconFile = HtmlUtil.IcoFile(url);
      if (iconFile != null){
        Map<String, String> resultMap = attachmentService.upload(iconFile,null);
        webContent.setIconFile(resultMap.get("filePath"));
      }else {
        webContent.setIconFile("https://168dh.cn/favicon.ico");
      }
      return webContent;
    }
    return null;
  }

  @Override
  public Object getWeather(String cityId) {
    if (cityId.isEmpty()){
      cityId = "auto_ip";
    }
    String key = "f30496591f7c416781f3a9d5f84adf90";

    Document nowDoc = RequestUtil.requestSite("https://free-api.heweather.net/s6/weather/now?location="+cityId+"&key="+key,false, "");

    assert nowDoc != null;
    JSONObject jsonObject = JSONObject.parseObject(nowDoc.body().text()).getJSONArray("HeWeather6").getJSONObject(0);

    if (jsonObject.getString("status").equals("ok")){
      cityId = jsonObject.getJSONObject("basic").getString("cid");

      Document surveyDoc = RequestUtil.requestSite("https://hfapp-service.heweather.net/v2.0/app/survey/index?key="+key+"&cityId="+cityId+"&lang=null",false, "");
      assert surveyDoc != null;
      JSONObject surveyObject = JSONObject.parseObject(surveyDoc.body().text());
      System.out.println(surveyObject);
      if (surveyObject.getString("status").equals("success"))
      jsonObject.put("msg",surveyObject.getString("msg"));
    }

    return jsonObject;
  }
}

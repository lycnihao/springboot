package cn.hom1.app.service.impl;

import cn.hom1.app.service.RequestService;
import cn.hom1.app.utils.RequestUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-08-28 16:54
 */
@Service
public class RequestServiceImpl implements RequestService {

  @Cacheable(value="hotList",key="'hotList'")
  @Override
  public Object[] getHotList() {
    Object[] objects = new Object[5];
    int listSize = 0,page = 0;
    try {
      Document doc = RequestUtil.requestSite("http://top.baidu.com/buzz.php?p=top10",false, "");
      Elements trsElements = doc.select("#main > div.mainBody > div > table > tbody > tr:gt(0)").removeClass("item-tr");
      for (Element element : trsElements) {
        String title = element.select(".keyword a:eq(0)").text();
        Elements level = element.select(".last span");
        String trend = level.attr("class");
        if (!title.equals("")) {
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

    } catch (IOException e) {
      e.printStackTrace();
    }
    return objects;
  }
}

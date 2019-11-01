package cn.hom1.app.service.impl;

import cn.hom1.app.model.vo.TopHot;
import cn.hom1.app.service.HotService;
import cn.hom1.app.utils.RequestUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

/**
 * 热榜
 *
 * @author iksen
 * @date 2019-10-31 09:21
 */
@Service
public class HotServiceImpl implements HotService {

  @Override
  public List<TopHot> baiduRealTime() {
    Document doc = RequestUtil.requestSite("http://top.baidu.com/buzz.php?p=top10",false, "");
    Elements trsElements = doc.select("#main > div.mainBody > div > table > tbody > tr:gt(0)").removeClass("item-tr");
    int index = 0;
    List<TopHot> list = new ArrayList<>();
    for (Element element : trsElements) {
      String title = element.select(".keyword a:eq(0)").text();
      Elements level = element.select(".last span");
      String trend = level.attr("class");
      if (!"".equals(title)) {
        index++;
        TopHot hotVo = new TopHot();
        hotVo.setId(index > 0 && index < 10 ? "0"+String.valueOf(index) : String.valueOf(index));
        hotVo.setTitle(title);
        hotVo.setLevel(level.text());
        hotVo.setTrend("icon-rise".equals(trend) ? "rise" : "fall");
        hotVo.setUrl(element.select(".keyword a").attr("href"));
        list.add(hotVo);
      }
    }
    return list;
  }

  @Override
  public List<TopHot> baiduToday() {
    Document doc = RequestUtil.requestSite("http://top.baidu.com/buzz?b=341",false, "");
    Elements trsElements = doc.select("#main > div.mainBody > div > table > tbody > tr:gt(0)").removeClass("item-tr");
    int index = 0;
    List<TopHot> list = new ArrayList<>();
    for (Element element : trsElements) {
      String title = element.select(".keyword a:eq(0)").text();
      Elements level = element.select(".last span");
      String trend = level.attr("class");
      if (!"".equals(title)) {
        index++;
        TopHot hotVo = new TopHot();
        hotVo.setId(index > 0 && index < 10 ? "0"+String.valueOf(index) : String.valueOf(index));
        hotVo.setTitle(title);
        hotVo.setLevel(level.text());
        hotVo.setTrend("icon-rise".equals(trend) ? "rise" : "fall");
        hotVo.setUrl(element.select(".keyword a").attr("href"));
        list.add(hotVo);
      }
    }
    return list;
  }

  @Override
  public List<TopHot> baiduBaiKe() {
    Document doc = RequestUtil.requestSite("https://baike.baidu.com/",false, "");
    Elements dlElements = doc.select("#hotLemmas > dl.today.content.show > dd");
    List<TopHot> list = new ArrayList<>();
    dlElements.forEach(element -> {
      TopHot hotVo = new TopHot();
      hotVo.setId(String.valueOf(list.size() + 1));
      hotVo.setUrl(element.select("a").attr("href"));
      hotVo.setTitle(element.select(".content_tit>span").text());
      hotVo.setSummary(element.select(".content_cnt").text());
      hotVo.setTrend("wiki-home-icons_up".equals(element.select(".cmn-icon").attr("class")) ? "fall" : "rise");
      list.add(hotVo);
    });
    return list;
  }

  @Override
  public List<TopHot> weiboTopHot() {
    Document doc = RequestUtil.requestSite("https://s.weibo.com/top/summary?cate=realtimehot",false, "");
    Elements trElements = doc.select("#pl_top_realtimehot > table > tbody > tr");
    List<TopHot> list = new ArrayList<>();
    trElements.forEach(element -> {
      String id = !element.select(".icon-top").toString().equals("") ? "0":element.select(".td-01").text();
      String url = element.select("a").attr("abs:href").equals("") ? element.select("a").attr("abs:href_to"):element.select("a").attr("abs:href");
      String trend = element.select(".td-03 i") == null ? "" : element.select(".td-03 i").text();
      TopHot hotVo = new TopHot();
      hotVo.setId(Integer.parseInt(id) > 0 && Integer.parseInt(id) < 10 ? "0" + id:id);
      hotVo.setTitle(element.select("a").text());
      hotVo.setUrl(url);
      hotVo.setLevel(element.select("span").text());
      hotVo.setTrend(trend);
      list.add(hotVo);
    });
    return list;
  }

  @Override
  public List<TopHot> weiboSocialEvent() {
    Document doc = RequestUtil.requestSite("https://s.weibo.com/top/summary?cate=socialevent",false, "");
    Elements trElements = doc.select("#pl_top_realtimehot > table > tbody > tr");
    List<TopHot> list = new ArrayList<>();
    trElements.forEach(element -> {
      TopHot hotVo = new TopHot();
      hotVo.setTitle(element.select("a").text());
      hotVo.setUrl(element.select("a").attr("abs:href"));
      list.add(hotVo);
    });
    return list;
  }

  @Override
  public List<TopHot> zhihuTopSearch() {
    Document doc = RequestUtil.requestSite("https://www.zhihu.com/api/v4/search/top_search",false, "");
    JSONObject jsonObject = JSONObject.parseObject(doc.body().text());
    JSONObject jsonInfo = jsonObject.getJSONObject("top_search");
    JSONArray jsonArray = jsonInfo.getJSONArray("words");
    List<TopHot> list = new ArrayList<>();

    for(int i = 0; i< jsonArray.size(); i++){
      JSONObject object = jsonArray.getJSONObject(i);
      TopHot topHot = new TopHot();
      topHot.setTitle(object.get("query").toString());
      topHot.setSummary(object.get("display_query").toString());
      topHot.setUrl(String.format("https://www.zhihu.com/search?q=%s&utm_content=search_hot&utm_medium=168导航&utm_source=zhihu&type=content",object.get("display_query").toString()));
      list.add(topHot);
    }
    return list;
  }

  @Override
  public List<TopHot> zhihuTopHot() {
    Response response = null;
    try {
      response = Jsoup.connect("https://www.bjsoubang.com/api/getChannelData?channel_id=2")
          .header("Accept", "*/*")
          .header("Accept-Encoding", "gzip, deflate")
          .header("Accept-Language","zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3")
          .header("Content-Type", "application/json;charset=UTF-8")
          .header("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0")
          .ignoreContentType(true)
          .timeout(100000)
          .execute();
    } catch (IOException e) {
      e.printStackTrace();
    }
    JSONObject jsonObject = JSONObject.parseObject(response.body());
    JSONObject jsonInfo = jsonObject.getJSONObject("info");
    JSONArray jsonArray = jsonInfo.getJSONArray("data");
    List<TopHot> list = new ArrayList<>();

    for(int i = 0; i< jsonArray.size(); i++){
      JSONObject object = jsonArray.getJSONObject(i);
      TopHot topHot = new TopHot();
      topHot.setTitle(object.get("title").toString());
      topHot.setSummary(object.get("description").toString());
      topHot.setUrl(object.get("link").toString());
      topHot.setImg(object.get("img").toString());
      list.add(topHot);
    }
    return list;
  }


}

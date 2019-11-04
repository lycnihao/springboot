package cn.hom1.app.service.impl;

import cn.hom1.app.model.vo.TopHot;
import cn.hom1.app.service.HotService;
import cn.hom1.app.utils.CookieManager;
import cn.hom1.app.utils.RequestUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
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
    List<TopHot> list = new ArrayList<>();
    for (Element element : trsElements) {
      String title = element.select(".keyword a:eq(0)").text();
      Elements level = element.select(".last span");
      String trend = level.attr("class");
      if (!"".equals(title)) {
        TopHot hotVo = new TopHot();
        hotVo.setId(list.size() >= 0 && list.size() < 9 ? "0" + String.valueOf(list.size() + 1) : String.valueOf(list.size() + 1));
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
    List<TopHot> list = new ArrayList<>();
    Document doc = RequestUtil.requestSite("https://www.zhihu.com/billboard",false, "");
    assert doc != null;
    JSONArray jsonArray = JSONObject.parseObject(doc.select("#js-initialData").html())
        .getJSONObject("initialState")
        .getJSONObject("topstory")
        .getJSONArray("hotList");
    jsonArray.forEach(json -> {
      JSONObject jsonObject = JSONObject.parseObject(json.toString());
      TopHot topHot = new TopHot();
      topHot.setId(String.valueOf(list.size()));
      topHot.setTitle(jsonObject.getJSONObject("target").getJSONObject("titleArea").getString("text"));
      topHot.setUrl(jsonObject.getJSONObject("target").getJSONObject("link").getString("url"));
      topHot.setSummary(jsonObject.getJSONObject("target").getJSONObject("excerptArea").getString("text"));
      topHot.setLevel(jsonObject.getJSONObject("target").getJSONObject("metricsArea").getString("text"));
      topHot.setTrend(jsonObject.getJSONObject("target").getJSONObject("labelArea").getString("text"));
      String imgUrl = jsonObject.getJSONObject("target").getJSONObject("imageArea").getString("url");
      //更换路线, pic3 403错误
      topHot.setImg(imgUrl.replace("pic3", "pic2"));
      list.add(topHot);
    });
    return list;
  }

  @Override
  public List<TopHot> doubanChart() {
    Document doc = null;
    try {
      doc = Jsoup.connect("https://movie.douban.com/")
          .header("Content-Type", "application/json;charset=UTF-8")
          .header("User-Agent", "Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0")
          .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
          .header("Accept-Language", "zh-cn,zh;q=0.5")
          .header("Accept-Encoding", "GB2312,utf-8;q=0.7,*;q=0.7")
          .header("Referer", "http://movie.douban.com/")
          .header("Cache-Control", "max-age=0")
          .ignoreContentType(true)
          .timeout(100000).get();
    } catch (IOException e) {
      e.printStackTrace();
    }
    System.out.println(doc);
    List<TopHot> list = new ArrayList<>();
    return null;
  }


}

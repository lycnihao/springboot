package cn.hom1.app.service.impl;

import cn.hom1.app.model.vo.TopHot;
import cn.hom1.app.service.HotService;
import cn.hom1.app.utils.RequestUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import java.util.ArrayList;
import java.util.List;
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
      topHot.setImg(jsonObject.getJSONObject("target").getJSONObject("imageArea").getString("url"));
      list.add(topHot);
    });
    return list;
  }

  @Override
  public List<TopHot> doubanChart() {
    List<TopHot> list = new ArrayList<>();
    Document doc = RequestUtil.requestSite("https://movie.douban.com/chart",false, "");
    Elements tableElements = doc.select(" #content > div > div.article > div > div > table");

    tableElements.forEach(element -> {
      TopHot topHot = new TopHot();
      topHot.setTitle(element.select("tr > td:nth-child(2) > div > a").text());
      topHot.setSummary(element.select("tr > td:nth-child(2) > div > p").text());
      topHot.setUrl(element.select("tr > td:nth-child(1) > a").attr("href"));
      topHot.setImg(element.select("tr > td:nth-child(1) > a > img").attr("src"));
      topHot.setLevel(element.select("tr > td:nth-child(2) > div > div > span.rating_nums").text());
      list.add(topHot);
    });

    /*
    Document doc = RequestUtil.requestSite("http://www.bjsoubang.com/api/getChannelData?channel_id=16",false, "");
    JSONObject jsonObject = JSONObject.parseObject(doc.body().text());
    JSONObject jsonInfo = jsonObject.getJSONObject("info");
    JSONArray jsonArray = jsonInfo.getJSONArray("data");
    jsonArray.forEach( jsonStr -> {
      JSONObject json = JSONObject.parseObject(jsonStr.toString());
      TopHot topHot = new TopHot();
      topHot.setImg(json.getString("img"));
      topHot.setTitle(json.getString("titleCn") + " " + json.getString("title"));
      topHot.setSummary(json.getString("description"));
      topHot.setUrl(json.getString("link"));
      topHot.setLevel(json.getString("rate"));
      list.add(topHot);
    });*/
    return list;
  }

  @Override
  public List<TopHot> doubanPopularBook(int t) {
    String subcat = t == 0 ? "I":"F";

    List<TopHot> list = new ArrayList<>();
    Document doc = RequestUtil.requestSite("https://book.douban.com/chart?subcat=" + subcat,false, "");
    Elements liElements = doc.select(" #content > div > div.article > ul > li");

    liElements.forEach(element -> {
      TopHot hotVo = new TopHot();
      hotVo.setTitle(element.select("h2 a").text());
      hotVo.setUrl(element.select("h2 a").attr("href"));
      hotVo.setSummary(element.select(".subject-abstract").text());
      hotVo.setLevel(element.select("p.clearfix.w250").text());
      hotVo.setImg(element.select(".subject-cover").attr("src"));
      list.add(hotVo);
    });
    return list;
  }

  @Override
  public List<TopHot> doubanNewBook(int t) {
    String selector = t == 0 ? "#content > div > div.article > ul > li":"#content > div > div.aside > ul > li";
    List<TopHot> list = new ArrayList<>();
    Document doc = RequestUtil.requestSite("https://book.douban.com/latest?icn=index-latestbook-all" ,false, "");
    Elements liElements = doc.select(selector);
    liElements.forEach(element -> {
      TopHot hotVo = new TopHot();
      hotVo.setTitle(element.select("h2 a").text());
      hotVo.setUrl(element.select("h2 a").attr("href"));
      hotVo.setSummary(t == 0 ? element.select(".detail").text():element.select(".detail-frame > p:nth-child(4)").text());
      hotVo.setLevel(element.select(".rating .font-small").text());
      hotVo.setImg(element.select(".cover img").attr("src"));
      list.add(hotVo);
    });
    return list;
  }
}

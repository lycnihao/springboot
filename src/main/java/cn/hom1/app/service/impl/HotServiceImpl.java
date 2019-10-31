package cn.hom1.app.service.impl;

import cn.hom1.app.model.vo.TopHot;
import cn.hom1.app.service.HotService;
import cn.hom1.app.utils.RequestUtil;
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
      System.out.println(hotVo);
      list.add(hotVo);
    });
    return list;
  }
}

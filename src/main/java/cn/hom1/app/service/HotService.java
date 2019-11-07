package cn.hom1.app.service;

import cn.hom1.app.model.vo.TopHot;
import java.util.List;

public interface HotService {

  /**
   * 百度实时热搜榜
   */
  List<TopHot> baiduRealTime();

  /**
   * 百度今日热搜榜
   */
  List<TopHot> baiduToday();


  /**
   * 百度百科热搜词条
   */
  List<TopHot> baiduBaiKe();


  /**
   * 微博热搜榜
   */
  List<TopHot> weiboTopHot();

  /**
   * 微博新时代
   */
  List<TopHot> weiboSocialEvent();

  /**
   * 知乎热搜
   */
  List<TopHot> zhihuTopSearch();

  /**
   * 知乎热榜
   */
  List<TopHot> zhihuTopHot();

  /**
   * 豆瓣热榜
   */
  List<TopHot> doubanChart();


  /**
   * 豆瓣最受关注图书
   */
  List<TopHot> doubanPopularBook(int t);


  /**
   * 豆瓣新书
   */
  List<TopHot> doubanNewBook(int t);

  //豆瓣一周口碑榜
  //List<TopHot> doubanWeekly();
}

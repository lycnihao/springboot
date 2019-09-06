package cn.hom1.app.service;


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
}

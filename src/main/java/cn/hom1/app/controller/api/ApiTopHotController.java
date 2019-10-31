package cn.hom1.app.controller.api;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.vo.TopHot;
import cn.hom1.app.service.HotService;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 热榜
 *
 * @author iksen
 * @date 2019-10-31 09:16
 */
@RestController
@RequestMapping("api/hot")
public class ApiTopHotController {

  private HotService hotService;

  public ApiTopHotController(HotService hotService) {
    this.hotService = hotService;
  }

  @GetMapping("baidu")
  public JsonResult baiduApi(Integer t){
    List<TopHot> hotVoList;

    int realTime = 0,today = 1,baiKe = 2;

    if (t == realTime)
      hotVoList = hotService.baiduRealTime();
    else  if(t == today)
      hotVoList = hotService.baiduToday();
    else  if(t == baiKe)
      hotVoList = hotService.baiduBaiKe();
    else
      return new JsonResult(1,"参数有误");

    return new JsonResult(0,hotVoList);
  }

  @GetMapping("weibo")
  public JsonResult weiboApi(Integer t){
    List<TopHot> hotVoList;

    int realTime = 0,socialEvent = 1;

    if (t == realTime)
      hotVoList = hotService.weiboTopHot();
    else  if(t == socialEvent)
      hotVoList = hotService.weiboSocialEvent();
    else
      return new JsonResult(1,"参数有误");

    return new JsonResult(0,hotVoList);
  }
}

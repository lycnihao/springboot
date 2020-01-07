package com.couldr.app.web.mq;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.couldr.app.model.entity.WebSite;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
@RabbitListener(queues = "WebSitQueue")
public class DirectReceiver {

    private final static Logger logger = LoggerFactory.getLogger(DirectReceiver.class);

    @RabbitHandler
    public void process(JSONObject jsonObject) {
        System.out.println("--------队列消息---------");
        System.out.println("userId:"+jsonObject.get("userId"));
        System.out.println("data:"+jsonObject.get("data"));
        JSONArray jsonArray = jsonObject.getJSONArray("data");
        List<WebSite> webSiteList = JSONObject.parseArray(jsonArray.toJSONString(), WebSite.class);
        webSiteList.forEach(webSite -> {
            System.out.println(webSite.toString());
        });
    }
}

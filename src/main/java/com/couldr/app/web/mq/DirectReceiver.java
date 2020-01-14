package com.couldr.app.web.mq;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.utils.HtmlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;


@Component
@RabbitListener(queues = "WebSitQueue")
public class DirectReceiver {

    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private WebSiteService webSiteService;

    private final static Logger logger = LoggerFactory.getLogger(DirectReceiver.class);

    @RabbitHandler
    public void process(JSONObject jsonObject) {
        System.out.println("--------队列消息---------");
        System.out.println("userId:"+jsonObject.get("userId"));
        System.out.println("data:"+jsonObject.get("data"));
        JSONArray jsonArray = jsonObject.getJSONArray("data");
        List<WebSite> webSiteList = JSONObject.parseArray(jsonArray.toJSONString(), WebSite.class);
        webSiteList.forEach(webSite -> {
            try {
                URL rootUrl = new URL(webSite.getUrl());
                String rootStr = rootUrl.getProtocol()+"://"+ rootUrl.getHost();
                MultipartFile iconFile = HtmlUtil.getIconFile(rootStr+"/favicon.ico");
                if (iconFile == null){
                    iconFile = HtmlUtil.getRequestIcon(rootStr);
                }
                if (iconFile != null){
                    Map<String, String> resultMap = attachmentService.upload(iconFile,null);
                    webSite.setIcon(resultMap.get("filePath"));
                    System.out.println(webSite.toString());
                    webSiteService.create(webSite);
                }else {
                    System.out.println("null");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        });
    }
}

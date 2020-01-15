package com.couldr.app;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.couldr.app.model.entity.Category;
import com.couldr.app.model.entity.WebSite;
import com.couldr.app.model.entity.WebSiteCategory;
import com.couldr.app.model.entity.WebSiteLibrary;
import com.couldr.app.model.enums.WebsiteTypeEnum;
import com.couldr.app.service.*;
import com.couldr.app.utils.HtmlUtil;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.net.*;
import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	RabbitTemplate rabbitTemplate;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	WebSiteCategoryService webSiteCategoryService;

	@Autowired
	WebSiteService webSiteService;

	@Autowired
	WebSiteLibraryService webSiteLibraryService;

	@Test
	public void contextLoads() throws IOException, URISyntaxException {
		setIcon();
	/*	String href = "http://www.upwork.com/";
		URL rootUrl = new URL(href);
		String rootStr = rootUrl.getProtocol()+"://"+ rootUrl.getHost();
		MultipartFile iconFile = HtmlUtil.getIconFile(rootStr+"/favicon.ico");
		if (iconFile == null){
			iconFile = HtmlUtil.getRequestIcon(rootStr);
		}
		if (iconFile != null){
			Map<String, String> resultMap = attachmentService.upload(iconFile,null);
			resultMap.forEach((s, s2) -> System.out.println(s + "--->" + s2));
		}else {
			System.out.println("null");
		}*/
	}


	public void getIcon() {
		System.out.println(HtmlUtil.getIcon("http://www.168dh.cn"));
	}

	public void getIconFile() {
		String url = HtmlUtil.getIcon("http://www.168dh.cn");
		HtmlUtil.getIconFile(url);
	}

	public void  getWebSite(){
		String str = "[\n" +
				"        {\n" +
				"          linkid: 'workmodule1',\n" +
				"          navname: '招聘平台',\n" +
				"          hotlist: [\n" +
				"            {\n" +
				"              url: 'https://www.zhaopin.com/',\n" +
				"              title: '智联招聘',\n" +
				"              body: '权威的求职找工作平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.51job.com/',\n" +
				"              title: '前程无忧',\n" +
				"              body: '专业人才招聘网站',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://sh.58.com/',\n" +
				"              title: '58同城',\n" +
				"              body: '生活分类信息网站',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.liepin.com/',\n" +
				"              title: '猎聘',\n" +
				"              body: '精英职业发展平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.lagou.com/',\n" +
				"              title: '拉勾',\n" +
				"              body: '专注互联网职业招聘平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.dajie.com/',\n" +
				"              title: '大街',\n" +
				"              body: '年轻人专属社交招聘平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.linkedin.com/',\n" +
				"              title: 'Linkedin',\n" +
				"              body: '全球领先的职业社交网站',\n" +
				"            }\n" +
				"          ]\n" +
				"        },\n" +
				"        {\n" +
				"          linkid: 'workmodule2',\n" +
				"          navname: '程序兼职',\n" +
				"          hotlist: [\n" +
				"            {\n" +
				"              url: 'https://www.upwork.com/',\n" +
				"              title: 'Upwork',\n" +
				"              body: '全球最专业平台：程序丨设计丨文案',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.freelancer.com/',\n" +
				"              title: 'Freelancer',\n" +
				"              body: '全球最大平台：程序丨设计',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.fiverr.com/',\n" +
				"              title: 'Fiverr',\n" +
				"              body: '国外职业众包平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://codemart.com/',\n" +
				"              title: '码市',\n" +
				"              body: '基于云技术的软件外包服务平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.proginn.com/',\n" +
				"              title: '程序员客栈',\n" +
				"              body: '程序员的经纪人',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://shixian.com/',\n" +
				"              title: '实现网',\n" +
				"              body: '按需雇佣BAT工程师、设计师',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://crew.co/',\n" +
				"              title: 'Crew',\n" +
				"              body: 'WEB和移动设计项目兼职平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://www.lagou.com/about.html',\n" +
				"              title: '大鲲',\n" +
				"              body: '拉勾旗下按需雇佣平台',\n" +
				"            }\n" +
				"          ]\n" +
				"        },\n" +
				"        {\n" +
				"          linkid: 'workmodule3',\n" +
				"          navname: '设计兼职',\n" +
				"          hotlist: [\n" +
				"            {\n" +
				"              url: 'https://www.tezign.com/',\n" +
				"              title: '特赞',\n" +
				"              body: '设计创意需求解决平台',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'https://mianbaoduo.com/?from=czs',\n" +
				"              title: '面包多',\n" +
				"              body: '创作者的极简变现工具',\n" +
				"            },\n" +
				"            {\n" +
				"              url: 'http://www.waibaodashi.com/',\n" +
				"              title: '外包大师',\n" +
				"              body: '提供产品咨询、众测方案',\n" +
				"            }\n" +
				"          ]\n" +
				"        }\n" +
				"      ]";

		JSONArray jsonArray = (JSONArray) JSONArray.parse(str);
		for (Object object : jsonArray) {
			JSONObject jsonObject = JSON.parseObject(object.toString());
			Category category = new Category();
			category.setSlugName(jsonObject.get("linkid").toString());
			category.setName(jsonObject.get("navname").toString());
			category.setUserId(0L);
			category.setParentId(0);
			category.setCateType(0);
			categoryService.create(category);
			JSONArray jsonWebSite = jsonObject.getJSONArray("hotlist");
			for (Object o : jsonWebSite) {
				JSONObject json = JSON.parseObject(o.toString());
				WebSite webSite = new WebSite();
				webSite.setTitle(json.get("title").toString());
				webSite.setUrl(json.get("url").toString());
				webSite.setSummary(json.get("body").toString());
				webSite.setType(WebsiteTypeEnum.PRIVATE.getDesc());
				webSite.setCreateTime(new Date());
				webSiteService.create(webSite);

				WebSiteLibrary webSiteLibrary = new WebSiteLibrary();
				webSiteLibrary.setTitle(json.get("title").toString());
				webSiteLibrary.setUrl(json.get("url").toString());
				webSiteLibrary.setDescription(json.get("body").toString());
				webSiteLibrary.setCreateTime(new Date());
				System.out.println(webSite);

				WebSiteCategory webSiteCategory = new WebSiteCategory();
				webSiteCategory.setWebsiteId(webSite.getWebsiteId());
				webSiteCategory.setCategoryId(category.getCategoryId());
				webSiteCategoryService.create(webSiteCategory);

			}
		}
	}


	public void setIcon(){

		List<WebSite> webSites = webSiteService.findByIconIsNull();

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("userId","");
		jsonObject.put("data",webSites);
		rabbitTemplate.convertAndSend("CouldrExchange", "WebSitRouting", jsonObject);
	}

}

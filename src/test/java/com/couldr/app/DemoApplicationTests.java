package com.couldr.app;

import com.couldr.app.model.entity.WebSite;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.WebSiteService;
import com.couldr.app.utils.RequestUtil;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private WebSiteService webSiteService;

	@Test
	public void contextLoads(){
		webSiteService.initUserWeb(1);
	}
}

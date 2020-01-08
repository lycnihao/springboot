package com.couldr.app;

import com.couldr.app.service.AttachmentService;
import com.couldr.app.utils.HtmlUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	RabbitTemplate rabbitTemplate;

	@Autowired
	AttachmentService attachmentService;

	@Test
	public void contextLoads(){
		rabbitTemplate.convertAndSend("TestDirectExchange", "TestDirectRouting", "hello world");
	}

	@Test
	public void getIcon(){
		System.out.println(HtmlUtil.getIcon("http://www.168dh.cn"));
	}

	@Test
	public void getIconFile(){
		String url = HtmlUtil.getIcon("http://www.168dh.cn");
		HtmlUtil.getIconFile(url);
	}
}

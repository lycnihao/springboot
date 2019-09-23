package cn.hom1.app;

import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.service.RequestService;

import cn.hom1.app.utils.RequestWeb;
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

	@Autowired
	private RequestWeb requestWeb;

	@Test
	public void contextLoads(){
		/*System.out.println(new BCryptPasswordEncoder().encode("iksen22."));*/
		/*requestWeb.push();*/
		System.out.println(webSiteService.listWebSiteListByUserId(1));

	}

}

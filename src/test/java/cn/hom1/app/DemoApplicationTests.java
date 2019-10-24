package cn.hom1.app;

import cn.hom1.app.service.RequestService;
import cn.hom1.app.service.WebSiteUserService;
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
	private RequestService requestService;

	@Test
	public void contextLoads(){
		/*requestWeb.push();*/
		requestService.getWebContent("http://www.168dh.cn");
	}

}

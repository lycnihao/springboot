package cn.hom1.app;

import cn.hom1.app.service.LinkService;
import cn.hom1.app.service.RequestService;
import cn.hom1.app.utils.RequestUtil;
import java.io.IOException;

import cn.hom1.app.utils.RequestWeb;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private LinkService linksService;

	@Autowired
	private RequestService requestService;

	@Autowired
	private RequestWeb requestWeb;

	@Test
	public void contextLoads(){
		/*System.out.println(new BCryptPasswordEncoder().encode("iksen22."));*/
		requestWeb.push();
	}

}

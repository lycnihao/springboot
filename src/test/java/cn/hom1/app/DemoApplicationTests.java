package cn.hom1.app;

import cn.hom1.app.exception.NotFoundException;
import cn.hom1.app.service.LinksService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private LinksService linksService;

	@Test
	public void contextLoads(){

	}

}

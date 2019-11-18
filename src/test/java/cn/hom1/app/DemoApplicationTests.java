package cn.hom1.app;

import cn.hom1.app.service.RequestService;
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
		Object object = requestService.getWeather("changsha");
		System.out.println(object);
	}

}

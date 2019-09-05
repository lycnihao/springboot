package cn.hom1.app;

import cn.hom1.app.service.LinkService;
import cn.hom1.app.utils.RequestUtil;
import java.io.IOException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private LinkService linksService;

	@Test
	public void contextLoads(){
		try {
			 RequestUtil.requestSite("http://top.baidu.com/buzz.php?p=top10",false, "");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

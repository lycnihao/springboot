package cn.hom1.app;

import cn.hom1.app.service.LinksService;
import cn.hom1.app.utils.RequestUtil;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private LinksService linksService;

	@Test
	public void contextLoads(){
		try {
			 RequestUtil.requestSite("http://top.baidu.com/buzz.php?p=top10",false, "");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

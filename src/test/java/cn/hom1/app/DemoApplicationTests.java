package cn.hom1.app;

import cn.hom1.app.model.entity.Attachment;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.service.AttachmentService;
import cn.hom1.app.service.WebSiteService;
import cn.hom1.app.utils.RequestUtil;
import cn.hom1.app.utils.WebFileUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private WebSiteService webSiteService;

	@Autowired
	private AttachmentService attachmentService;

	@Test
	public void contextLoads(){
		getWebResourseUtil();
	}

	public void getWebResourseUtil(){
		Set<Integer> categoryIds = new HashSet<>();categoryIds.add(31);
		Document doc = RequestUtil.requestSite("http://lackk.com/nav/",false, "");
		Elements aElements = doc.select(".m-hotlink  > .hotlink:nth-child(3) > li");
		System.out.println(aElements.size());
		for (int i = 0;i<aElements.size();i++) {
			if (i >= 10 && i < 36){
			Element element = aElements.get(i);
			WebSite webSite = new WebSite();
			if (element.select(".linktxt").text().split("-").length == 1){
				webSite.setTitle(element.select(".linktxt").text().split("-")[0]);
			}else {
				webSite.setTitle(element.select(".linktxt").text().split("-")[0]);
				webSite.setSummary(element.select(".linktxt").text().split("-")[1]);
			}


			if (element.select("a").attr("href").split("=").length == 1){
				webSite.setUrl(element.select("a").attr("href").split("=")[0]);
			}else {
				webSite.setUrl(element.select("a").attr("href").split("=")[1]);
			}

			String imgUrl = element.select("img").attr("src");

			webSite.setIcon(imgUrl);
			webSite.setCreateTime(new Date());
			System.out.println(webSite);
			/*try {
				URL imgFileUrl = new URL(imgUrl);
				URLConnection conn = imgFileUrl.openConnection();
				InputStream inputStream = conn.getInputStream();
				String fileName = "";
				if (imgUrl.lastIndexOf("/") != -1){
					fileName = imgUrl.substring(imgUrl.lastIndexOf("/")+1 , imgUrl.length());
					System.out.println(fileName);
				}
				MultipartFile multipartFile = new MockMultipartFile(fileName,fileName,"", inputStream);
				Map<String, String> resultMap = attachmentService.upload(multipartFile, null);
				Attachment attachment = new Attachment();
				attachment.setAttachName(resultMap.get("fileName"));
				attachment.setAttachPath(resultMap.get("filePath"));
				attachment.setAttachSmallPath(resultMap.get("smallPath"));
				attachment.setAttachType(multipartFile.getContentType());
				attachment.setAttachSuffix(resultMap.get("suffix"));
				attachment.setAttachSize(resultMap.get("size"));
				attachment.setAttachWh(resultMap.get("wh"));
				attachment.setAttachLocation(resultMap.get("location"));
				webSite.setIcon(attachment.getAttachPath());
				attachmentService.create(attachment);
			}catch (IOException e) {
				e.printStackTrace();
			}*/

/*			webSiteService.save(webSite,categoryIds);*/
		}}

	}
}

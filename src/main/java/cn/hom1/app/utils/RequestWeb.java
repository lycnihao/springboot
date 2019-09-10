package cn.hom1.app.utils;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteService;
import cn.hutool.core.text.StrBuilder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

/**
 * 网址采集程序
 */
@Service
public class RequestWeb {

    private WebSiteService webSiteService;

    private CategoryService categoryService;

    public RequestWeb(WebSiteService webSiteService,
        CategoryService categoryService) {
        this.webSiteService = webSiteService;
        this.categoryService = categoryService;
    }

    public static void main(String[] args) {
        /*RequestWeb requestWeb = new RequestWeb();
        requestWeb.push();*/
    }

    public void pull(){

        //用户目录
        final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
        uploadPath.append("/hom1/");
        uploadPath.append("upload/");

        String webUrl = "http://www.yechuang.top/";
        Document doc = RequestUtil.requestSite(webUrl,false, "");
        Elements mainElements = doc.select("body > div:nth-child(4) > div > div.left.pull-left.col-md-9 > .list-nav");
        JSONArray jsonArray = new JSONArray();

        for (Element element : mainElements) {

            Elements list = element.select(".card-col");

            for (Element item : list) {
                String title = item.select(".hao h3").text();
                String summary = item.select(".hao p").text();
                String url = item.select(".hao").attr("href").split("=")[1];
                String category = element.select(".pull-left").text().trim();
                String img = item.select("img").attr("src");
                String imgHref = url.replace(".","_").split("//")[1];
                String imgPrefix = imgHref.lastIndexOf("/") == -1 ? imgHref : imgHref.substring(0,imgHref.lastIndexOf("/")).replace("/","--");
                String imgSuffix = img.substring(img.lastIndexOf("."),img.length());
                Map<String,String> map = new HashMap<>();
                map.put("title",title);
                map.put("summary",summary);
                map.put("url",url);
                /*map.put("img",img);*/
                map.put("logo",imgPrefix + imgSuffix);
                map.put("category",category);
                System.out.println(map);
                jsonArray.add(map);

                File file = new File(uploadPath +"/"+ imgPrefix + imgSuffix);

                try {
                    URL imgFileUrl = new URL(img);
                    URLConnection conn = imgFileUrl.openConnection();

                    InputStream inputStream = conn.getInputStream();

                    if (!file.exists()) {
                        file.createNewFile();
                    }

                    FileOutputStream output = new FileOutputStream(file);

                    int index;
                    byte[] bytes = new byte[1024];
                    while ((index = inputStream.read(bytes)) != -1) {
                        output.write(bytes, 0, index);
                        output.flush();
                    }
                    output.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        System.out.println(jsonArray);

        //总结 写入text
        try {
            String content = jsonArray.toJSONString();

            File file = new File(uploadPath + "/webSite.txt");
            if (!file.exists()) {
                file.createNewFile();
            }

            FileOutputStream fop = new FileOutputStream(file);
            // get the content in bytes
            byte[] contentInBytes = content.getBytes();

            fop.write(contentInBytes);
            fop.flush();
            fop.close();

            System.out.println("写入完成！！！");
            System.out.println("共写入"+jsonArray.size()+"个网址");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void push(){
        //用户目录
        final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
        uploadPath.append("/hom1/");
        uploadPath.append("upload/");

        try {
            BufferedReader in = new BufferedReader(new FileReader(uploadPath + "webSite.txt"));
            String str;
            while ((str = in.readLine()) != null) {
                JSONArray jsonArray = (JSONArray) JSON.parse(str);
                for(int i=0;i<jsonArray.size();i++){
                    JSONObject object = jsonArray.getJSONObject(i);
                    WebSite webSite = new WebSite();
                    webSite.setTitle(object.get("title").toString());
                    webSite.setSummary(object.get("summary").toString());
                    webSite.setIcon("http://47.106.84.166:3302/upload/" + object.get("logo").toString());
                    webSite.setUrl(object.get("url").toString());
                    webSite.setOrdered(0);
                    webSite.setIsTouch(0);
                    webSite.setIsRecommend(0);
                    webSite.setCreateTime(new Date());

                    List<Category> categories = new ArrayList<>();
                    Category category = categoryService.findByName(object.get("category").toString());
                    if (category == null){
                        category = new Category();
                        category.setName(object.get("category").toString());
                        category.setSlugName(object.get("category").toString());
                        category = categoryService.create(category);
                    }
                    categories.add(category);

                    /*links.setCategories(categories);*/
                    webSiteService.save(webSite);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

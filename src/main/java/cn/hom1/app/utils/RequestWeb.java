package cn.hom1.app.utils;

import cn.hom1.app.model.entity.Category;
import cn.hom1.app.model.entity.Links;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.LinkService;
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

    @Autowired
    private LinkService linkService;

    @Autowired
    private CategoryService categoryService;

    public static void main(String[] args) {
        RequestWeb requestWeb = new RequestWeb();
        requestWeb.pust();
    }

    public void pull(){
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
                jsonArray.add(map);

                File file = new File("C:/Users/38707/Desktop/网站批量导入/网站图标/" + imgPrefix + imgSuffix);

                try {
                    URL imgFileUrl = new URL(img);
                    URLConnection conn = imgFileUrl.openConnection();

                    InputStream inputStream = conn.getInputStream();

                    FileOutputStream output = new FileOutputStream(file);

                    if (!file.exists()) {
                        file.createNewFile();
                    }

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
        File file = new File("C:/Users/38707/Desktop/网站批量导入/webSite.txt");
        String content = jsonArray.toJSONString();

        try (FileOutputStream fop = new FileOutputStream(file)) {

            // if file doesn't exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

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

    public void pust(){
        try {
            BufferedReader in = new BufferedReader(new FileReader("C:/Users/38707/Desktop/网站批量导入/webSite.txt"));
            String str;
            while ((str = in.readLine()) != null) {
                JSONArray jsonArray = (JSONArray) JSON.parse(str);
                for(int i=0;i<jsonArray.size();i++){
                    JSONObject object = jsonArray.getJSONObject(i);
                    Links  links = new Links();
                    links.setTitle(object.get("title").toString());
                    links.setSummary(object.get("summary").toString());
                    links.setIcon("http://47.106.84.166:3302/upload/" + object.get("logo").toString());
                    links.setUrl(object.get("url").toString());
                    links.setOrdered(0);
                    links.setIsTouch(0);
                    links.setIsRecommend(0);
                    links.setCreateTime(new Date());

                    List<Category> categories = new ArrayList<>();
                    Category category = categoryService.findByName(object.get("category").toString());
                    if (category == null){
                        category = new Category();
                        category.setName(object.get("category").toString());
                        category.setSlugName(object.get("category").toString());
                        category = categoryService.create(category);
                    }
                    categories.add(category);

                    links.setCategories(categories);
                    linkService.save(links);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

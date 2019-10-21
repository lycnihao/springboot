package cn.hom1.app.utils;

import cn.hom1.app.model.entity.WebSite;
import cn.hom1.app.model.entity.WebSiteCategory;
import cn.hom1.app.model.enums.WebsiteTypeEnum;
import cn.hom1.app.service.CategoryService;
import cn.hom1.app.service.WebSiteCategoryService;
import cn.hom1.app.service.WebSiteService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import cn.hom1.app.model.entity.Category;

import java.util.*;

/**
 * 网址采集程序
 */
@Service
public class RequestWeb {

    private WebSiteService webSiteService;

    private CategoryService categoryService;

    private WebSiteCategoryService webSiteCategoryService;

    public RequestWeb(WebSiteService webSiteService,
        CategoryService categoryService,WebSiteCategoryService webSiteCategoryService) {
        this.webSiteService = webSiteService;
        this.categoryService = categoryService;
        this.webSiteCategoryService = webSiteCategoryService;
    }

    public String pull() {

        String webUrl = "http://www.yechuang.top/";
        Document doc = RequestUtil.requestSite(webUrl, false, "");
        Elements mainElements = doc
            .select("body > div:nth-child(4) > div > div.left.pull-left.col-md-9");
        JSONArray jsonArray = new JSONArray();

        Elements listNav = mainElements.select(".list-nav");

        for (Element listNavItem : listNav) {
            String parentSlugName = listNavItem.select(".list-nav").attr("id");
            String parentName = listNavItem.select(".nav>h3").text();
            /*System.out.println(parentSlugName);
            System.out.println(parentName);*/
            Map<String, Object> parent = new HashMap<>(3);
            parent.put("name", parentName);
            parent.put("slugName", parentSlugName);
            Map<String, Object> cates = new HashMap<>();
            for (Element tab : listNavItem.select(".tab-content .tab-pane")) {
                List<WebSite> list = new ArrayList<>();
                for (Element item : tab.select(".card-col")) {
                    String title = item.select(".hao h3").text();
                    String summary = item.select(".hao p").text();
                    String url = item.select(".hao").attr("href").split("=")[1];
                    String img = item.select("img").attr("src");
                    String imgHref = url.replace(".", "_").split("//")[1];
                    String imgPrefix = imgHref.lastIndexOf("/") == -1 ? imgHref
                        : imgHref.substring(0, imgHref.lastIndexOf("/")).replace("/", "--");
                    String imgSuffix = img.substring(img.lastIndexOf("."), img.length());

                    WebSite webSite = new WebSite();
                    webSite.setTitle(title);
                    webSite.setSummary(summary);
                    webSite.setUrl(url);
                    webSite.setOrdered(0);
                    webSite.setIcon("http://47.106.84.166:3302/upload/"+imgPrefix + imgSuffix);
                    webSite.setType(WebsiteTypeEnum.PUBLIC.getDesc());
                    webSite.setCreateTime(new Date());
                    webSite.setVisits(0);

                    list.add(webSite);
                }

                String name = tab.select(".tab-pane").attr("id");
                cates.put(name, list);
            }
            parent.put("subCate", cates);
            jsonArray.add(parent);
        }
        System.out.println(jsonArray);
        return jsonArray.toJSONString();
    }


    public void push() {

        JSONArray jsonArray = (JSONArray) JSON.parse(this.pull());
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject object = jsonArray.getJSONObject(i);
            /*System.out.println(object);*/
            Category parentCate = new Category();
            parentCate.setSlugName(object.get("slugName").toString());
            parentCate.setName(object.get("name").toString());
            parentCate.setParentId(0);
            Category parentCategory = categoryService.create(parentCate);
            System.out.println(parentCategory);
            Map<String,Object> subCates = (Map<String, Object>) object.get("subCate");
            /*System.out.println(subCates);*/
            for (String subCate: subCates.keySet()){
                System.out.println(subCate);

                Category subCategory = new Category();
                subCategory.setSlugName(subCate);
                subCategory.setName(subCate);
                subCategory.setParentId(parentCate.getCategoryId());

                Category category = categoryService.create(subCategory);

                JSONArray webSitesArray = (JSONArray) subCates.get(subCate);
                List<WebSite> webSites = webSitesArray.toJavaList(WebSite.class);
                for (WebSite  webSite:webSites){
                    Set<Integer> categoryIds = new HashSet<>();
                    categoryIds.add(category.getCategoryId());
                    webSiteService.save(webSite,categoryIds);
                }

            }
            System.out.println("----------------------");
        }
    }

}
    /*public void pull(){

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
                *//*map.put("img",img);*//*
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
    }*/

  /*  public void push(){
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

                    *//*links.setCategories(categories);*//*
                    *//*webSiteService.save(webSite);*//*
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}*/

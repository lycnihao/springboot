package cn.hom1.app.config;


import cn.hom1.app.model.freemarker.CommonTagDirective;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * <pre>
 *     FreeMarker配置
 * </pre>
 *
 * @author : RYAN0UP
 * @date : 2018/4/26
 */
@Slf4j
@Configuration
public class FreeMarkerAutoConfiguration {

    @Autowired
    private freemarker.template.Configuration configuration;

    @Autowired
    private CommonTagDirective commonTagDirective;

    @PostConstruct
    public void setSharedVariable() {
        try {
            //自定义标签
            configuration.setSharedVariable("commonTag", commonTagDirective);
        } catch (Exception e) {
            log.error("Custom tags failed to load：{}", e.getMessage());
        }
    }
}

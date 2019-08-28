package cn.hom1.app;


import cn.hom1.app.repository.base.BaseRepositoryImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableCaching
@EnableJpaAuditing
@EnableJpaRepositories(basePackages = "cn.hom1.app.repository", repositoryBaseClass = BaseRepositoryImpl.class)
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}

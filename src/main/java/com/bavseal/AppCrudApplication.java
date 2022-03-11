package com.bavseal;

import com.bavseal.repository.UsuarioDao;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
public class AppCrudApplication {

	public static void main(String[] args) {
		SpringApplication.run(AppCrudApplication.class, args);
	}

}

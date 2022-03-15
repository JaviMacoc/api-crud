package com.bavseal.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //Por ahora solo está funcionando con loginPage("login") y sin loginProcessingUrl("x").
        http.authorizeRequests()
                .antMatchers("/articulos/agregar", "/articulos/actualizar","/articulos/eliminar", "/clientes/**", "/facturas/**").hasAuthority("ROLE_ADMIN")
                .antMatchers("/articulos/listaDeArticulos", "/facturas/listaDeFacturas", "/api/**").hasAnyAuthority("ROLE_USER", "ROLE_ADMIN")
                .antMatchers("/registroForm", "/registrarUsuario", "/css/**", "/js/**", "/img/**", "/api/**", "/auth/**").permitAll().anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/login").defaultSuccessUrl("/usuarioLogin", true).failureForwardUrl("/loginFail").permitAll()
                .and()
                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID").logoutSuccessUrl("/login")
                .and()
                .exceptionHandling().accessDeniedPage("/accesoNoAutorizado")
                .and()
                .csrf().disable();
    }
}

package com.mom.client.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;

@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter{
	// 데이터 소스
	private final UserDetailsService userDetailsService;

	@Autowired
	public SecurityConfig(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http
	            .sessionManagement()
	            .sessionCreationPolicy(SessionCreationPolicy.ALWAYS) // 항상 세션 생성
	            .invalidSessionUrl("/invalidSession") // 세션이 유효하지 않을 때 이동할 URL 지정
	            .maximumSessions(10) // 최대 허용 세션 수 지정 (예: 1은 한 사용자당 1개의 세션만 허용)
	            .expiredUrl("/sessionExpired"); // 세션이 만료되었을 때 이동할 URL 지정
	        
	        http.authorizeRequests().antMatchers("/client/mypage/**").authenticated() // 마이페이지는 인증이 필요
			.anyRequest().permitAll() // 나머지 요청은 모두 허용
			.and().formLogin().loginPage("/client/login/login") // 로그인 페이지 경로
			.loginProcessingUrl("/user/login") // 로그인 요청 처리 경로
			.defaultSuccessUrl("/client/mypage/myPageInfo", true) // 로그인 성공 시 이동할 경로
			.and().logout().logoutSuccessUrl("/client/login/login?logout") // 로그아웃 시 이동할 경로
			.and().csrf().disable(); // 간단하게 CSRF 토큰 비활성화 (실제 서비스에서는 보안에 유의해야 함)
	    }
}
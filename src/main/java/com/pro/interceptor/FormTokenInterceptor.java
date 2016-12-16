package com.pro.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pro.annotation.FormToken;
import com.pro.util.PublicUtil;

public class FormTokenInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			FormToken annotation = method.getAnnotation(FormToken.class);
			if (annotation != null) {
				Subject subject = SecurityUtils.getSubject();
				if (annotation.init()) {
					subject.getSession().setAttribute("token", "TOKEN" + PublicUtil.initId());
				}
				if (annotation.check()) {
					if (isRepeatSubmit(request)) {
						return false;
					}
					subject.getSession().removeAttribute("token");
				}
			}
			return true;
		} else {
			return super.preHandle(request, response, handler);
		}
	}

	private boolean isRepeatSubmit(HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		String serverToken = (String) subject.getSession().getAttribute("token");
		if (serverToken == null) {
			return true;
		}
		String clinetToken = request.getParameter("token");
		if (clinetToken == null) {
			return true;
		}
		if (!serverToken.equals(clinetToken)) {
			return true;
		}
		return false;
	}
}

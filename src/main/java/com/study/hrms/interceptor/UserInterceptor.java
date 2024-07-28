package com.study.hrms.interceptor;

import com.study.hrms.common.CommonCode;
import com.study.hrms.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserInterceptor implements HandlerInterceptor {

    //请求处理前调用
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            //统一拦截,查询当前session是否存在user,user每次登录成功后,都会写入session
            User user = (User) request.getSession().getAttribute(CommonCode.SESSION_USER);
            if(user != null){
                return true;
            }
            response.sendRedirect(request.getContextPath()+"/loginPage");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    //请求处理之后,视图被渲染前,Controller方法后调用
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    //在整个请求结束后,DispatcherServlet渲染视图后调用,主要用于进行资源清理工作
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

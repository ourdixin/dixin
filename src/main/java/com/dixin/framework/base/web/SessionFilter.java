package com.dixin.framework.base.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.OncePerRequestFilter;

import com.dixin.finance.authentication.constant.UserTypeConstant;
import com.dixin.finance.authentication.vo.UserVO;


public class SessionFilter extends OncePerRequestFilter {

	private static final Logger logger = LoggerFactory.getLogger(OncePerRequestFilter.class);
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal(
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 不过滤的uri
		String[] notFilter = new String[] { "login.jsp","/admin/login"};

		// 请求的uri
		String uri = request.getRequestURI();
		
		
		
		// uri中包含background时才进行过滤
		if (uri.indexOf("admin/") != -1 && (uri.indexOf(".") == -1 || uri.indexOf(".jsp") != -1 )) {
			// 是否过滤
			boolean doFilter = true;
			for (String keywords : notFilter) {
				if (uri.indexOf(keywords) != -1) {
					// 如果uri中包含不过滤的uri，则不进行过滤
					doFilter = false;
					break;
				}
			}
			if (doFilter) {
				logger.info(uri);
				// 执行过滤
				// 从session中获取登录者实体
				UserVO user = (UserVO)request.getSession().getAttribute("user");
				if ( null == user || user.getUserType() != UserTypeConstant.MANAGER) {
					// 如果session中不存在登录者实体，则弹出框提示重新登录
					// 设置request和response的字符集，防止乱码
					request.setCharacterEncoding("GBK");
					response.setCharacterEncoding("GBK");
					PrintWriter out = response.getWriter();
					String loginPage = request.getContextPath()+"/admin/login.jsp";
					String builder = new String();
					builder += "<script type=\"text/javascript\">";
					builder += "alert('网页过期，请重新登录！');";
					builder += "window.top.location.href='";
					builder += loginPage;
					builder += "';";
					builder += "</script>";
					out.print(new String(builder.getBytes("GBK")));
				} else {
					// 如果session中存在登录者实体，则继续
					filterChain.doFilter(request, response);
				}
			} else {
				// 如果不执行过滤，则继续
				filterChain.doFilter(request, response);
			}
		} else {
			// 如果uri中不包含background，则继续
			filterChain.doFilter(request, response);
		}
	}

}

package com.dixin.framework.base.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dixin.framework.base.web.TokenHandler;


public class TokenTag extends SimpleTagSupport {

    public void doTag() throws JspException, IOException {

    	HttpSession session = ((PageContext)this.getJspContext()).getSession();
        ServletContext servletContext = ((PageContext) this.getJspContext()).getServletContext();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        TokenHandler handler = ctx.getBean(TokenHandler.class);

        JspWriter out = getJspContext().getOut();
        out.println("<input type=\"hidden\" id=\"token\" name=\"token\"  value=\"" + handler.generate(session) + "\""+ "/>");
    }

}

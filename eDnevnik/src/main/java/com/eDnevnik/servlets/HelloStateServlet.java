package com.eDnevnik.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloStateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
	   doGet(request,response);
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
           response.setContentType("text/html");
           PrintWriter out = response.getWriter();
	   out.println("<h2>Hello Bulgaria</h2>");	
	}
    
    
}

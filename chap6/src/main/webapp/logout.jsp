<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="inc_func.jsp" %>

<%
session.invalidate();
response.sendRedirect("login2.jsp");


%>
<%@page import="admin.book.svc.BKService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	JSONArray BKList = null;
BKService bKateService = new BKService(); 
BKList = bKateService.getBKList("BK1, BK2", "BK2");
%>
<%=BKList%>
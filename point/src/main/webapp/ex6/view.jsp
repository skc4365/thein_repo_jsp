<%@page import="ex6.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<style>
  body { font-family: sans-serif; padding: 20px; }
  h2 { border-bottom: 2px solid #333; padding-bottom: 8px; }
  table { border-collapse: collapse; width: 450px; margin-top: 10px; }
  th, td { border: 1px solid #ccc; padding: 10px 14px; }
  th { background-color: #f5f5f5; width: 120px; text-align: left; }
  a { color: #333; text-decoration: none; }
  .btn { padding: 6px 14px; border: 1px solid #999; border-radius: 3px; font-size: 13px; display: inline-block; }
  .btn-list { background: #f5f5f5; color: #333; }
  .btn-edit { background: #FF9800; color: white !important; border-color: #FF9800; }
  .btn-del { background: #f44336; color: white !important; border-color: #f44336; }
</style>
</head>
<body>
<h2>회원 상세 정보</h2>
<%
    MemberVO member = (MemberVO) request.getAttribute("member");
    if (member == null) {
%>
  <p style="color:#c00; font-weight: bold;">회원 정보를 찾을 수 없습니다.</p>
  <br>
  <a class="btn btn-list" href="member">목록으로 돌아가기</a>
<%
    } else {
%>
<table>
  <tr><th>번호</th>  <td><%= member.getId() %></td></tr>
  <tr><th>아이디</th><td><%= member.getUserid() %></td></tr>
  <tr><th>이름</th>  <td><%= member.getUsername() %></td></tr>
  <tr><th>이메일</th><td><%= member.getEmail() != null ? member.getEmail() : "-" %></td></tr>
  <tr><th>가입일</th><td><%= member.getRegDate() %></td></tr>
</table>
<br>
<a class="btn btn-list" href="member">목록으로</a>
<a class="btn btn-edit" href="member?action=edit&id=<%= member.getId() %>">수정</a>
<a class="btn btn-del" href="member?action=delete&id=<%= member.getId() %>"
   onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
<%
    }
%>
</body>
</html>
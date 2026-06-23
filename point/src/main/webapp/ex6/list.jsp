<%@page import="java.util.List"%>
<%@page import="ex6.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
    if (memberList == null) {
        response.sendRedirect("member");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
  body { font-family: sans-serif; padding: 20px; }
  h2 { border-bottom: 2px solid #333; padding-bottom: 8px; }
  table { border-collapse: collapse; width: 100%; margin-top: 10px; }
  th, td { border: 1px solid #ccc; padding: 8px 12px; text-align: center; }
  th { background-color: #f5f5f5; }
  a { color: #333; text-decoration: none; }

  .btn { padding: 4px 10px; border: 1px solid #999; border-radius: 3px; font-size: 13px; display: inline-block; }
  .btn-add { background: #4CAF50; color: white !important; border-color: #4CAF50; }
  .btn-view { background: #2196F3; color: white !important; border-color: #2196F3; }
  .btn-edit { background: #FF9800; color: white !important; border-color: #FF9800; }
  .btn-del { background: #f44336; color: white !important; border-color: #f44336; }
  .link-detail { color: #2196F3; text-decoration: underline; font-weight: bold; }

</style>
</head>
<body>
<h2>회원 목록</h2>
<a class="btn btn-add" href="member?action=form">+ 회원 등록</a>
<br><br>

<table>
  <tr>
    <th>번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>가입일</th><th>관리</th>
  </tr>

  <% if (memberList.isEmpty()) { %>

  <tr><td colspan="6" style="color:#888;">등록된 회원이 없습니다.</td></tr>
  <% } else {
       for (MemberVO m : memberList) { %>
  <tr>
    <td><%= m.getId() %></td>

    <td><a class="link-detail" href="member?action=view&id=<%= m.getId() %>" title="상세보기 클릭"><%= m.getUserid() %></a></td>

    <td><%= m.getUsername() %></td>
    <td><%= m.getEmail() != null ? m.getEmail() : "-" %></td>
    <td><%= m.getRegDate() %></td>
    <td>

      <a class="btn btn-view" href="member?action=view&id=<%= m.getId() %>">상세</a>
      <a class="btn btn-edit" href="member?action=edit&id=<%= m.getId() %>">수정</a>

      <a class="btn btn-del" href="member?action=delete&id=<%= m.getId() %>"
         onclick="return confirm('<%= m.getUsername() %> 회원을 삭제할까요?')">삭제</a>
    </td>
  </tr>
  <% } } %>
</table>
</body>

</html>


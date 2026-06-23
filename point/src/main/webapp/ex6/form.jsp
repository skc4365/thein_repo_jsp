<%@page import="ex6.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberVO member = (MemberVO) request.getAttribute("member");
    boolean isEdit = (member != null);
    String title = isEdit ? "회원 수정" : "회원 등록";
    String action = isEdit ? "update" : "insert";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= title %></title>
<style>
  body { font-family: sans-serif; padding: 20px; }
  h2 { border-bottom: 2px solid #333; padding-bottom: 8px; }
  table { border-collapse: collapse; width: 450px; margin-top: 10px; }
  th, td { border: 1px solid #ccc; padding: 10px 14px; }
  th { background-color: #f5f5f5; width: 120px; text-align: left; }
  input[type="text"], input[type="password"], input[type="email"] {
    width: 90%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  a { color: #333; text-decoration: none; }
  .btn { padding: 6px 14px; border: 1px solid #999; border-radius: 3px; font-size: 13px; cursor: pointer; }
  .btn-submit { background: #4CAF50; color: white; border-color: #4CAF50; }
  .btn-cancel { background: #f5f5f5; color: #333; }
</style>
</head>
<body>
<h2><%= title %></h2>
<form action="member" method="post">
  <input type="hidden" name="action" value="<%= action %>">
  <% if (isEdit) { %>
    <input type="hidden" name="id" value="<%= member.getId() %>">
  <% } %>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <input type="text" name="userid" required value="<%= isEdit ? member.getUserid() : "" %>" <%= isEdit ? "readonly style='background-color:#eee;'" : "" %>>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>
        <input type="password" name="password" required value="<%= isEdit ? member.getPassword() : "" %>">
      </td>
    </tr>
    <tr>
      <th>이름</th>
      <td>
        <input type="text" name="username" required value="<%= isEdit ? member.getUsername() : "" %>">
      </td>
    </tr>
    <tr>
      <th>이메일</th>
      <td>
        <input type="email" name="email" value="<%= isEdit && member.getEmail() != null ? member.getEmail() : "" %>">
      </td>
    </tr>
  </table>
  <br>
  <input type="submit" class="btn btn-submit" value="<%= isEdit ? "수정완료" : "등록완료" %>">
  <a class="btn btn-cancel" href="member">취소</a>
</form>
</body>
</html>
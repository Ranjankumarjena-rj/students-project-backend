<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students Project</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f0f2f5; }
        .header { background: #2c3e50; color: white; padding: 20px 40px; }
        .header h1 { font-size: 24px; }
        .container { max-width: 1000px; margin: 30px auto; padding: 0 20px; }
        .btn { padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #3498db; color: white; }
        .btn-success { background: #27ae60; color: white; }
        .btn-danger { background: #e74c3c; color: white; }
        .btn:hover { opacity: 0.85; }
        .add-btn { margin-bottom: 20px; display: inline-block; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        th { background: #2c3e50; color: white; padding: 14px; text-align: left; }
        td { padding: 12px 14px; border-bottom: 1px solid #eee; }
        tr:hover td { background: #f8f9fa; }
        .empty { text-align: center; padding: 40px; color: #999; }
        .msg { background: #d4edda; color: #155724; padding: 12px 20px; border-radius: 4px; margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🎓 Students Management System</h1>
    </div>
    <div class="container">
        <a href="${pageContext.request.contextPath}/student?action=new" class="btn btn-primary add-btn">+ Add New Student</a>

        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty students}">
                        <tr><td colspan="6" class="empty">No students found. Add one!</td></tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="s" items="${students}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td>${s.name}</td>
                                <td>${s.email}</td>
                                <td>${s.phone}</td>
                                <td>${s.course}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/student?action=edit&id=${s.id}" class="btn btn-success">Edit</a>
                                    &nbsp;
                                    <a href="${pageContext.request.contextPath}/student?action=delete&id=${s.id}"
                                       class="btn btn-danger"
                                       onclick="return confirm('Delete this student?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>

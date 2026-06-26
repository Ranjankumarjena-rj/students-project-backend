<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty student ? 'Add Student' : 'Edit Student'}</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f0f2f5; }
        .header { background: #2c3e50; color: white; padding: 20px 40px; }
        .header h1 { font-size: 24px; }
        .container { max-width: 600px; margin: 40px auto; padding: 0 20px; }
        .card { background: white; border-radius: 8px; padding: 30px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .card h2 { margin-bottom: 24px; color: #2c3e50; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; font-weight: bold; color: #555; }
        input, select { width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        input:focus, select:focus { outline: none; border-color: #3498db; }
        .btn { padding: 10px 24px; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; text-decoration: none; }
        .btn-primary { background: #3498db; color: white; }
        .btn-secondary { background: #95a5a6; color: white; margin-left: 10px; }
        .btn:hover { opacity: 0.85; }
        .actions { margin-top: 24px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🎓 Students Management System</h1>
    </div>
    <div class="container">
        <div class="card">
            <h2>${empty student ? '➕ Add New Student' : '✏️ Edit Student'}</h2>
            <form action="${pageContext.request.contextPath}/student" method="post">
                <input type="hidden" name="action" value="${empty student ? 'add' : 'edit'}">
                <c:if test="${not empty student}">
                    <input type="hidden" name="id" value="${student.id}">
                </c:if>

                <div class="form-group">
                    <label>Full Name *</label>
                    <input type="text" name="name" value="${student.name}" placeholder="Enter full name" required>
                </div>

                <div class="form-group">
                    <label>Email *</label>
                    <input type="email" name="email" value="${student.email}" placeholder="Enter email" required>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" value="${student.phone}" placeholder="Enter phone number">
                </div>

                <div class="form-group">
                    <label>Course *</label>
                    <select name="course" required>
                        <option value="">-- Select Course --</option>
                        <option value="Computer Science" ${student.course == 'Computer Science' ? 'selected' : ''}>Computer Science</option>
                        <option value="Information Technology" ${student.course == 'Information Technology' ? 'selected' : ''}>Information Technology</option>
                        <option value="Electronics" ${student.course == 'Electronics' ? 'selected' : ''}>Electronics</option>
                        <option value="Mechanical" ${student.course == 'Mechanical' ? 'selected' : ''}>Mechanical</option>
                        <option value="Civil" ${student.course == 'Civil' ? 'selected' : ''}>Civil</option>
                        <option value="MBA" ${student.course == 'MBA' ? 'selected' : ''}>MBA</option>
                    </select>
                </div>

                <div class="actions">
                    <button type="submit" class="btn btn-primary">
                        ${empty student ? 'Add Student' : 'Update Student'}
                    </button>
                    <a href="${pageContext.request.contextPath}/student" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

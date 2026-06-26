package com.student.servlet;

import com.student.dao.StudentDAO;
import com.student.model.Student;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    private StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("/WEB-INF/views/student-form.jsp").forward(req, res);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Student s = dao.getStudentById(id);
                req.setAttribute("student", s);
                req.getRequestDispatcher("/WEB-INF/views/student-form.jsp").forward(req, res);
                break;
            case "delete":
                int delId = Integer.parseInt(req.getParameter("id"));
                dao.deleteStudent(delId);
                res.sendRedirect(req.getContextPath() + "/student");
                break;
            default:
                List<Student> list = dao.getAllStudents();
                req.setAttribute("students", list);
                req.getRequestDispatcher("/WEB-INF/views/student-list.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        Student s = new Student();

        if ("edit".equals(action)) {
            s.setId(Integer.parseInt(req.getParameter("id")));
        }

        s.setName(req.getParameter("name"));
        s.setEmail(req.getParameter("email"));
        s.setPhone(req.getParameter("phone"));
        s.setCourse(req.getParameter("course"));

        if ("edit".equals(action)) {
            dao.updateStudent(s);
        } else {
            dao.addStudent(s);
        }

        res.sendRedirect(req.getContextPath() + "/student");
    }
}

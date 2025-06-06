package org.example.javaee_test.controller;

import org.example.javaee_test.service.ScoreService;
import org.example.javaee_test.service.StudentService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/score")
public class ScoreController extends HttpServlet {

    @EJB
    private ScoreService scoreService;

    @EJB
    private StudentService studentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("students", studentService.getAllStudents());
        request.setAttribute("subjects", scoreService.getAllSubjects());
        request.getRequestDispatcher("/WEB-INF/views/score-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        BigDecimal score1 = new BigDecimal(request.getParameter("score1"));
        BigDecimal score2 = new BigDecimal(request.getParameter("score2"));

        scoreService.addScore(studentId, subjectId, score1, score2);

        response.sendRedirect(request.getContextPath() + "/");
    }
}

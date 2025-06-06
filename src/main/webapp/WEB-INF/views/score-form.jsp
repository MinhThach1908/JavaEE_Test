<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/6/2025
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.javaee_test.entity.Student" %>
<%@ page import="org.example.javaee_test.entity.Subject" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Score - SIS</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(135deg, #6b8e6b, #7ba05b);
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 2.5em;
            font-weight: 300;
            text-align: center;
        }

        /* Content Styles */
        .content {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
        }

        .section-header h2 {
            color: #4a4a4a;
            font-size: 1.8em;
            font-weight: 400;
        }

        .button-group {
            display: flex;
            gap: 10px;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="header">
        <h1>Student Information System</h1>
    </header>

    <div class="content">
        <div class="form-container">
            <h2>Add Student Score</h2>

            <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("message") %>
            </div>
            <% } %>

            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <%= request.getAttribute("error") %>
            </div>
            <% } %>

            <form method="post" action="score" class="form">
                <div class="form-group">
                    <label for="studentId">Student:</label>
                    <select id="studentId" name="studentId" required>
                        <option value="">Select a student</option>
                        <%
                            List<Student> students = (List<Student>) request.getAttribute("students");
                            if (students != null) {
                                for (Student student : students) {
                        %>
                        <option value="<%= student.getStudentId() %>">
                            <%= student.getStudentCode() %> - <%= student.getFullName() %>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="subjectId">Subject:</label>
                    <select id="subjectId" name="subjectId" required>
                        <option value="">Select a subject</option>
                        <%
                            List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
                            if (subjects != null) {
                                for (Subject subject : subjects) {
                        %>
                        <option value="<%= subject.getSubjectId() %>">
                            <%= subject.getSubjectCode() %> - <%= subject.getSubjectName() %>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="score1">Score 1:</label>
                        <input type="number" id="score1" name="score1" required
                               min="0" max="10" step="0.1" placeholder="0.0">
                    </div>

                    <div class="form-group">
                        <label for="score2">Score 2:</label>
                        <input type="number" id="score2" name="score2" required
                               min="0" max="10" step="0.1" placeholder="0.0">
                    </div>
                </div>

                <div class="grade-info">
                    <h4>Grade Calculation:</h4>
                    <p>Final Grade = 0.3 × Score 1 + 0.7 × Score 2</p>
                    <ul>
                        <li>8.0 - 10.0: Grade A</li>
                        <li>6.0 - 7.9: Grade B</li>
                        <li>4.0 - 5.9: Grade D</li>
                        <li>Less than 4.0: Grade F</li>
                    </ul>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Add Score</button>
                    <a href="index.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
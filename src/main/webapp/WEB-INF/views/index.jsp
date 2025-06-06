<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/6/2025
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.javaee_test.repository.ScoreRepositoryImpl" %>
<%@ page import="org.example.javaee_test.entity.Score" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="org.example.javaee_test.repository.ScoreRepository" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information System</title>
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
        <div class="section-header">
            <h2>Student Information</h2>
            <div class="button-group">
                <a href="student" class="btn btn-primary">+ Student</a>
                <a href="score" class="btn btn-secondary">+ Score</a>
            </div>
        </div>

        <div class="table-container">
            <table class="data-table">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Student Id</th>
                    <th>Student Name</th>
                    <th>Subject Name</th>
                    <th>Score 1</th>
                    <th>Score 2</th>
                    <th>Credit</th>
                    <th>Grade</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ScoreRepository scoreDAO = new ScoreRepositoryImpl();
                    List<Score> scores = scoreDAO.findAll();
                    DecimalFormat df = new DecimalFormat("#.#");

                    int rowId = 1;
                    for (Score score : scores) {
                %>
                <tr>
                    <td><%= rowId++ %></td>
                    <td><%= score.getStudentScoreId() %></td>
                    <td><%= score.getStudent().getFullName() %></td>
                    <td><%= score.getSubject().getSubjectName() %></td>
                    <td><%= df.format(score.getScore1()) %></td>
                    <td><%= df.format(score.getScore2()) %></td>
                    <td class="grade-<%= score.getLetterGrade().toLowerCase() %>">
                        <%= score.getLetterGrade() %>
                    </td>
                    <td>
                        <a href="#" class="action-link">✏️</a>
                    </td>
                </tr>
                <%
                    }
                    if (scores.isEmpty()) {
                %>
                <tr>
                    <td colspan="9" class="no-data">No student scores available</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>


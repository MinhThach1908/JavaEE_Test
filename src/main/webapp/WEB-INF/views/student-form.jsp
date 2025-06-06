<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/6/2025
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student - SIS</title>
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
            <h2>Add New Student</h2>

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

            <form method="post" action="student" class="form">
                <div class="form-group">
                    <label for="studentCode">Student Code:</label>
                    <input type="text" id="studentCode" name="studentCode" required
                           placeholder="e.g., 2007A10" maxlength="20">
                </div>

                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" required
                           placeholder="e.g., Nguyễn Văn A" maxlength="100">
                </div>

                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address"
                           placeholder="e.g., Hà Nội" maxlength="255">
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Add Student</button>
                    <a href="index.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
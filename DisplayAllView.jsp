<%@page import="bank.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Display All Record</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <style>
      body {
        background: linear-gradient(
          90deg,
          rgba(2, 0, 36, 1) 0%,
          rgba(23, 136, 59, 0.47111344537815125) 0%,
          rgba(0, 212, 255, 0) 95%
        );
        height: 80vh;
      }

      .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: transparent;
        font-size: 1.3rem;
        margin-top: 1rem;
      }
      .navbar .btn {
        min-height: 3.8rem;
        width: 15%;
        border-radius: 15px;

        font-size: 1.3rem;
      }
      .navbar .btn {
        text-decoration: underline;
      }
      .navbar,
      .navbar-expand-lg,
      .bg-body-tertiary {
        background: transparent;
      }
      .navbar-nav {
        justify-content: center;
        flex-grow: 1; /* This makes the ul take up all available space */
      }

      .navbar-brand {
        margin-right: auto; /* Push the image to the left corner */
      }

      .btn {
        margin-left: auto; /* Push the button to the right corner */
        background-color: green;
        color: whitesmoke;
        border: none;
      }
      .container >*{
        margin-top: 5rem;
        padding: 3rem;
        border: 5px solid green;
        border-radius: 5px 45px 5px;
        
      }
      .container1{
      margin-top: 5rem;
        padding: 3rem;
        border:5px black;
        border-radius: 5px 45px 5px;
     	background-color:green;
     	
     	
      }
      form {
        border: none;
        border-radius: 15px;
        box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
        padding: 2rem;
      }
      .form-control {
        background: transparent;
        border: 2px solid green;
        
      
      }
    </style>
</head>
<body>

       
<div class="container">
    <%
    List<Register> lst = null;
    Register reg=null;
    lst = (List<Register>) session.getAttribute("data");
    reg=lst.get(0);
    if (lst != null && !lst.isEmpty()) {
    %>
        
        <h1 class="container1">Records</h1>
        
        
        <table>
            <tr>
                <th>Register Number</th>
                <th>Customer Name</th>
                <th>Username</th>
                <th>Password</th>
                <th>Account Balance</th>
            </tr>
            <%
            for (Register lstn : lst) {
            %>
                <tr>
                    <td><%= lstn.getRegno() %></td>
                    <td><%= lstn.getCustname() %></td>
                    <td><%= lstn.getAccbal() %></td>
                    <td><%= lstn.getUsername() %></td>
                </tr>
            <%
            }
            %>
        </table>
    <%
    } else {
    %>
        <h2>No data found in the session.</h2>
    <%
    }
    %>
</div>


</body>
</html>
      
      
      
    
<button onclick="history.back()" class="btn" id="backButtton">
      <span style="background: transparent">&larrhk;</span><br>Go Back
    </button>
</body>
</html>
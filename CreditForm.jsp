<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Credit Amount</h1>
    <form action="CreditController" method="GET">
        <label for="regno">Account Number:</label>
        <input type="text" id="regno" name="regno" required><br><br>
        
        <label for="credit">Credit Amount:</label>
        <input type="text" id="credit" name="credit" required><br><br>
        
        <input type="submit" value="Credit Amount">
    </form>

</body>
</html>
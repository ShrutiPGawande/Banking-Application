<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
        background: linear-gradient(
          90deg,
          rgba(2, 0, 36, 1) 0%,
          rgba(23, 136, 59, 0.47111344537815125) 0%,
          rgba(0, 212, 255, 0) 95%
        );
      }
        #container {
        display: grid;
        align-items: center; 
        grid-template-columns: 1fr 1fr 1fr;
        column-gap: 5px;
        }

        #image {
        max-width: 100%;
        max-height:100%;
        }

        #text {
        font-size: 30px;
        }
        .container {
        display: grid;
        grid-template-columns: 1fr 1fr;

        padding: 2rem;
        border-radius: 15px;
      }
      .btn-primary {
        background-color: green;
        border: none;
        width: 100%;
      }
      .container > * {
        display: flex;
        justify-content: center;
        align-items: center;
        border: 5px solid green;
        border-radius: 5px 45px 5px;
        background-color: rgb(244, 244, 244);
      }
      .form-check {
        float: right;
      }
      .form-check a {
        text-decoration: none;
        color: grey;
      }
      .logInpart {
        width: 100%;
        background: transparent;
      }
      form {
        padding: 1rem;
        width: 100%;
        background: transparent;
      }
      .form-control {
        background: transparent;
        border: 1px solid green;
      }
      form input {
        background: transparent;
      }
      .imagePart {
        overflow: hidden;
        transform: translateY(70px);
      }
      .imagePart img {
        width: 100%;
        object-fit: contain;
      }
      #backButtton {
        transform: translateY(45px);
        background-color: green;
        color: white;
      }
        
    </style>
</head>
<body>
    <div class="logo">
    	<img
          src="https://github.com/RutvalThonge/BankingWebLinkCode/blob/main/BankingProjectFolder/Images/bankLogo.png?raw=true" width="3" height="3" alt="Bank Logo"
          alt=""
          class="navbar-brand"
          href="#"
          style="height: 60px; width: 60px"
        />
    </div>
    <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="LoginView.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="RegisterView.jsp">Create</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="RetrieveView.jsp">Retrieve</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="UpdateView.jsp">Update</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="DeleteView.jsp">Delete</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="DisplayAllController">Display</a>
            </li>
            
          </ul>
        </div>
    <div id="container">
        <div id="image">
            <img src="https://raw.githubusercontent.com/RutvalThonge/BankingWebLinkCode/main/BankingProjectFolder/Images/bankHomeImage.png" />
        </div>
        <div id="text">
          <h2>Digital banking Made for</h2>
          <h1>Digital User's</h1>
        </div>
      </div>
      <div class="container">
        <div class="logInpart">
          <form action="LoginController">
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label" name="username"
                >Username</label
              >
              <input
                type="text"
                class="form-control"
                id="username"
                name="username"
                aria-describedby="emailHelp"
              />
              <br>
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label" name="password"
                >Password</label
              >
              <input
                type="password"
                class="form-control"
                id="password"
                name="password"
              />
            </div>
            <div class="mb-3 form-check">
              <a href="RegisterView.jsp">Open Bank Account</a>
            </div>
            <button type="submit" class="btn btn-primary" value="Login">Log In</button>
          </form>
        </div>
        
      </div>
</body>
</html>
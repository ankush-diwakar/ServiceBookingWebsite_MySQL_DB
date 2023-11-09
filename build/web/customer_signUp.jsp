<%-- 
    Document   : customer_signUp
    Created on : Oct 23, 2023, 4:32:01 PM
    Author     : Satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
 
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            /* background: rgb(130, 106, 251); */
            background-color: #c0d6df;
        }

        .container {
            position: relative;
            max-width: 700px;
            width: 100%;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .container header {
            font-size: 1.5rem;
            color: #333;
            font-weight: 500;
            text-transform: uppercase;
            text-align: center;
        }

        .container .form {
            margin-top: 30px;
        }

        .form .input-box {
            width: 100%;
            margin-top: 20px;
        }

        .input-box label {
            color: #333;
        }

        .form :where(.input-box input, .select-box) {
            position: relative;
            height: 50px;
            width: 100%;
            outline: none;
            font-size: 1rem;
            color: #707070;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 0 15px;
        }

        .input-box input:focus {
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }

        .form .column {
            display: flex;
            column-gap: 15px;
        }

        .form .gender-box {
            margin-top: 20px;
        }

        .gender-box h3 {
            color: #333;
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 8px;
        }

        .form :where(.gender-option, .gender) {
            display: flex;
            align-items: center;
            column-gap: 50px;
            flex-wrap: wrap;
        }

        .form .gender {
            column-gap: 5px;
        }

        .gender input {
            accent-color: rgb(130, 106, 251);
        }

        .form :where(.gender input, .gender label) {
            cursor: pointer;
        }

        .gender label {
            color: #707070;
        }

        .address :where(input, .select-box) {
            margin-top: 15px;
        }

        .select-box select {
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            color: #707070;
            font-size: 1rem;
        }

        .form .lastbutton {
            height: 55px;
            width: 100%;
            color: #000000;
            font-size: 1rem;
            box-shadow: 5px 5px 0px #000;
            font-weight: 600;
            margin-top: 30px;
            text-transform: uppercase;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            background: #c0d6df;
            transition: all ease 0.5s;
        }

        .lastbutton:active {
            scale: 0.9;
        }

        .form .lastbutton:hover {
            background: #c0d6df;
            box-shadow: 5px 5px 0px #fe5f55;
        }

        /*Responsive*/
        @media screen and (max-width: 500px) {
            .form .column {
                flex-wrap: wrap;
            }

            .form :where(.gender-option, .gender) {
                row-gap: 15px;
            }
        }
    </style>
</head>

<body>
    <section class="container">
        <header>customer Registration</header>

        
        <form action="Customersignup" method="post" enctype="multipart/form-data" class="form">
            <div class="input-box">
                <label>Full Name</label>
                <input type="text" name="fname" placeholder="Enter full name" required />
            </div>

            <div class="input-box">
                <label>Email Address</label>
                <input type="text" name="email" placeholder="Enter email address" required />
            </div>
            
              <div class="input-box">
                <label>Your Password</label>
                <input type="password" name="pass" placeholder="Enter Your Password" required />
            </div>
            
            <div class="column">
                <div class="input-box">
                    <label>Phone Number</label>
                    <input type="number" name="phone" placeholder="Enter phone number" required />
                </div>
               
            </div>

            <div class="column">
                <div class="input-box">
                    <label>Upload your photo</label>
                    <input name="image" type="file" required />
                </div>
               
            </div>

            <div class="gender-box">
                <h3>Gender</h3>
                <div class="gender-option">
                    <div class="gender">
                        <input type="radio" name="radioGroup" value="Male" id="check-male" checked />
                        <label for="check-male">male</label>
                    </div>
                    <div class="gender">
                        <input type="radio" value="Female" name="radioGroup" id="check-female" />
                        <label for="check-female">Female</label>
                    </div>
                </div>
            </div>

            <div class="input-box address">
                <label>Address</label>
                <input type="text" name="addr" placeholder="Enter your address" required />

                <div class="column">

                    <div class="select-box">
                        <select name="country">
                            <option hidden>Country</option>
                            <option value="America">America</option>
                            <option value="Japan">Japan</option>
                            <option value="India">India</option>
                            <option value="Nepal">Nepal</option>
                        </select>
                    </div>

                    <input type="text" name="city" placeholder="Enter your city" required />
                </div>
            </div>
            <input class="lastbutton" type="submit" value="submit">

        </form>

    </section>
</body>

</html>
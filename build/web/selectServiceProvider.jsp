
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ankush.reuse" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Selection of service provider</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Montserrat:wght@700&display=swap");

            :root {
                /* Colors */
                --brand-color: hsl(46, 100%, 50%);
                --black: hsl(0, 0%, 0%);
                --white: hsl(0, 0%, 100%);
                /* Fonts */
                --font-title: "Montserrat", sans-serif;
                --font-text: "Lato", sans-serif;
            }

            .header {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 10px 0;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
            }

            .menu {
                margin-left: 20px;
                font-size: 18px;
            }

            /* RESET */

            /* Box sizing rules */
            *,
            *::before,
            *::after {
                box-sizing: border-box;
            }

            /* Remove default margin */
            body,
            h2,
            p {
                margin: 0;
            }
            #headflex{
                display: flex;
                font-family: var(--font-title);
                justify-content: center;
            }
            #connn{
                display: flex;
                justify-content: center;
            }
            /* GLOBAL STYLES */
            body {

                margin: 10px;
                place-items: center;
                height: 100vh;
            }

            h2 {
                font-size: 2.25rem;
                font-family: var(--font-title);
                color: var(--white);
                line-height: 1.1;
            }

            p {
                font-family: var(--font-text);
                font-size: 1rem;
                line-height: 1.5;
                color: var(--white);
            }

            .flow>*+* {
                margin-top: var(--flow-space, 1em);
            }

            /* CARD COMPONENT */

            .card {
                display: grid;
                place-items: center;
                margin: 15px;
                width: 80vw;
                max-width: 21.875rem;
                height: 28.125rem;
                overflow: hidden;
                border-radius: 0.625rem;
                box-shadow: 0.25rem 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
            }

            .card>* {
                grid-column: 1 / 2;
                grid-row: 1 / 2;
            }

            .card__background {
                object-fit: cover;
                max-width: 100%;
                height: 100%;
            }

            .card__content {
                --flow-space: 0.9375rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                align-self: flex-end;
                height: 55%;
                padding: 12% 1.25rem 1.875rem;
                background: linear-gradient(180deg,
                    hsla(0, 0%, 0%, 0) 0%,
                    hsla(0, 0%, 0%, 0.3) 10%,
                    hsl(0, 0%, 0%) 100%);
            }

            .card__content--container {
                --flow-space: 1.25rem;
            }

            .card__title {
                position: relative;
                width: fit-content;
                width: -moz-fit-content;
                /* Prefijo necesario para Firefox  */
            }

            .card__title::after {
                content: "";
                position: absolute;
                height: 0.3125rem;
                width: calc(100% + 1.25rem);
                bottom: calc((1.25rem - 0.5rem) * -1);
                left: -1.25rem;
                background-color: var(--brand-color);
            }

            .card__button {
                padding: 0.75em 1.6em;
                width: fit-content;
                width: -moz-fit-content;
                /* Prefijo necesario para Firefox  */
                font-variant: small-caps;
                font-weight: bold;
                border-radius: 0.45em;
                border: none;
                background-color: var(--brand-color);
                font-family: var(--font-title);
                font-size: 1.125rem;
                color: var(--black);
            }

            .card__button:focus {
                outline: 2px solid black;
                outline-offset: -5px;
            }

            @media (any-hover: hover) and (any-pointer: fine) {
                .card__content {
                    transform: translateY(62%);
                    transition: transform 500ms ease-out;
                    transition-delay: 500ms;
                }

                .card__title::after {
                    opacity: 0;
                    transform: scaleX(0);
                    transition: opacity 1000ms ease-in, transform 500ms ease-out;
                    transition-delay: 500ms;
                    transform-origin: right;
                }

                .card__background {
                    transition: transform 500ms ease-in;
                }

                .card__content--container> :not(.card__title),
                .card__button {
                    opacity: 0;
                    transition: transform 500ms ease-out, opacity 500ms ease-out;
                }

                .card:hover,
                .card:focus-within {
                    transform: scale(1.05);
                    transition: transform 500ms ease-in;
                }

                .card:hover .card__content,
                .card:focus-within .card__content {
                    transform: translateY(0);
                    transition: transform 500ms ease-in;
                }

                .card:focus-within .card__content {
                    transition-duration: 0ms;
                }

                .card:hover .card__background,
                .card:focus-within .card__background {
                    transform: scale(1.3);
                }

                .card:hover .card__content--container> :not(.card__title),
                .card:hover .card__button,
                .card:focus-within .card__content--container> :not(.card__title),
                .card:focus-within .card__button {
                    opacity: 1;
                    transition: opacity 500ms ease-in;
                    transition-delay: 1000ms;
                }

                .card:hover .card__title::after,
                .card:focus-within .card__title::after {
                    opacity: 1;
                    transform: scaleX(1);
                    transform-origin: left;
                    transition: opacity 500ms ease-in, transform 500ms ease-in;
                    transition-delay: 500ms;
                }
            }
        </style>
    </head>
    <body>
        <div id="headflex">
            <h1>please select active service provider for your service</h1>
        </div>
        <%

            String status = "active";
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbanseva", "root", "root");

                String query = "SELECT * FROM service_providers WHERE s_status=?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, status);
                ResultSet resultSet = pstmt.executeQuery();
                int i = 0;
                while (resultSet.next()) {
                    String uploadPath = "/resources/img/";
                    String imgName = resultSet.getString("profile_pic_name");
                    String finalsrc = uploadPath + imgName;
                    String desc = resultSet.getString("s_category") + " || Experienced service provider offering exceptional care and expertise.";

                    i = i + 1;

        %>
        <article class="card" id="art<%= i%>">
            <img class="card__background" src="<%=finalsrc%>"
                 alt="service provider photo" width="1920" height="2193" />
            <div class="card__content | flow">
                <div class="card__content--container | flow">
                    <h2 class="card__title nm"><%= resultSet.getString("s_fname")%></h2>
                    <p class="card__description"><%= desc%></p>

                </div>
                <button onClick="setAttr()" class="card__button">select</button>
            </div>
        </article>
        <%

                }
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>

        <div id="connn">



        </div>

    </body>
    <script>
        var counter=0;
        var ids = null;
        function setAttr() {
            
            var ids="art"+counter;
            alert(ids);
            counter++;
               document.getElementById(ids).addEventListener("click", function() {
            window.location.href = "salonWomenPage.html";
        });
               
        }
       alert(ids)
      document.getElementById(ids).addEventListener("click", function() {
            window.location.href = "salonWomenPage.html";
        });
    </script>

</html>

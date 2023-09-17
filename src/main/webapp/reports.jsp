
<%@page import="java.sql.*"%>
    <%@ include file="Dbconnection.jsp" %>
        <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate" ); %>
            <% response.setHeader("Pragma", "no-cache" ); %>
            
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pharmacy Management System || Reports</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


        <!-- local -->
        <link rel="stylesheet" href="dashboard.css">
        <style>
            .pre_loader {
                position: fixed;
                top: 0%;
                left: 0%;
                width: 100%;
                height: 100%;
                z-index: 10;
                background-color: var(--black);
            }

            .loading {
                position: absolute;
                left: 50%;
                top: 50%;
                height: 100px;
                width: 100px;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>

    <% session=request.getSession(false); if(session==null){ response.sendRedirect("login.jsp"); } else {
                    String username=(String) session.getAttribute("username"); String fname=(String)
                    session.getAttribute("fname"); String lname=(String) session.getAttribute("lname"); int
                    user=(Integer) session.getAttribute("user_id"); if(username !=null && !username.isEmpty()){
                    Connection connection=null; PreparedStatement preparedStatement=null; ResultSet resultSet=null; try{
                    connection=(Connection) application.getAttribute("dbConnection"); if(connection !=null){ %>

    
    <body>
        <div class="pre_loader">
            <div class="loading">
                <div class="loader"></div>
            </div>
        </div>
        <div class="dashboard_grid_container">
            <div class="dash_grid_items">
                <div class="row" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                    <%@include file="sidebar.html" %>
                </div>
            </div>
            <div class="dash_grid_items">
                <%@include file="topbar.jsp" %>
                
                <div class=" container ">
                    <div class=" common-grid " style=" --grid-template:auto auto auto auto auto auto">
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Product Name</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Brand Name</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Quantity</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Sold At</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Sold By</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Date Added</span></h5>
                            </div>
                        </div>
<!--                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Actions</span></h5>
                            </div>
                        </div>-->



            <% String select_query="SELECT * FROM sales" ; Statement
                                            statement = connection.createStatement() ;
                                            resultSet = statement.executeQuery(select_query); 
                                           while(resultSet.next()){ 
                                           int product_id = resultSet.getInt("product_id"); 
                                            String product = resultSet.getString("product_name"); 
                                           String brand = resultSet.getString("brand_name"); 
                                           int quantity = resultSet.getInt("quantity"); 
                     
                                           int selling = resultSet.getInt("price_sold"); 
                                           
                                           String date_sold = resultSet.getString("date_sold"); 
                                            
                                           int user_id = resultSet.getInt("sold_by"); 
                                           String user_name=null; String

                                           selectUserQuery = "SELECT firstname, lastname FROM users WHERE id=?" ;

                                           preparedStatement = connection.prepareStatement(selectUserQuery);
                                           preparedStatement.setInt(1, user_id); 
                                           ResultSet userResult = preparedStatement.executeQuery(); if (userResult.next()) {
                                           user_name = userResult.getString("firstname") + " " +
                                           userResult.getString("lastname"); } %>

                                            <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= product %>
                                                        </span></h5>
                                                </div>
                                            </div>
                                            <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= brand %>
                                                        </span></h5>
                                                </div>
                                            </div>
                                                <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= quantity %>
                                                        </span></h5>
                                                </div>
                                            </div>
                                            <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= selling %>
                                                        </span></h5>
                                                </div>
                                            </div>
                                            

                                            <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= user_name %>
                                                        </span></h5>
                                                </div>
                                            </div>


                                            <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            <%= date_sold %>
                                                        </span></h5>
                                                </div>
                                            </div>
<!--                                                        <div class="grid-item h " style="padding-left: 10px;padding-right: 10px; ">
                                                <div class="title ">
                                                    <h5><span>
                                                            Action
                                                        </span></h5>
                                                </div>
                                            </div>-->
                                           

                                                            <%
                                                                }
%>
                        
                       


                    </div>
                </div>
                
            </div>

            <div class="update_box" style="display: none;">
                <div class="update" style="padding: 2px;">
                    <div class="cancel">
                        <button><i class="bi bi-x-lg"></i></button>
                    </div>
                    <div class="container">
                        <input type="text" placeholder="Product Name" name="ProductName"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Brand Name" name="BrandName"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Product Quantity" name="Quantity"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Item Unit " name="Unit"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Valid Until " name="expire"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Selling Price " name="selling"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>
                        <input type="text" placeholder="Buying Price " name="buying"
                            style="margin-top: 5px;margin-bottom: 5px;">
                        <div class=""></div>

                        <div class="button">
                            <button id="bottonGet">Complete</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Selling -->
            <div class="selling_box" style="display: none;">
                <div class="selling">
                    <div class="cancel">
                        <button><i class="bi bi-x-lg"></i></button>
                    </div>
                    <div class="title" style="
margin-top: 20px;
">
                        <h4 style="font-weight: 100;">Selling Product</h4>
                    </div>
                    <div class="container">
                        <input type="text" placeholder="Product Name" name="ProductName">
                        <div class=""></div>
                        <input type="text" placeholder="Brand Name" name="BrandName">
                        <div class=""></div>
                        <input type="text" placeholder="Product Quantity" name="Quantity">
                        <div class=""></div>
                        <input type="text" placeholder="Item Unit " name="Unit">
                        <div class=""></div>
                        <input type="text" placeholder="Selling Price " name="selling">
                        <div class=""></div>
                        <input type="text" placeholder="Buying Price " name="buying">
                        <div class=""></div>

                        <div class="button">
                            <button id="bottonGet">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js "></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js "
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm "
            crossorigin="anonymous "></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js "></script>
        <script>
            AOS.init({
                duration: 1500
            });
            jQuery.noConflict();
            setTimeout(() => {
                jQuery(".pre_loader ").fadeOut({
                    duration: 500,
                    easing: 'linear'
                });
            }, 2000);
            jQuery(".update .cancel button").on("click", () => {
                jQuery(".update_box").fadeOut({
                    duration: 500,
                    easing: 'linear',
                    done: function () {
                        console.log("UPDATE CANCELED!");
                    }
                })
            });
            jQuery(".update_open").on("click", () => {
                jQuery(".update_box").addClass("animate__animated animate_fadeInUp");
                jQuery(".update_box").fadeIn({
                    duration: 500,
                    easing: 'linear',
                    done: function () {
                        console.log("UPDATE CANCELED!");
                    }
                });
            });

            jQuery(".selling .cancel button").on("click", () => {
                jQuery(".selling_box").fadeOut({
                    duration: 500,
                    easing: 'linear',
                    done: function () {
                        console.log("UPDATE CANCELED!");
                    }
                })
            });
            jQuery(".selling_open").on("click", () => {
                jQuery(".selling_box").addClass("animate__animated animate_fadeInUp");
                jQuery(".selling_box").fadeIn({
                    duration: 500,
                    easing: 'linear',
                    done: function () {
                        console.log("SELL CANCELED!");
                    }
                });
            });
        </script>
    </body>
    
    <% } } catch(Exception e){ out.println("<p> Error : " + e.getMessage() + " </p>");
                        }
                        }
                        else {
                        response.sendRedirect("login.jsp");
                        }
                        }


                        %>

    </html>
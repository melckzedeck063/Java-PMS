<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pharmacy Management System || Sales</title>
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
                <div class="grid_template_for_two">
                    <div class="box_full_template_grid " style="--width:100%;--h:250px;" data-aos="fade-right"
                        data-aos-duration="1000" data-aos-delay="3000" id="sales">
                        <div class="number">
                            <div class="title text-center mt-5">
                                <div class="loader"></div>
                            </div>
                        </div>
                    </div>
                    <div class="box_full_template_grid " style="--width:100%;--h:250px;" id="donutchart"
                        data-aos="fade-left" data-aos-duration="1000" data-aos-delay="3000">
                        <div class="number">
                            <div class="title text-center mt-5">
                                <h1>SALES</h1>
                                <div class="loader"></div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--  data-aos="fade-up" -->
                <div class=" container ">
                    <div class=" common-grid " style=" --grid-template:auto auto auto auto auto auto auto ">
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
                                <h5><span>Unit</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Added By</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Date Added</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item " style=" background-color: var(--shadow);padding-left: 10px;padding-right:
                    10px; ">
                            <div class=" title ">
                                <h5><span>Actions</span></h5>
                            </div>
                        </div>




                        
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>Panadol Amoxiline</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>RetexBriller</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>30 gm</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>12 pkg</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>Paulo Michael</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class=" title ">
                                <h5><span>13 june 2023</span></h5>
                            </div>
                        </div>
                        <div class=" grid-item h " style=" padding-left: 10px;padding-right: 10px; ">
                            <div class="title">
                                <i class="bi bi-trash3-fill" style="color:red;padding: 8px;box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.11);margin: 3px;
    border-radius: 10px;"></i>
                                <i class="bi bi-pen update_open" style="box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.11);padding: 8px;margin: 3px;
    border-radius: 10px;"></i>
                                <i class="bi bi-coin selling_open" style="color: rgb(216, 130, 0);padding: 8px;box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.11);margin: 3px;
    border-radius: 10px;"></i>
                            </div>
                        </div>




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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
            google.charts.load("current", {
                packages: ["corechart"]
            });
            google.charts.setOnLoadCallback(drawChart);
            var total

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Available Doses', 'Hours per Day'],
                    ['Employeed', 11],
                    ['Expired', 2],
                    ['Sold', 2],
                    ['Buy', 2]
                ]);

                var options = {
                    title: 'GENERAL ACTIVITIES',
                    pieHole: 0.3,
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
                google.charts.setOnLoadCallback(drawChart2);

                function drawChart2() {
                    var data = google.visualization.arrayToDataTable([
                        ['Year', 'Sales', 'Expenses'],
                        ['2013', 1000, 400],
                        ['2014', 1170, 460],
                        ['2015', 660, 1120],
                        ['2016', 1030, 540]
                    ]);

                    var options = {
                        title: 'Company Performance',
                        hAxis: { title: 'Year', titleTextStyle: { color: '#333' } },
                        vAxis: { minValue: 0 }
                    };

                    var chart = new google.visualization.AreaChart(document.getElementById('sales'));
                    chart.draw(data, options);
                }
            }
        </script>
    </body>

    </html>
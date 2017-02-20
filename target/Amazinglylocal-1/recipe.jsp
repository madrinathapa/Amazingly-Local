<!DOCTYPE html>
<%@page import="com.iu.amazelocal.db.RecipeViewCrud"%>
<%@page import="com.iu.amazelocal.models.Recipe"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ListIterator"%>
<%@page import="com.iu.amazelocal.db.ProductTypeCrud"%>




<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        Amazingly Local!
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <link href="css/img-size.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet">

    <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">



</head>

<body>

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
    <div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer of the day</a>  <a href="#">Get flat 35% off on orders over $50!</a>
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
                 	<% if(session.getAttribute("sessionExists")!=null) {%>
                 	
                 	 <li> Welcome <%=session.getAttribute("userName")%><form action="logout" method="get">
                    <input type="submit" value="Logout"></form> </li>
                 	<%}
						else { %>
                    <li ><a href="loginlanding.html"  >Login</a>
                    </li>
                    <li ><a href="register.html">Register</a>
                    </li>
                    <li ><a href="contact.html">Contact</a>
                    </li>
                    <% }  %>
                    
                   
                </ul>
            </div>
        </div>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">Customer login</h4>
                    </div>
                    <div class="modal-body">
                        <form action="customer-orders.html" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="email-modal" placeholder="email">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password-modal" placeholder="password">
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                            </p>

                        </form>

                        <p class="text-center text-muted">Not registered yet?</p>
                        <p class="text-center text-muted"><a href="register.html"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="index.jsp" data-animate-hover="bounce">
                    <img src="img/al_logo.png" alt="Obaju logo" class="lg">
                    <img src="img/logo-small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="basket.html">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">3 items in cart</span>
                    </a>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="index.jsp">Home</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"> Shop <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                <% ProductTypeCrud menuType=new ProductTypeCrud();
                                	HashMap<String,ArrayList<String>> map = menuType.fetchProductTypeMap();
                                for (Map.Entry<String, ArrayList<String>> entry : map.entrySet()) {
                                	String productType=entry.getKey();
                                	ArrayList<String> productSubTypeList=entry.getValue();%>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h5><%=productType %></h5>
											  <ul>
                                            <% for(String productSubType:productSubTypeList){ %>
                                                <li><a href="category?subtype=<%=productSubType%>"><%=productSubType %> </a>
                                                </li>
                                               <%} %>
                                            </ul>
                                        </div>
                                        <%} %>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                     <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"> Recipes <b class="caret"></b></a>
                        <ul class="dropdown-menu" >
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <ul>
                                                <li><a href="ViewRecipes.html">View Recipes</a>
                                                </li>
											<% if(session.getAttribute("userType")!=null){
													if(session.getAttribute("userType").equals("V")) { %>
                                                <li><a href="AddRecipe.jsp">Add Recipes</a>
                                                </li>
                                                <% } } %>
                                                </ul>
                                                </div>
                                                </div>
                                                </div>
                                                </li>
                                                </ul>
                                                </li>
                 <% if(session.getAttribute("userType")!=null) {
                		if((Boolean)session.getAttribute("sessionExists")) { %>             
                <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"> 
                       <% if(session.getAttribute("userType").equals("V")) { %>
                        Vendor
                        <% } else if(session.getAttribute("userType").equals("A")){  %>
						Admin
						<% } else { %>
                        User
                        <% } %> 
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu" >
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <ul>
                                            <% if(session.getAttribute("userType").equals("V")) { %>
                                            <li><a href="AddProduct.jsp">Add Product</a>
                                                </li>
                                             <li><a href="Inventory.jsp">View Inventory</a>
                                                </li>
                                                <li><a href="changepass.html">Change Password</a>
                                                </li>
                                                <li><a href="logout">Logout</a>
                                                </li>
                                             <% }
												else if(session.getAttribute("userType").equals("C")){ %>
                                                <li><a href="changepass.html">Change Password</a>
                                                </li>
                                                <li><a href="logout">Logout</a>
                                                </li>
												<% }
												else if(session.getAttribute("userType").equals("A")){ %>
												<li><a href="Inventory.jsp">View Inventory</a>
                                                </li>
                                                <li><a href="changepass.html">Change Password</a>
                                                </li>
                                                <li><a href="vendorreport.jsp">Vendor Sales Report</a>
                                                </li>
                                                <li><a href="vendorstats.jsp">Vendor Revenue Report</a>
                                                </li>
                                                <li><a href="viewvendorlist.jsp">View List of Vendors</a>
                                                </li>
                                                <li><a href="viewuserlist.jsp">View List of Buyer</a>
                                                </li>
                                                <li><a href="userreport.jsp">View Buyer Report</a>
                                                </li>
                                                <li><a href="logout">Logout</a>
                                                </li>
												<% } %>
                                                </ul>
                                                </div>
                                                </div>
                                                </div>
                                                </li>
                                                </ul>
                                                </li>
                                                <% } } %>
                 <!-- <li th:unless="${session.sessionExists} == true"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                    </li>
						<li th:case="V"> 
						<a href="AddRecipe.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Recipe 
						</a></li>
						<li th:case="C"> 
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Recipe 
						</a></li>

                    <li >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Farmers </b></a>
                       
                    </li> -->
                </ul>

            </div>
            <!--/.nav-collapse -->

<!-- COPY FOR SEARCH BAR FROM HERE -->
            <div class="navbar-buttons">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="basket.html" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">3 items in cart</span></a>
                </div>
                <!--/.nav-collapse -->

                 <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <!-- <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>  -->
                </div>

            </div>

            <div class="clearfix collapse in" id="search">

                <form class="navbar-form" role="search" action="search" method="post">
                    <div class="row">
                    <select name="criteria" id="criteria" class="form-control">
   								<option value="All" selected="selected">All Departments</option>
								<option value="VEGETABLES" selected="selected">Vegetables</option>
								<option value="FRUITS">Fruits</option>
								<option value="DAIRY">Dairy</option>
								<option value="MEAT">Meat</option>
								
								
							</select>
                        <input type="text" class="form-control" placeholder="Search"  name="searchStr" id="searchStr">
                        <span>

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                    </div>
                </form>

            </div>
            <!-- COPY FOR SEARCH BAR TILL HERE -->

            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->


    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>No Recipe</li>
                    </ul>

                    <div class="box">
                        <h1>Recipes</h1>
                        <p>You can't just eat good food. You've got to talk about it too.
                         - Kurt Vonnegut
                        </p>
					<% RecipeViewCrud vrec=new RecipeViewCrud();
						ArrayList<Recipe> recList=new ArrayList<Recipe>();
						recList=vrec.viewRecipe();  
                  		if(recList.size()<4){ %>
                  	<div class="row products">
						 <% for(int i=0;i<recList.size();i++) {
						long id=recList.get(i).getRecipeId();
						String name=recList.get(i).getRecipeName();
						String ingredients=recList.get(i).getIngredients();
						String instructions=recList.get(i).getInstructions();
						String image=recList.get(i).getRecipeImage();
						String descriptions=recList.get(i).getDescription(); %>
					
                        <div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="viewrecipe?RecipeId=<%=id%>">
                                                <img src="<%=image%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="viewrecipe?RecipeId=<%=id%>">
                                                <img src="<%=image%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="viewrecipe?RecipeId=<%=id%>">
                                    <img src="<%=image%>"  alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="viewrecipe?RecipeId=<%=id%>"><%= name%></a></h3>
                                    <p class="buttons">
                                        <a href="viewrecipe?RecipeId=<%=id%>" class="btn btn-default">View detail</a>
                                    </p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
                       <% }%> 
					</div>
					<!-- /.product -->
                    <% } else { int count=0; %>
                    <div class="row products">
                    <% ListIterator<Recipe> rit=recList.listIterator();
                    while(rit.hasNext())
                    	{
                    	count++;
           				Recipe it=rit.next();
           				long id=it.getRecipeId();
           				System.out.println("RECIDE ID IS AS FOLLOWS:"+id);
                    	String name=it.getRecipeName();
						String ingredients=it.getIngredients();
						String instructions=it.getInstructions();
						String image=it.getRecipeImage();
						String descriptions=it.getDescription();
						
                    	%>
                    	<div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="viewrecipe?RecipeId=<%=id%>">
                                                <img src="<%=image%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="viewrecipe?RecipeId=<%=id%>">
                                                <img src="<%=image%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="viewrecipe?RecipeId=<%=id%>" class="invisible">
                                    <img src="<%=image%>"  alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="viewrecipe?RecipeId=<%=id%>"><%=name%></a></h3>
                                    <p class="buttons">
                                        <a href="viewrecipe?RecipeId=<%=id%>" class="btn btn-default">View detail</a>
                                    </p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
                    	<% 
                    	if ((count==4) && (rit.hasNext()))
                    	{ 
                    	%>
                    	</div>
                    	<div class="row products">
                    	<% Recipe it1=rit.next();
                    	long id1=it1.getRecipeId();
                    	System.out.println("RECIDE ID IS AS FOLLOWS:"+id1);
                    	String name1=it1.getRecipeName();
						String ingredients1=it1.getIngredients();
						String instructions1=it1.getInstructions();
						String image1=it1.getRecipeImage();
						String descriptions1=it1.getDescription();%>
                    	<div class="col-md-3 col-sm-4">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="viewrecipe?RecipeId=<%=id1%>">
                                                <img src="<%=image1%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="viewrecipe?RecipeId=<%=id1%>">
                                                <img src="<%=image1%>" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="viewrecipe?RecipeId=<%=id1%>" class="invisible">
                                    <img src="<%=image1%>"  alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="viewrecipe?RecipeId=<%=id1%>"><%=name1%></a></h3>
                                    <p class="buttons">
                                        <a href="viewrecipe?RecipeId=<%=id1%>" class="btn btn-default">View detail</a>
                                    </p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
                        <% count=0; %>
                    	
                   <%  }}} %>

                </div>
                <!-- /.col-md-9 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

</div>
          <!-- *** FOOTER ***
 _________________________________________________________ -->
        <div id="footer" data-animate="fadeInUp">
            <div class="container">
                <div class="row">
                <div class="col-md-1">
                      </div>
                    <div class="col-md-3">
                        <h4>Pages</h4>

                        <ul>
                            <li><a href="text.html">About us</a>
                            </li>
                            <li><a href="text.html">Terms and conditions</a>
                            </li>
                            <li><a href="faq.html">FAQ</a>
                            </li>
                            <li><a href="contact.html">Contact us</a>
                            </li>
                        </ul>

                        </div>
                        <div class="col-md-1">
                      </div>
						<div class="col-md-3">
                        <h4>User section</h4>

                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                            </li>
                            <li><a href="register.html">Register</a>
                            </li>
                        </ul>

                        <hr class="hidden-md hidden-lg hidden-sm">

                    </div>
                    <!-- /.col-md-3 -->

                    
					<div class="col-md-1">
                      </div>
                    <div class="col-md-3">

                        <h4>Where to find us</h4>

                        <p><strong>Amazingly local</strong>
                            <br>107 S Indiana Ave
                            <br>Bloomington
                            <br>IN 47405
                            <br>
                            <strong>USA</strong>
                        </p>

                        <a href="contact.html">Go to contact page</a>

                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->



                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#footer -->

        <!-- /#footer -->

        <!-- *** FOOTER END *** -->




        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
        <div id="copyright">
            <div class="container">
                <div class="col-md-6">
                    <p class="pull-left">� 2015 al</p>

                </div>
                <div class="col-md-6">
                    <p class="pull-right">AmazinglyLocal at <a href="https://bootstrapious.com/e-commerce-templates">amLocal@al.com</a>
                         <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                    </p>
                </div>
            </div>
        </div>
        <!-- *** COPYRIGHT END *** -->



    </div>
    <!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>






</body>

</html>
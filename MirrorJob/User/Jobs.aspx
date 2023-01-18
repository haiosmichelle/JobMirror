<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="MirrorJob.User.Jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/us.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Obține Jobul dorit</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <!-- Job List Area Start -->
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <div class="ion"> <svg 
                                        xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                        width="20px" height="12px">
                                    <path fill-rule="evenodd"  fill="rgb(27, 207, 107)"
                                        d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"/>
                                    </svg>
                                    </div>
                                    <h4>Filtru Joburi</h4>
                                </div>
                            </div>
                        </div>
                        <!-- Job Category Listing start -->
                        <div class="job-category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                              <%-- <div class="small-section-tittle2">
                                     <h4>Categorie Job</h4>
                               </div>
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <select name="select">
                                        <option value="">Toate Categoriile</option>
                                        <option value="">Categoria 1</option>
                                        <option value="">Categoria 2</option>
                                        <option value="">Categoria 3</option>
                                        <option value="">Categoria 4</option>
                                    </select>
                                </div>--%>
                                <!--  Select job items End-->
                                <!-- select-Categories start -->
                                <div class="select-Categories pt-25  pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Tip Job</h4>
                                    </div>
                                    <div class="checkbox checkbox-primary">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true"
                                            RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="styled"
                                            TextAlign="Right" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                            <asp:ListItem>Full Time</asp:ListItem>
                                            <asp:ListItem>Part Time</asp:ListItem>
                                            <asp:ListItem>Remote</asp:ListItem>
                                            <asp:ListItem>Freelance</asp:ListItem>
                                        </asp:CheckBoxList>
                                        </div>
                                    <%--<label class="container">Full Time
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Part Time
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Remote
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Freelance
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>--%>
                                </div>
                                <!-- select-Categories End -->
                            </div>
                            <!-- single two -->
                            <div class="single-listing">
                               <div class="small-section-tittle2  pb-10 ">
                                     <h4>Locatie Job</h4>
                               </div>
                                <!-- Select job items start -->
                                <div class="select-job-items2  pb-70 ">
                                    <asp:DropDownList ID="ddlCountry" runat="server" Font-Names="select" CssClass="form-control w-100"
                                        DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="CountryName"
                                        DataValueField="CountryName" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Value="0">Tara</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
                                    SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                                    <%--<select name="select">
                                        <option value="">Oriunde</option>
                                        <option value="">Categoria 1</option>
                                        <option value="">Categoria 2</option>
                                        <option value="">Categoria 3</option>
                                        <option value="">Categoria 4</option>
                                    </select>--%>
                                </div>
                                <!--  Select job items End-->
                                <!-- select-Categories start -->
                               <%-- <div class="select-Categories pt-80 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Experiență</h4>
                                    </div>
                                    <label class="container">1-2 ani
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">2-3 ani
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">3-6 ani
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">6- mai multi..
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>--%>
                                <!-- select-Categories End -->
                            </div>
                            <!-- single three -->
                            <div class="single-listing">
                                <!-- select-Categories start -->
                                <div class="select-Categories pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Postat în termen de</h4>
                                    </div>
                                   <%-- <div class="radiobuttoncontainer">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="radiobuttonlist" AutoPostBack="true"
                                            OnSelectIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                                            <asp:ListItem Value="0" Selected="True" >orice</asp:ListItem>
                                             <asp:ListItem Value="1" >Azi</asp:ListItem>
                                             <asp:ListItem Value="2" >Acum 2 zile</asp:ListItem>
                                             <asp:ListItem Value="3" >Acum 3 zile</asp:ListItem>
                                             <asp:ListItem Value="4" >Acum 5 zile</asp:ListItem>
                                             <asp:ListItem Value="5" >Acum 10 zile</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>--%>
                                    <%--<label class="container">Oricare
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Azi
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">În urmă cu 2 zile
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">În urmă cu 3 zile
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">În urmă cu 5 zile
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">În urmă cu 10 zile
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>--%>
                                </div>
                                <!-- select-Categories End -->
                            </div>
                            <div class="single-listing">
                                <!-- Range Slider Start -->
                                <%--<aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                                    <div class="small-section-tittle2">
                                        <h4>Filter Jobs</h4>
                                    </div>
                                    <div class="widgets_inner">
                                        <div class="range_item">
                                            <!-- <div id="slider-range"></div> -->
                                            <input type="text" class="js-range-slider" value="" />
                                            <div class="d-flex align-items-center">
                                                <div class="price_text">
                                                    <p>Price :</p>
                                                </div>
                                                <div class="price_value d-flex justify-content-center">
                                                    <input type="text" class="js-input-from" id="amount" readonly />
                                                    <span>to</span>
                                                    <input type="text" class="js-input-to" id="amount" readonly />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </aside>--%>
                               <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnFilter_Click" />
                              <!-- Range Slider End -->
                            </div>
                            <div class="pt-20 pb-20">
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnReset_Click" />
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- Count of Job list Start -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <asp:Label ID="lbljobCount" runat="server"></asp:Label>
                                            <!-- Select job items start -->
                                           <%-- <div class="select-job-items">
                                                <span>Sortate după</span>
                                                <select name="select">
                                                    <option value="">Nimic</option>
                                                    <option value="">Listă Job</option>
                                                    <option value="">Listă Job</option>
                                                    <option value="">Listă Job</option>
                                                </select>
                                            </div>--%>
                                            <!--  Select job items End-->
                                        </div>
                                    </div>
                                </div>
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                
                                <!-- Count of Job list End -->
                                <!-- single-job-content -->
                                <div class="single-job-items mb-30">
                                    <div class="job-items">
                                        <div class="company-img">
                                            <a herf="job_details.aspx?id=<%# Eval("JobId") %>">
                                                <img width="80" src="<%# GetImageUrl( Eval("CompanyImage")) %>" alt="" >
                                            </a>
                                        </div>
                                        <div class="job-tittle job-tittle2">
                                            <a href="job_details.aspx?id=<%# Eval("JobId") %>">
                                               <h5><%# Eval("Title") %></h5>
                                            </a>
                                            <ul>
                                                <li><%# Eval("CompanyName") %></li>
                                                <li><i class="fas fa-map-marker-alt"></i><%# Eval("Country") %></li>
                                                <li><%# Eval("Salary") %></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="items-link items-link2 f-right">
                                        <a href="job_details.aspx?id=<%# Eval("JobId") %>"><%# Eval("JobType") %></a>
                                        <span class="text-secondary">
                                            <i class="fas fa-clock pr-1"></i>
                                            <%# Eval("CreateDate")%>
                                        </span>
                                    </div>
                                </div>
                                </ItemTemplate>
                               </asp:DataList>
                                <!-- single-job-content -->
                            </div>
                        </section>
                        <!-- Featured_job_end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Job List Area End -->
        <!--Pagination Start  -->
       
        <!--Pagination End  -->       
    </main>
</asp:Content>

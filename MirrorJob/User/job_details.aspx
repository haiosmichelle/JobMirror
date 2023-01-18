<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="job_details.aspx.cs" Inherits="MirrorJob.User.job_details" %>
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
                            <h2><%# jobTitle %></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- Hero Area End -->
        <div>
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">

                    <ItemTemplate>
                         <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#"><img width="80" src="<%# GetImageUrl(Eval("CompanyImage")) %>" alt=""></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="#">
                                        <h4><%# Eval("Title") %></h4>
                                    </a>
                                    <ul>
                                        <li><%# Eval("CompanyName")%></li>
                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("Country") %></li>
                                        <li><%# Eval("Salary") %></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                          <!-- job single End -->
                       
                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Descrierea postului</h4>
                                </div>
                                <p><%# Eval("Description") %></p>
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Cunoștințe, abilități și abilități necesare</h4>
                                </div>
                               <ul>
                                   <li><%# Eval("Specialization") %></li>
                                  <%-- <li>Mobile Applicationin iOS/Android/Tizen or other platform</li>
                                   <li>Research and code , libraries, APIs and frameworks</li>
                                   <li>Strong knowledge on software development life cycle</li>
                                   <li>Strong problem solving and debugging skills</li>--%>
                               </ul>
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Educație + Experiență</h4>
                                </div>
                               <ul>
                                   <li><%# Eval("Qualification") %></li>
                                   <li><%# Eval("Experience") %></li>
                                <%--   <li>Ecommerce website design experience</li>
                                   <li>Familiarity with mobile and web apps preferred</li>
                                   <li>Experience using Invision a plus</li>--%>
                               </ul>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h4>Prezentare generală a postului</h4>
                           </div>
                          <ul>
                              <li>Data Postarii : <span><%# DataBinder.Eval(Container.DataItem, "CreateDate","{0:dd MM yyyy}") %></span></li>
                              <li>Locatie : <span><%# Eval("Country") %></span></li>
                              <li>Numar de posturi disponibile : <span><%# Eval("NoOfPost") %></span></li>
                              <li>Tipul Jobului : <span><%# Eval("JobType") %></span></li>
                              <li>Salariu :  <span><%# Eval("Salary") %></span></li>
                              <li>Data terminarii : <span><%# DataBinder.Eval(Container.DataItem, "LastDate","{0:dd MM yyyy}") %></span></li>
                          </ul>
                         <div class="apply-btn2">
                         <%--   <a href="#" class="btn">Aplică acum</a>--%>
                              <asp:LinkButton ID="btnApply" runat="server" Text="Aplică acum" CssClass="button button-contactForm boxed-btn mr-4" CommandName="ApplyJob" ></asp:LinkButton>
                         </div>
                       </div>
                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h4>Informații despre companie</h4>
                           </div>
                              <span><%# Eval("CompanyName") %> </span>
                              <p><b>Adresa :  </b><%# Eval("Adress") %> </p>
                            <ul>
                                <li>Nume Companie: <span><%# Eval("CompanyName") %> </span></li>
                                <li>Web : <span> <%# Eval("Web") %> </span></li>
                                <li>Email: <span><%# Eval("Email3") %></span></li>
                            </ul>
                       </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:DataList>
               
            </div>
        </div>
        <!-- job post company End -->

    </main>

</asp:Content>

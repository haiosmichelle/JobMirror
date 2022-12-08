<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MirrorJob.User.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div style="background-color: lightblue;box-shadow: rgba(10, 46, 170, 0.4) -5px 5px, rgba(240, 46, 170, 0.3) -10px 10px, rgba(240, 46, 170, 0.2) -15px 15px, rgba(240, 46, 170, 0.1) -20px 20px, rgba(240, 46, 170, 0.05) -25px 25px;">
            <div class="slider-active">
                <div class="single-slider slider-height d-flex align-items-center" data-background="../assets/img/hero/h1_hero.png"  style="background-size: 50% 70%; background-position:right center;"> 
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-9 col-md-10">
                                <div class="hero__caption">
                                    <h1>Descoperă cele mai interesante joburi</h1>
                                </div>
                            </div>
                        </div>
                        <!-- Search Box -->
                        <div class="row">
                            <div class="col-xl-8">
                                <!-- form -->
                                <%--<form action="#" class="search-box">
                                    <div class="input-form">
                                        <input type="text" placeholder="Titlul Jobului sau cuvant cheie">
                                    </div>
                                    <div class="select-form">
                                        <div class="select-itms">
                                            <select name="select" id="select1">
                                                <option value="">Locatie RO</option>
                                                <option value="">Locatie GE</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="search-form">
                                        <a href="#">Cauta</a>
                                    </div>	
                                </form>	--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
        <!-- slider Area End-->
        <!-- Our Services Start -->
        <div class="our-services section-pad-t30">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>PACHETE RECOMANDATE</span>
                            <h2>Răsfoiți categoriile de top</h2>
                        </div>
                    </div>
                </div>
                <div class="row d-flex justify-contnet-center">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Design & Creativ</a></h5>
                                <span>(653)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-cms"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Design & Development</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-report"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Sales & Marketing</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-app"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Aplicații mobile</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-helmet"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Construcții</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-high-tech"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Tehnologia informației</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-real-estate"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Imobiliare</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-content"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Scriitor de conținut</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- More Btn -->
                <!-- Section Button -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="browse-btn2 text-center mt-50">
                            <a href="job_listing.html" class="border-btn2">Răsfoiți Toate Sectoarele</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Our Services End -->
        <!-- Online CV Area Start -->
         <div class="online-cv cv-bg section-overly pt-90 pb-120"  data-background="../assets/img/gallery/cv_bg.jpg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="cv-caption text-center">
                            <p class="pera1">FII TU SCHIMBAREA!</p>
                            <p class="pera2">Realizează o diferență cu CV-ul tău online!</p>
                            <a href="#" class="border-btn2 border-btn4">Încarcă-ți CV-ul</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Online CV Area End-->
        <!-- Featured_job_start -->
        <section class="featured-job-area feature-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <h2>Locuri de muncă recomandate</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <!-- single-job-content -->
                        <div class="single-job-items mb-30">
                            <div class="job-items">
                                <div class="company-img">
                                    <a href="job_details.html"><img src="../assets/img/icon/job-list1.png" alt=""></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="job_details.html"><h4>Digital Marketing</h4></a>
                                    <ul>
                                        <li>Creative Agency</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Frankfurt, Germania</li>
                                        <li>$3500 - $4000</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="items-link f-right">
                                <a href="job_details.html">Full Time</a>
                                <span> 7 ore în urmă</span>
                            </div>
                        </div>
                        <!-- single-job-content -->
                        <div class="single-job-items mb-30">
                            <div class="job-items">
                                <div class="company-img">
                                    <a href="job_details.html"><img src="../assets/img/icon/job-list2.png" alt=""></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="job_details.html"><h4>Digital Marketer</h4></a>
                                    <ul>
                                        <li>Creative Agency</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Athens, Greece</li>
                                        <li>$3500 - $4000</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="items-link f-right">
                                <a href="job_details.html">Full Time</a>
                                <span>7 hours ago</span>
                            </div>
                        </div>
                         <!-- single-job-content -->
                        <div class="single-job-items mb-30">
                            <div class="job-items">
                                <div class="company-img">
                                    <a href="job_details.html"><img src="../assets/img/icon/job-list3.png" alt=""></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="job_details.html"><h4>Electrician</h4></a>
                                    <ul>
                                        <li>Hipo</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Bucuresti, România</li>
                                        <li>2500 - 3500 lei</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="items-link f-right">
                                <a href="job_details.html">Full Time</a>
                                <span>3 ore în urmă</span>
                            </div>
                        </div>
                         <!-- single-job-content -->
                        <div class="single-job-items mb-30">
                            <div class="job-items">
                                <div class="company-img">
                                    <a href="job_details.html"><img src="../assets/img/icon/job-list4.png" alt=""></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="job_details.html"><h4>Contabil</h4></a>
                                    <ul>
                                        <li>ROS</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Timișoara, România</li>
                                        <li>1500 - 3000 lei</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="items-link f-right">
                                <a href="job_details.html">Full Time</a>
                                <span>2 ore în urmă</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Featured_job_end -->
        <!-- How  Apply Process Start-->
        <div class="apply-process-area apply-bg pt-150 pb-150" data-background="../assets/img/gallery/how-applybg.png">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle white-text text-center">
                            <span>APLICAREA PROCESULUI</span>
                            <h2> Cum funcționează</h2>
                        </div>
                    </div>
                </div>
                <!-- Apply Process Caption -->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-search"></span>
                            </div>
                            <div class="process-cap">
                               <h5>1. Caută un loc de muncă</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-curriculum-vitae"></span>
                            </div>
                            <div class="process-cap">
                               <h5>2. Aplică pentru un loc de muncă</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="process-cap">
                               <h5>3. Obține Jobul mult dorit</h5>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
        </div>
        <!-- How  Apply Process End-->
        <!-- Testimonial Start -->
        <div class="testimonial-area testimonial-padding">
            <div class="container">
                <!-- Testimonial contents -->
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-10">
                        <div class="h1-testimonial-active dot-style">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/testimonial-founder.png" alt="">
                                            <span>David Muller</span>
                                            <p>Creative Director</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“I am at an age where I just want to be fit and healthy our bodies are our responsibility! So start caring for your body and it will care for you. Eat clean it will care for you and workout hard.”</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/1.png" alt="">
                                            <span>Margaret Lawson</span>
                                            <p>Ros</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“Mare echipă de oameni. Prima dată am primit asistență înainte de cumpărare de la chat-ul lor online. Răspuns foarte bine cunoscut și rapid.”</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/testimonial-founder.png" alt="">
                                            <span>Margaret Lawson</span>
                                            <p>Creative Director</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“I am at an age where I just want to be fit and healthy our bodies are our responsibility! So start caring for your body and it will care for you. Eat clean it will care for you and workout hard.”</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
         <!-- Support Company Start-->
         <div class="support-company-area support-padding fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>Ce facem noi</span>
                                <h2>24k de oameni dornici primesc locuri de muncă</h2>
                            </div>
                            <div class="support-caption">
                                <p class="pera-top">Obiectivul principal este de a pune la dispoziție jobul potrivit pentru candidatul potrivit.</p>
                                <a href="about.html" class="btn post-btn">Adauga Job</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img">
                            <img src="../assets/img/service/support-img.jpg" alt="">
                            <div class="support-img-cap text-center">
                                <p>Din</p>
                                <span>2022</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Support Company End-->
        <!-- Blog Area Start -->
       <%-- <div class="home-blog-area blog-h-padding">
            <div class="container">--%>
                <!-- Section Tittle -->
                <%--<div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Our latest blog</span>
                            <h2>Our recent news</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="../assets/img/blog/home-blog1.jpg" alt="">
                                    <!-- Blog date -->
                                    <div class="blog-date text-center">
                                        <span>24</span>
                                        <p>Now</p>
                                    </div>
                                </div>
                                <div class="blog-cap">
                                    <p>|   Properties</p>
                                    <h3><a href="single-blog.html">Footprints in Time is perfect House in Kurashiki</a></h3>
                                    <a href="#" class="more-btn">Read more »</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="../assets/img/blog/home-blog2.jpg" alt="">
                                    <!-- Blog date -->
                                    <div class="blog-date text-center">
                                        <span>24</span>
                                        <p>Now</p>
                                    </div>
                                </div>
                                <div class="blog-cap">
                                    <p>|   Properties</p>
                                    <h3><a href="single-blog.html">Footprints in Time is perfect House in Kurashiki</a></h3>
                                    <a href="#" class="more-btn">Read more »</a>
                                </div>
                            </div>
                        </div>--%>
                   <%-- </div>--%>
               <%-- </div>--%>
         <%--   </div>
        </div>--%>
        <!-- Blog Area End -->

    </main>
</asp:Content>

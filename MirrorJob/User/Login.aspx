<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MirrorJob.User.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section>
        <div class="container pt-50 pb-40">
                            <div class="row">
                    <div class="col-12 pb-20">
                       <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
                    </div>
                    <div class="col-12">
                        <h2 class="contact-title text-center">conectează-te</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">
                        <div class="form-contact contact_form">
                        <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Nume de Utilizator</label>
                                        <asp:TextBox ID="txtUserName" runat="server"  CssClass="form-control" placeholder="Introdu Numele de Utilizator Unic" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Parola</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Introdu Parola" TextMode="Password" required></asp:TextBox>

                                    </div>
                                </div>
                             <div class="col-10">
                                    <div class="form-group">
                                        <label>Tip de conectare</label>
                                        <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control w-100">
                                            <asp:ListItem Value="0">Selecteaza tipul de conectare</asp:ListItem>
                                            <asp:ListItem>Admin</asp:ListItem>
                                            <asp:ListItem>Utilizator</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tipul de utilizator este necesar" ForeColor="Red"
                                            Display="Dynamic" SetFocusOnError="true"
                                            Font-Size="Small" InitialValue="0" ControlToValidate="ddlLoginType">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-5">
                                <asp:Button ID="btnLogin" runat="server" Text="Logare" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnLogin_Click"/>
                                <span class="clickLink"><a href="../User/Register.aspx">Membru nou? Click aici..</a></span>
                            </div>
                            </div>    
                        </div>
                     </div>
        </div>
    </section>
</asp:Content>

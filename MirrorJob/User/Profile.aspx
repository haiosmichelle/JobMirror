﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MirrorJob.User.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList ID="dlProfile" runat="server" width="100%" OnItemCommand="dlProfile_ItemCommand">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="UserPic" class="rounded-circle"
                                            width="150" />
                                        <div class="mt-3">
                                            <h4 class="text-capitalize"><%# Eval("Name1") %></h4>
                                            <p class="text-secondary mb-1">@<%# Eval("Username") %></p>
                                            <p class="text-muted font-size-sm text-capitalize">
                                                <i class="fas fa-map-marker-alt"></i> s<%# Eval("Country") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Nume</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Name1") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                           <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Email1") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Numar de Telefon</h6>
                                        </div>
                                           <div class="col-sm-9 text-secondary text-capitalize">
                                          <%# Eval("Mobile") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Adresa</h6>
                                        </div>
                                           <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Address") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Cv</h6>
                                        </div>
                                           <div class="col-sm-9 text-secondary text-capitalize">
                                           <%# Eval("Resume") == DBNull.Value ? "Not Uploaded" : "Uploaded" %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="BtnEdit" runat="server" Text="Editare" CssClass="button button-contactForm boxed-btn"
                                                CommandName="EditUserProfile" CommandArgument='<%# Eval("UserId") %>'/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>

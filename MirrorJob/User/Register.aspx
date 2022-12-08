<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MirrorJob.User.WebForm3" %>
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
                        <h2 class="contact-title text-center">Înscrie-te</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">
                        <div class="form-contact contact_form">
                        <div class="row">
                            <div class="col-12">
                                <h6>Informații Logare</h6>
                            </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Nume de Utilizator</label>
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Introdu Numele de Utilizator Unic" required></asp:TextBox>
                                       <%-- <textarea class="form-control w-100" runat="server" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder="Introdu Mesaj" required></textarea>
                                   --%>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Parola</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Introdu Parola" TextMode="Password" required></asp:TextBox>
                                      
                                        <%--<input class="form-control valid" runat="server" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Introdu Numele tau" required>
                                   --%>

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Confirmați Parola</label>
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Introdu Parola Confirmată" TextMode="Password" required></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Parola & Parola Confirmată trebuie să fie la fel."
                                            ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                            Font-Size="Small">
                                        </asp:CompareValidator>
                                     </div>
                                </div>
                               <div class="col-12">
                                  <h6>Informații Personale</h6>
                               </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Tot Numele</label>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Introdu Tot Numele" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numele trebuie să aibă doar caractere"
                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$"
                                            ControlToValidate="txtFullName" ></asp:RegularExpressionValidator>
                                       </div>
                                </div>
                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Adresa</label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Introdu Adresa" TextMode="MultiLine" required></asp:TextBox>
                                       
                                       <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%></div>
                                </div>
                             <div class="col-12">
                                    <div class="form-group">
                                        <label>Număr Mobil</label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Introdu Numărul Mobil" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numărul Mobil trebuie să aibă doar 10 numere"
                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                            Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile" >
                                        </asp:RegularExpressionValidator>
                                      
                                       <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%></div>
                                </div>
                             <div class="col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Introdu Emailul" TextMode="Email" required></asp:TextBox>
                                       <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%></div>
                                </div>
                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100"
                                            AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Țara este necesară" ForeColor="Red"
                                            Display="Dynamic" SetFocusOnError="true"
                                            Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry">
                                        </asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-4">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnRegister_Click"/>
                                <span class="clickLink"><a href="../User/Login.aspx">Deja v-ați Înregistrat? Click aici..</a></span>
                            </div>
                            </div>    
                        </div>
                     </div>
        </div>
    </section>
</asp:Content>

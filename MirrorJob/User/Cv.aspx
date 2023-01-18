<%@ Page Title="" Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="true" CodeBehind="Cv.aspx.cs" Inherits="MirrorJob.User.Cv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title text-center">Creaza-ti Cv-ul</h2>
                </div>
                <div class="col-lg-9 mx-auto">
                    <div class="form-contact contact_form">
                        <div class="row">
                            <div class="col-10">
                                <h6>Informații personale</h6>
                            </div>
                             <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Nume de Utilizator</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Introdu Numele de Utilizator Unic" required></asp:TextBox>
                                    <%-- <textarea class="form-control w-100" runat="server" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder="Introdu Mesaj" required></textarea>
                                    --%>
                                </div>
                            </div>
                     
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Adresa</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Introdu Adresa" TextMode="MultiLine" required></asp:TextBox>

                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Număr Mobil</label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Introdu Numărul Mobil" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numărul Mobil trebuie să aibă doar 10 numere"
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                        Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile">
                                    </asp:RegularExpressionValidator>

                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Introdu Emailul" TextMode="Email" required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Tara</label>
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

                            <div class="col-10 pt-5">
                                <h6>Informații Educatie</h6>
                            </div>
                             <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Scoala</label>
                                    <asp:TextBox ID="txtTenth" runat="server" CssClass="form-control" placeholder="Introdu scoala de provenienta"  required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Diploma</label>
                                    <asp:TextBox ID="txtGraduation" runat="server" CssClass="form-control" placeholder="Ex. Licentiat/a in Stiinte"  required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                           <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Doctorat</label>
                                    <asp:TextBox ID="txtPHD" runat="server" CssClass="form-control" placeholder="PHD"  required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Profil Job</label>
                                    <asp:TextBox ID="txtWork" runat="server" CssClass="form-control" placeholder="Job"  required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Experienta de Lucru</label>
                                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Experienta"  required></asp:TextBox>
                                    <%-- <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Introdu Subiectul" required>
                                    --%>
                                </div>
                            </div>
                             <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Cv</label>
                                    <asp:FileUpload ID="fuResume" runat="server" CssClass="form-control pt-2"
                                        ToolTip=".doc, .docx, .pdf extension only" />
                                </div>
                            </div>
                            </div>
                        <div class="form-group mt-4">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnUpdate_Click" />
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

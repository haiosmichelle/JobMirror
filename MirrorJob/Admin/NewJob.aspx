<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="MirrorJob.Admin.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed;">
<div class="container pt-4 pb-4">
    <%--<div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>--%>
    <div class="btn-toolbar justify-content-between mb-3">
        <div class="btn-group">
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <div class="input-group h-25">
            <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/JobList.aspx" CssClass="btn btn-secondary"
                 Visible="false"> < Inapoi</asp:HyperLink>

        </div>
    </div>

    <h3 class="text-center"><%Response.Write(Session["title"]); %></h3>

    <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtJobTitle" style="font-weight: 600">Titlul Jobului</Label>
            <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex. Web Developer,App Developer" required>
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtNoOfPost" style="font-weight: 600">Numarul de Posturi</Label>
            <asp:TextBox ID="txtNoOfPost" runat="server" CssClass="form-control" placeholder="Introdu Numarul de Posturi"
                 TextMode="Number" required>
            </asp:TextBox>
        </div>
    </div>

     <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-12 pt-3">
            <Label for="txtDes" style="font-weight: 600">Descriere</Label>
            <asp:TextBox ID="txtDes" runat="server" CssClass="form-control" placeholder="Introdu Descrierea Jobului"
                TextMode="MultiLine" required>
            </asp:TextBox>
        </div>
    </div>

    <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtQual" style="font-weight: 600">Calificarea/Educația necesară</Label>
            <asp:TextBox ID="txtQual" runat="server" CssClass="form-control" placeholder="Ex. Btech" required>
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtEx" style="font-weight: 600">Experienta necesara</Label>
            <asp:TextBox ID="txtEx" runat="server" CssClass="form-control" placeholder="Ex: 2 ani, 1.5 ani" required>
            </asp:TextBox>
        </div>
    </div>

     <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtSpe" style="font-weight: 600">Specializarea necesară</Label>
            <asp:TextBox ID="txtSpe" runat="server" CssClass="form-control" placeholder="Introdu Specializarea"
                TextMode="MultiLine" required>
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtLast" style="font-weight: 600">Ultima Data pentru a Aplica</Label>
            <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" placeholder="Introdu Ultima Data"
                TextMode="Date" required>
            </asp:TextBox>
        </div>
    </div>

    <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtSal" style="font-weight: 600">Salariul</Label>
            <asp:TextBox ID="txtSal" runat="server" CssClass="form-control" placeholder="Ex: 25000/Luna, 300000/An" required>
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtLast" style="font-weight: 600">Tipul Jobului</Label>
           <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
               <asp:ListItem Value="0">Selecteaza Tipul Jobului</asp:ListItem>
               <asp:ListItem>Full Time</asp:ListItem>
               <asp:ListItem>Part Time</asp:ListItem>
               <asp:ListItem>Remote</asp:ListItem>
               <asp:ListItem>Freelance</asp:ListItem>
           </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tipul Jobului este necesar" ForeColor="Red"
            ControlToValidate="ddlJobType" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtCom" style="font-weight: 600">Numele Companiei/Organizatiei</Label>
            <asp:TextBox ID="txtCom" runat="server" CssClass="form-control" placeholder="Introdu Numele Companiei/Organizatiei" required>
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtLast" style="font-weight: 600">Logo-ul Companiei/Organizatiei</Label>
          <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png extension only"/>
        </div>
    </div>

     <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-6 pt-3">
            <Label for="txtWeb" style="font-weight: 600">Website</Label>
            <asp:TextBox ID="txtWeb" runat="server" CssClass="form-control" placeholder="Introdu Website-ul"
                TextMode="Url">
            </asp:TextBox>
        </div>
         <div class="col-md-6 pt-3">
            <Label for="txtEmail" style="font-weight: 600">Email</Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Introdu Email"
                TextMode="Email">
            </asp:TextBox>
        </div>
    </div>

    <div class="row mr-lg-5 ml-lg-5 mb-3 ">
        <div class="col-md-12 pt-3">
            <Label for="txtAdress" style="font-weight: 600">Adresa</Label>
            <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control" placeholder="Introdu Adresa"
                TextMode="MultiLine" required>
            </asp:TextBox>
        </div>
    </div>

      <div class="row mr-lg-5 ml-lg-5 mb-3 ">
          <div class="col-md-6 pt-4">
              <label for="txtWeb" style="font-weight: 600">Tara</label>
              <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100"
                  AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                  <asp:ListItem Value="0">Selecteaza Tara</asp:ListItem>
              </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Țara este necesară" ForeColor="Red"
                  Display="Dynamic" SetFocusOnError="true"
                  Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry">
              </asp:RequiredFieldValidator>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
                  SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
          </div>
              <div class="col-md-6 pt-4">
            <Label for="txtLast" style="font-weight: 600">Ce fel de Job</Label>
           <asp:DropDownList ID="ddlJobtip" runat="server" CssClass="form-control">
               <asp:ListItem Value="0">Selecteaza Tipul Jobului</asp:ListItem>
               <asp:ListItem>Actor</asp:ListItem>
               <asp:ListItem>Inginer</asp:ListItem>
              <asp:ListItem>Programator</asp:ListItem>
              <asp:ListItem>Editor Video</asp:ListItem>
               <asp:ListItem>Solist</asp:ListItem>
              <asp:ListItem>Muzician</asp:ListItem>
              <asp:ListItem>Administrator</asp:ListItem>
              <asp:ListItem>Contabil</asp:ListItem>
               <asp:ListItem>Antrenor Personal</asp:ListItem>
                <asp:ListItem>Instructor Auto</asp:ListItem>
              <asp:ListItem>Medic</asp:ListItem>
               <asp:ListItem>Agent Imobiliar</asp:ListItem>
              <asp:ListItem>Sofer</asp:ListItem>
              <asp:ListItem>Chimist</asp:ListItem>
             <asp:ListItem>Pictor</asp:ListItem>
              <asp:ListItem>Sculptor</asp:ListItem>
             <asp:ListItem>Electrician</asp:ListItem>
             <asp:ListItem>Mecanic</asp:ListItem>
              <asp:ListItem>Bucatar</asp:ListItem>
             <asp:ListItem>Ospatar</asp:ListItem>
             <asp:ListItem>Barman</asp:ListItem>
              <asp:ListItem>Bancher</asp:ListItem>
            <asp:ListItem>Frizer</asp:ListItem>
           </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Tipul Jobului este necesar" ForeColor="Red"
            ControlToValidate="ddlJobtip" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
                  
    </div>    
     <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
         <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAddJob" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf" Text="Adauga Job"
                 OnClick="btnAddJob_Click"/>
         </div>

     </div>

</div>
 </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="MirrorJob.Admin.JobList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat;
background-size: cover; background-attachment: fixed;">
<div class="container-fluid pt-4 pb-4">
    <%--<div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>--%>
    <div class="btn-toolbar justify-content-between mb-3">
        <div class="btn-group">
             <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <div class="input-group h-25">
        <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/ViewResume.aspx" CssClass="btn btn-secondary"
            Visible="false">< Inapoi</asp:HyperLink>
    </div>
    </div>
    
    <h3 class="text-center">Lista Job</h3>
    <div class="row mb-3 pt-sm-3">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                EmptyDataText="Nicio inregistrare pe Display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="JobId" OnRowDeleting="GridView1_RowDeleting"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    
                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Title" HeaderText="Titlul Jobului">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="NoOfPost" HeaderText="Numar de Posturi">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Qualification" HeaderText="Calificarea">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Experience" HeaderText="Experienta">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="LastDate" HeaderText="valabil până la" DataFormatString="{0:dd MMMM yyyy}">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="CompanyName" HeaderText="Numele Companiei">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Country" HeaderText="Tara">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="CreateDate" HeaderText="Data in care a fost Postat" DataFormatString="{0:dd MMMM yyyy}">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditJob" runat="server" CommandName="EditJob" CommandArgument='<%# Eval("JobId") %>'>
                                <asp:Image ID="Img" runat="server" ImageUrl="../assets/img/icon/editPencil.png" Height="25px"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField> 

                    <asp:CommandField CausesValidation="false" HeaderText="Sterge" ShowDeleteButton="true" 
                        DeleteImageUrl="../assets/img/icon/trashIcon.jfif" ButtonType="Image">
                      <ControlStyle Height="25px" Width="25px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>

                </Columns>
                <HeaderStyle BackColor="#7200cf" ForeColor="White" />
            </asp:GridView>
        </div> 

    </div>
    </div>
         </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_ftp_mx_record.aspx.cs" Inherits="admin_view_ftp_mx_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 850px;
        }
        .style2
        {
            text-align: right;
            width:150px;
        }
        .style3
        {
            text-align: left;
            width:700px;
        }
        .style4
        {
            text-align: right;
            width: 150px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

              <table style="width:100%;" class="txt" >

                <tr>
                    <td colspan="3" class="header_title">
                        View District - 3140 Club&#39;s FTP &amp; MX Records
                    </td>
                </tr>

                <tr>
                    <td >
                        
                        <table class="style1">
                            <tr>
            <td colspan="3" align="center">
             <asp:RadioButtonList ID="rbtnType" runat="server" AutoPostBack="True" 
                     RepeatDirection="Horizontal" 
                    onselectedindexchanged="rbtnType_SelectedIndexChanged">
                     <asp:ListItem Value="0">Club Name</asp:ListItem>
                     <asp:ListItem Value="1">President</asp:ListItem>
                     <asp:ListItem Value="2">Website</asp:ListItem>                     
                 </asp:RadioButtonList>
                 
                  
            </td>
            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                                        CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                                        DataValueField="id" AutoPostBack="True" 
                                        onselectedindexchanged="DDLClubName_SelectedIndexChanged">
                                        <asp:ListItem>Select Club Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DDLdomain" runat="server" CssClass="txt" AppendDataBoundItems="true" 
                                        DataSourceID="DSWebsite" DataTextField="domain_name" DataValueField="id" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="DDLdomain_SelectedIndexChanged">
                                        <asp:ListItem>Select Domain Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DDLpresident" runat="server" CssClass="txt" AppendDataBoundItems="true"
                                        DataSourceID="DSpresident" DataTextField="Name" DataValueField="id" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="DDLpresident_SelectedIndexChanged">
                                        <asp:ListItem>Select President Name</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" >
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Club Name</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblClubname" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Domain Name</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    
                                    <a id="linkDomain" runat="server" target="_blank" border="0"><asp:Label ID="lblDomain" runat="server"></asp:Label></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    FTP Username</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblFTPuser" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    FTP Password</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblFTPpassword" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    President Name</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblPresident" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Email Service Provider</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblemailSP" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    MX Record</td>
                                <td>
                                    :</td>
                                <td class="style3">
                                    <asp:Label ID="lblMXrecord" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td class="style3">
                                    <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                                        SelectCommand="SELECT * FROM [View_DomainFTP] ORDER BY [club_name]">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="DSWebsite" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                                        SelectCommand="SELECT * FROM [View_DomainFTP] order by domain_name"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="DSpresident" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                                        SelectCommand="SELECT * FROM [View_DomainFTP] ORDER BY [Name]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        
                    </td>

                </tr>

            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


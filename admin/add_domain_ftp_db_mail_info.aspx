<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_domain_ftp_db_mail_info.aspx.cs" Inherits="admin_add_domain_ftp_db_mail_info" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            text-align: left;
        }

        .style2 {
            color: #FF0000;
        }

        .style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="3" class="header_title">Add Domain, FTP, DB & Email Information
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                    </td>
                </tr>

                   <tr>
                    <td colspan="3" class="header_subtitle">Domain
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style3">
                        <div align="right">
                            <span class="style2">*</span>
                            Domain Name</div>
                    </td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtDomainName" runat="server" CssClass="txt" Width="300px"
                            MaxLength="200">www.</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDomainName" runat="server"
                            ControlToValidate="txtDomainName" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style3" valign="top">Domain Registration Date</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">
                        <telerik:RadDatePicker ID="dateRegistration" Runat="server">
                        </telerik:RadDatePicker>
                    </td>
                </tr>

                  <tr>
                    <td colspan="3" class="header_subtitle">DNS Name
                    </td>
                </tr>
              



                <tr>
                    <td valign="top" class="style3">NS1</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="300px"></asp:TextBox> 
                    </td>
                </tr>

                  <tr>
                    <td valign="top" class="style3">NS2</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                  <tr>
                    <td valign="top" class="style3">NS3</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                    </td>
                </tr>



                <tr>
                    <td colspan="3" class="header_subtitle">FTP
                    </td>
                </tr>
              



                <tr>
                    <td valign="top" class="style3"><span class="style2">*</span>
                        FTP User Name</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtFTPusername" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFTP" runat="server"
                            ControlToValidate="txtFTPusername" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr id="trDonor" runat="server">
                    <td class="style3"><span class="style2">*</span>
                        FTP Password</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtFTPpassword" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Pass" runat="server"
                            ControlToValidate="txtFTPpassword" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="header_subtitle">Database
                    </td>
                </tr>

                  <tr id="tr3" runat="server">
                    <td class="style3"><span class="style2">*</span>
                        Database Name</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtDBname" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDBname" runat="server"
                            ControlToValidate="txtDBname" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                  <tr id="tr1" runat="server">
                    <td class="style3"><span class="style2">*</span>
                        Database Username</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtDBusername" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDBusername" runat="server"
                            ControlToValidate="txtDBusername" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                  <tr id="tr2" runat="server">
                    <td class="style3"><span class="style2">*</span>
                        Data Password</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtDBpassword" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDBpassword" runat="server"
                            ControlToValidate="txtDBpassword" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="header_subtitle">MX Record
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style3">Email Service Provider</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:DropDownList ID="DDLesp" runat="server" CssClass="txt" AutoPostBack="True"
                            OnSelectedIndexChanged="DDLesp_SelectedIndexChanged">
                            <asp:ListItem>outlook.com</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>

                        <asp:TextBox ID="txtESPother" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style3">MX Record</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtMXrecord" runat="server" CssClass="txt" Width="500px"></asp:TextBox>

                        <asp:Button ID="btnAddMore" runat="server" CssClass="btn" Text="Add More..." ValidationGroup="D" />

                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="header_subtitle">SPF Record
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style3">SPF Record</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtSPFrecord" runat="server" CssClass="txt" Width="500px"></asp:TextBox>

                    </td>
                </tr>

                   <tr>
                    <td colspan="3" class="header_subtitle">DKIM Key
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style3">Key</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtDNSname" runat="server" CssClass="txt" Width="200px"></asp:TextBox>

                    </td>
                </tr>

               



                <tr>
                    <td class="style3">&nbsp;</td>
                    <td class="style1">&nbsp;</td>
                    <td class="style1">

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                            CssClass="btn" ValidationGroup="D" OnClick="btnSubmit_Click" />

                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False"
                            CssClass="btn" OnClick="btnCancel_Click" Text="Cancel" />

                    </td>
                </tr>




                <tr>
                    <td class="style3">
                        <div align="right"></div>
                    </td>
                    <td class="style1">
                        <div align="center"></div>
                    </td>
                    <td>
                        <div align="left">
                            &nbsp;&nbsp;<asp:SqlDataSource ID="DSDistClubNo" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc"></asp:SqlDataSource>
                        </div>
                    </td>
                </tr>


            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

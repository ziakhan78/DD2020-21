<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" Title="Administration Change Password" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="3" class="header_title">Change Administration Password
                    </td>
                </tr>

                <tr>

                    <td colspan="3" align="center" style="border: solid thin">
                        <asp:Label ID="Label1" runat="server"
                            Text="Note: Password has to be between 8 to 12 characters, it should be alphanumeric, case sensitive and should have one numeric field." ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="center">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                </tr>

                <tr>
                    <td align="center"></td>
                    <td align="right">Old Password&nbsp; :</td>
                    <td align="left">&nbsp;
    <asp:TextBox ID="txtoldp" runat="server"
        Style="top: 145px; left: 219px; width: 150px; margin-left: 0px;"
        TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtoldp" ErrorMessage="Enter old password"
                            Style="top: 146px; left: 358px; height: 14px; width: 21px" ValidationGroup="v"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center">&nbsp;</td>
                    <td align="right">New Password&nbsp; :</td>
                    <td align="left">&nbsp;
    <asp:TextBox ID="txtnewp" runat="server"
        Style="top: 199px; left: 219px; width: 150px"
        TextMode="Password"></asp:TextBox>
                        <cc1:PasswordStrength ID="PasswordTextBox_PasswordStrength" runat="server"
                            Enabled="True" TargetControlID="txtnewp">
                        </cc1:PasswordStrength>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtnewp" ErrorMessage="Enter new password"
                            Style="top: 203px; left: 361px; height: 15px; width: 13px" ValidationGroup="v"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtnewp" ErrorMessage="Invalid password"
                            ValidationExpression="(?!^[0-9]*$)(?!^[a-z]*$)^([a-z0-9]{8,12})$"
                            ValidationGroup="v" Display="Dynamic"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="style8"></td>
                    <td class="style2"></td>
                    <td class="style1"></td>
                </tr>
                <tr>
                    <td align="center" class="style17">&nbsp;</td>
                    <td align="right" class="style2" valign="top">Re-Type New Password&nbsp; :</td>
                    <td align="left" class="style1">&nbsp;
    <asp:TextBox ID="txtretp" runat="server"
        Style="top: 245px; left: 221px; width: 150px"
        TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtretp" ErrorMessage="Re-Type new password"
                            ValidationGroup="v" Display="Dynamic"></asp:RequiredFieldValidator>&nbsp;<asp:CompareValidator
                                ID="CompareValidator1" runat="server"
                                ControlToCompare="txtnewp" ControlToValidate="txtretp"
                                ErrorMessage="Password Mismatch"
                                Style="top: 279px; left: 218px; height: 17px; width: 158px" ValidationGroup="v"
                                Display="Dynamic"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="style9"></td>
                    <td class="style2"></td>
                    <td class="style1"></td>
                </tr>
                <tr>
                    <td class="style17"></td>
                    <td class="style2"></td>
                    <td align="left">&nbsp;&nbsp;<asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click"
                        Text="Submit" ValidationGroup="v" CssClass="btn" />
                        &nbsp;<asp:Button ID="btnreset" runat="server" CausesValidation="False"
                            OnClick="btnreset_Click" Text="Reset" CssClass="btn" />
                    </td>
                </tr>
            </table>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


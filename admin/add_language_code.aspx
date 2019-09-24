<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_language_code.aspx.cs" Inherits="admin_add_language_code" %>

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
                    <td colspan="3" class="header_title">Add Language Code
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                    </td>
                </tr>

                <tr id="trDonor" runat="server">
                    <td class="style3"><span class="style2">*</span> Language Name</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtLanguage" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVLanguage" runat="server" ControlToValidate="txtLanguage" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="L"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr id="tr1" runat="server">
                    <td class="style3"><span class="style2">*</span> Language Code</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtCode" runat="server" Width="50px" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVCode" runat="server" ControlToValidate="txtCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="L"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style3">&nbsp;</td>
                    <td class="style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                            CssClass="btn"
                            ValidationGroup="L" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel"
                            CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>






<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_discon_registration_rate.aspx.cs" Inherits="admin_add_discon_registration_rate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            text-align: left;
            vertical-align: middle;
        }

        .style2 {
            color: #FF0000;
        }

        .style3 {
            text-align: left;
            color: #FF0000;
            font-weight: bold;
        }

        .style4 {
            text-align: right;
            vertical-align: middle;
            width: 150px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title">Add Discon Registration Fees Master
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right" class="auto-style1"><span class="style2">*</span> Denotes Mandatory field.
                    </td>
                </tr>

                <%--   <tr>
                    <td width="150px" class="style4"><span class="style2">*</span> Year</td>
                    <td class="style1">:</td>
                    <td class="style1">

                        <asp:DropDownList ID="DDLYear" runat="server" CssClass="txt1">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RFVyears" runat="server"
                            ControlToValidate="DDLYear" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Select year" ValidationGroup="RIP" InitialValue="Select"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Member Type :</div>
                    </td>
                    <td class="style1" align="left">
                        <asp:RadioButtonList ID="rbtnMemType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnMemType_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0">Rotarian</asp:ListItem>
                            <asp:ListItem Value="1">Non Rotarian</asp:ListItem>
                        </asp:RadioButtonList>

                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Category :</div>
                    </td>
                    <td class="style1">

                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="txt">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">Smart Bird</asp:ListItem>
                            <asp:ListItem Value="2">Early Bird</asp:ListItem>
                            <asp:ListItem Value="3">Regular Bird</asp:ListItem>
                            <asp:ListItem Value="4">Angry Bird</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right"><span class="style2">*</span> Date From :</div>
                    </td>
                    <td class="style1">
                        <telerik:RadDatePicker ID="dateFrom" runat="server">
                        </telerik:RadDatePicker>
                    </td>
                </tr>


                <tr>
                    <td valign="top" class="style4">
                        <div align="right"><span class="style2">*</span> Date To :</div>
                    </td>
                    <td class="style1">
                        <telerik:RadDatePicker ID="dateTo" runat="server">
                        </telerik:RadDatePicker>
                    </td>
                </tr>



                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Registration Fees For :</div>
                    </td>
                    <td class="style1" align="left">
                        <asp:RadioButtonList ID="rbtnRegisFor" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0">Member</asp:ListItem>
                            <asp:ListItem Value="1">Spouse</asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RadioButtonList ID="rbtnSingleCouple" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0">Single</asp:ListItem>
                            <asp:ListItem Value="1">Couple</asp:ListItem>
                        </asp:RadioButtonList>

                    </td>
                </tr>



                <tr id="trDonor" runat="server">
                    <td class="style4"><span class="style2">*</span> Amount :</td>
                    <td class="style1">

                        <telerik:RadNumericTextBox ID="txtAmt" runat="server" MaxLength="5" Width="80px">
                        </telerik:RadNumericTextBox>

                    </td>
                </tr>





                <tr>
                    <td class="style4">
                        <div align="right"></div>
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                            CssClass="btn" ValidationGroup="RIP" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                            CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" /></td>
                </tr>


            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

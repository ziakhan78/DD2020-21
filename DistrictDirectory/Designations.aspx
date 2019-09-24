<%@ Page Title="" Language="C#" MasterPageFile="~/DistrictDirectory/AdminDistrictDirectory.master" AutoEventWireup="true" CodeFile="Designations.aspx.cs" Inherits="DistrictDirectory_Designations" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            text-align: left;
        }

        .style2 {
            color: #FF0000;
        }
        .auto-style1 {
            height: 24px;
        }
        .auto-style2 {
            text-align: left;
            height: 24px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>


    <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

        <tr>
            <td colspan="3" class="header_title">Add District Designation
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3"><span class="style2">*</span> Denotes Mandatory 
                  field.
            </td>
        </tr>


        <tr>
            <td align="right" class="auto-style1" style="width:150px"><span class="style2">* </span>Select Year</td>
            <td class="auto-style2">:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox" AppendDataBoundItems="false" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVyear" runat="server"
                    ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="Select Year" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>




        <tr>
            <td align="right">
                <span class="style2">* </span>Avenue</td>
            <td class="style1">:</td>
            <td class="style1">

                <asp:DropDownList ID="DDLDesig" runat="server" CssClass="txtBox" AppendDataBoundItems="True"  >
                    <asp:ListItem>Select</asp:ListItem>

                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RFVDesig" runat="server"
                    ControlToValidate="DDLDesig" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="Select Designation" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>

            </td>
        </tr>




        <tr>
            <td>
                <div align="right"><span class="style2">*</span> Designation</div>
            </td>
            <td class="style1">:</td>
            <td class="style1">

                <asp:TextBox ID="txtSubDesig" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVAbb" runat="server"
                    ControlToValidate="txtSubDesig" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>

                <asp:CustomValidator ID="CustomValidator1" runat="server"
                    ControlToValidate="txtSubDesig" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="* Already Exists."
                    ValidationGroup="A" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

            </td>
        </tr>


        <tr>
            <td>
                &nbsp;</td>
            <td class="style1">&nbsp;</td>
            <td>
                <div align="left">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        CssClass="btn"
                        ValidationGroup="A" OnClick="btnSubmit_Click" />
                    &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel"
                        CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                </div>
            </td>
        </tr>


    </table>

    <%--      </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

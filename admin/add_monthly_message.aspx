<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_monthly_message.aspx.cs" Inherits="admin_add_monthly_message" Title="" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style2 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title">
                        <asp:Label ID="lblTitle" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><span class="style2">*</span> Denotes Mandatory field.
                    </td>
                </tr>

                <tr>
                    <td style="width:120px;">
                        <div align="right"><span class="style2">* </span>Select Month: </div>
                    </td>

                    <td valign="top" >

                        <div align="left">
                           <%-- <asp:DropDownList ID="DDLMonth" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLMonth" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select month" InitialValue="Select" ValidationGroup="DG"></asp:RequiredFieldValidator>--%>
                            <telerik:RadMonthYearPicker ID="dtMonthYear" Runat="server" Skin="Silk">
                            </telerik:RadMonthYearPicker>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="style2">* </span>For:</div>
                    </td>

                    <td valign="top">

                        <div align="left">
                            <asp:DropDownList ID="ddlFor" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1" Text="RI" ></asp:ListItem>
                                <asp:ListItem Value="2" Text="DG"></asp:ListItem>
                                <asp:ListItem Value="3" Text="TRF Chair"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvFor" runat="server" ControlToValidate="ddlFor" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select!" InitialValue="0" ValidationGroup="DG"></asp:RequiredFieldValidator>
                   
                                    </div>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top"><span class="style2">* </span>Message:</td>
                    <td class="style3" valign="top">


                        &nbsp;</td>
                </tr>

                <tr>
                    <td align="right" colspan="2" valign="top">
                        <telerik:RadEditor ID="txtDescription" runat="server"  Height="450px" Skin="Silk" Width="99%">
                            <CssFiles>
                                <telerik:EditorCssFile Value="../css/editor.css" />
                            </CssFiles>
                            <Tools>
                                <telerik:EditorToolGroup>
                                    <telerik:EditorTool Name="Bold" />
                                    <telerik:EditorTool Name="Italic" />
                                    <telerik:EditorTool Name="Underline" />
                                    <telerik:EditorTool Name="LinkManager" />
                                    <telerik:EditorTool Name="Unlink" />
                                    <telerik:EditorTool Name="JustifyFull" />
                                    <telerik:EditorTool Name="JustifyCenter" />
                                    <telerik:EditorTool Name="JustifyLeft" />
                                    <telerik:EditorTool Name="JustifyRight" />
                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                                </telerik:EditorToolGroup>
                            </Tools>
                        </telerik:RadEditor>
                        <br />
                        <asp:RequiredFieldValidator ID="RFVDescription" runat="server" ControlToValidate="txtDescription" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="DG"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"></div>
                    </td>
                    <td>
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                                CssClass="btn"
                                ValidationGroup="DG" OnClick="btnSubmit_Click" />
                            &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                                CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                        </div>
                    </td>
                </tr>


            </table>

        </ContentTemplate>
        <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>


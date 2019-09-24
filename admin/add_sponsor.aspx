<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_sponsor.aspx.cs" Inherits="admin_add_sponsor" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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


            <table width="100%" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>

                    <td colspan="3" class="header_title">Add Sponser</td>
                </tr>
                <tr>
                    <td colspan="3" style="width: 100%" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                    </td>
                </tr>

                 <tr>
                    <td align="right" valign="top">
                        <span class="style2">*</span> Title / Company Name</div></td>
                    <td>:</td>
                    <td class="style1">

                        <div align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="550px" CssClass="txt1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                                ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Please Enter Title" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style2">*</span> Start Date</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <telerik:RadDatePicker ID="StartDate" runat="server" Culture="en-IN">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RFVSdate" runat="server"
                            ControlToValidate="StartDate" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style2">*</span> End Date</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <telerik:RadDatePicker ID="EndDate" runat="server" Culture="en-IN">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RFVEdate" runat="server" ControlToValidate="EndDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="D"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CVDate" runat="server" ControlToCompare="StartDate" ControlToValidate="EndDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="End date should not be less than start date" Type="Date" ValidationGroup="D" Operator="GreaterThan"></asp:CompareValidator>
                    </td>
                </tr>               


                <tr>
                    <td class="style3">
                        <div align="right"><span class="style2">*</span> URL Link</div>
                    </td>
                    <td>:</td>
                    <td class="style1">

                        <div align="left">
                            <asp:TextBox ID="txtURL" runat="server" Width="550px" CssClass="txt1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvURL" runat="server"
                                ControlToValidate="txtURL" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Please Enter URL" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>



                <tr>
                    <td valign="top" class="style3"><span class="style2">*</span> Upload Logo / Photo</td>
                    <td valign="top">:</td>
                    <td class="style1">
                        <div align="left">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="557px" CssClass="txt1"
                                Height="24px" />
                            <asp:RequiredFieldValidator ID="rfvFile" runat="server"
                                ControlToValidate="FileUpload1" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Please Upload Logo" ValidationGroup="D"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server"
                                ControlToValidate="FileUpload1" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Maximum file size exceeded !"
                                OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
                            <br />
                            <span class="style2">( Upload only .jpg, .jpeg, .gif, .png format and maximum file size is 500 KB )</span>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="style3">Status</td>
                    <td>:</td>
                    <td class="style1">
                        <asp:DropDownList ID="DDLStatus" runat="server" CssClass="txt">

                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>


                <tr>
                    <td class="style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="style1">
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                CssClass="btn"
                                ValidationGroup="D" OnClick="btnSubmit_Click" />
                            &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                                CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                            <asp:Label ID="lblFileSize" runat="server" Visible="false"></asp:Label>
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


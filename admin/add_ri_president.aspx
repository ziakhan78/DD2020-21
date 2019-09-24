<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_ri_president.aspx.cs" Inherits="admin_add_ri_president" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            text-align: left;
            vertical-align: top;
        }

        .style2 {
            color: #FF0000;
        }

        .style3 {
            text-align: left;
            color: #FF0000;
            font-weight: bold;
            vertical-align: top;
        }

        .style4 {
            text-align: right;
            vertical-align: top;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="3" class="header_title">Add RI Presidents
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right" class="auto-style1"><span class="style2">*</span> Denotes Mandatory field.
                    </td>
                </tr>

                <tr>
                    <td width="150px" class="style4"><span class="style2">*</span> Year</td>
                    <td class="style1">:</td>
                    <td class="style1">

                         <asp:DropDownList ID="DDLYear" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLYear" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select year" InitialValue="Select" ValidationGroup="RIP"></asp:RequiredFieldValidator>
                   
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right"><span class="style2">*</span> First Name</div>
                    </td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtFName" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVFName" runat="server"
                            ControlToValidate="txtFName" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank" ValidationGroup="RIP"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Middle Name</div>
                    </td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtMName" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right"><span class="style2">*</span> Last Name</div>
                    </td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtLName" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVLName" runat="server"
                            ControlToValidate="txtLName" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank" ValidationGroup="RIP"></asp:RequiredFieldValidator>
                    </td>
                </tr>



                <tr>
                    <td valign="top" class="style4">Rotary Club of</td>
                    <td class="style1" valign="top">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtClubName" runat="server" Width="500px" CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">District</td>
                    <td valign="top" class="style1">:</td>
                    <td class="style1">

                        <telerik:RadNumericTextBox ID="txtDistNo" runat="server" Culture="(Default)" Width="100px" MaxLength="8" CssClass="txtBox" Skin="Silk">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>


                <tr id="trDonor" runat="server">
                    <td class="style4">Location</td>
                    <td class="style1">:</td>
                    <td class="style1">
                        <asp:TextBox ID="txtDistrict" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style4">
                        <div align="right">Country</div>
                    </td>
                    <td class="style1">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtCountry" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Theme</div>
                    </td>
                    <td valign="top" class="style1">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtTheme" runat="server" Width="500px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style4">
                        <div align="right">Convention Location</div>
                    </td>
                    <td valign="top" class="style1">:</td>
                    <td class="style1">

                        <asp:TextBox ID="txtConvention" runat="server" Width="500px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>



                <tr>
                    <td valign="top" class="style4">No. of Participant</td>
                    <td valign="top" class="style1">:</td>
                    <td class="style1">

                        <telerik:RadNumericTextBox ID="txtParticepant" runat="server" Culture="(Default)" Width="100px" MaxLength="6" CssClass="txtBox" Skin="Silk">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>



                <tr>
                    <td class="style4">Upload President&nbsp; Photo</td>
                    <td class="style1">:</td>
                    <td class="style1">

                        <asp:FileUpload ID="FileUploadPhoto" runat="server" Width="508px" />
                        <asp:CustomValidator ID="CVMemImg" runat="server"
                            ControlToValidate="FileUploadPhoto" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Maximum file size exceeded !"
                            OnServerValidate="CVMemImg_ServerValidate" ValidationGroup="RIP"></asp:CustomValidator>
                        <asp:CustomValidator ID="CVImgFormatMemImg" runat="server"
                            ControlToValidate="FileUploadPhoto" Display="Dynamic"
                            ErrorMessage="Incorrect Image format. Image format should be (.jpg, .gif, .png, .jpeg)" Font-Bold="False"
                            OnServerValidate="CVImgFormatMemImg_ServerValidate" ValidationGroup="RIP"
                            CssClass="txt_validation"></asp:CustomValidator>
                    </td>
                </tr>



                <tr>
                    <td class="style4">Upload Logo (Theme)</td>
                    <td class="style1">:</td>
                    <td class="style1">

                        <asp:FileUpload ID="FileUploadLogo" runat="server" Width="508px" />
                        <asp:CustomValidator ID="CVLogo" runat="server"
                            ControlToValidate="FileUploadLogo" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Maximum file size exceeded !"
                            OnServerValidate="CVLogo_ServerValidate" ValidationGroup="RIP"></asp:CustomValidator>
                        <asp:CustomValidator ID="CVImgFormatLogo" runat="server"
                            ControlToValidate="FileUploadLogo" Display="Dynamic"
                            ErrorMessage="Incorrect Image format. Image format should be (.jpg, .gif, .png, .jpeg)" Font-Bold="False"
                            OnServerValidate="CVImgFormatLogo_ServerValidate" ValidationGroup="RIP"
                            CssClass="txt_validation"></asp:CustomValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style4">Upload Convention Image</td>
                    <td class="style1">:</td>
                    <td class="style1">

                        <asp:FileUpload ID="FileUploadConvention" runat="server" Width="508px" />
                        <asp:CustomValidator ID="CVCon" runat="server"
                            ControlToValidate="FileUploadConvention" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Maximum file size exceeded !"
                            OnServerValidate="CVCon_ServerValidate" ValidationGroup="RIP"></asp:CustomValidator>
                        <asp:CustomValidator ID="CVImgFormatCon" runat="server"
                            ControlToValidate="FileUploadConvention" Display="Dynamic"
                            ErrorMessage="Incorrect Image format. Image format should be (.jpg, .gif, .png, .jpeg)" Font-Bold="False"
                            OnServerValidate="CVImgFormatCon_ServerValidate" ValidationGroup="RIP"
                            CssClass="txt_validation"></asp:CustomValidator>
                    </td>
                </tr>



                <tr>
                    <td class="style4">&nbsp;</td>
                    <td class="style1">&nbsp;</td>
                    <td class="style3">( Image format should be .jpg, .gif, .png or .jpeg and file size not more than 300 KB 
                  )</td>
                </tr>

                <tr>
                    <td class="style4">Add Description</td>
                    <td class="style1">:</td>
                    <td class="style3">

                        <telerik:RadEditor ID="txtData" runat="server" EditModes="Design" Skin="Silk" Width="750">
                            <CssFiles>
                                <telerik:EditorCssFile Value="../css/editor.css" />
                            </CssFiles>

                            <Tools>
                                <telerik:EditorToolGroup>
                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                    <telerik:EditorTool Name="LinkManager"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Unlink"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyFull"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyCenter"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyLeft"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyRight"></telerik:EditorTool>
                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                                </telerik:EditorToolGroup>
                            </Tools>

                        </telerik:RadEditor>
                    </td>
                </tr>

                <tr>
                    <td class="style4">
                        <div align="right"></div>
                    </td>
                    <td class="style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                            CssClass="btn" ValidationGroup="RIP" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                            CssClass="btn" CausesValidation="False" /></td>
                </tr>


            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

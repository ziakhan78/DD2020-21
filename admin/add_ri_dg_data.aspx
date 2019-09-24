<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_ri_dg_data.aspx.cs" Inherits="admin_add_ri_dg_data" Title="" %>

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
                    <td colspan="2" class="header_title">Add RI & District Governers Details
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="style2">* </span>Select Year: </div>
                    </td>

                    <td valign="top">

                        <div align="left">
                            <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select year" InitialValue="Select" ValidationGroup="DG"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="style2">* </span>Rotarian Name: </div>
                    </td>
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txtRotarian" runat="server" Width="400px"
                                CssClass="txtBox"></asp:TextBox><asp:RequiredFieldValidator ID="RFVRot" runat="server"
                                    ControlToValidate="txtRotarian" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Can't be left blank" ValidationGroup="DG"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="style2">* </span>Rotary Club of: </div>
                    </td>
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txtClubName" runat="server" Width="400px"
                                CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVClub" runat="server"
                                ControlToValidate="txtClubName" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Can't be left blank" ValidationGroup="DG"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="style2">* </span>Designation: </div>
                    </td>
                    <td>
                        <div align="left">
                            <asp:DropDownList ID="ddlDesignation" runat="server" AppendDataBoundItems="true" CssClass="txtBox">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>RI President</asp:ListItem>
                                <asp:ListItem>RI President Elect</asp:ListItem>
                                <asp:ListItem>RI President Nominee</asp:ListItem>
                                <asp:ListItem>District Governor</asp:ListItem>
                                <asp:ListItem>District Governor Elect</asp:ListItem>
                                <asp:ListItem>District Governor Nominee</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDesignation" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select designation" InitialValue="Select" ValidationGroup="DG"></asp:RequiredFieldValidator>

                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right">Classification: </div>
                    </td>
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txtClassification" runat="server" Width="400px"
                                CssClass="txtBox"></asp:TextBox>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td align="right" valign="top">Upload Image: </td>
                    <td align="left" valign="top">
                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="53" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                        </telerik:RadAsyncUpload>
                        <br />
                        <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and 
                  maximum file size is 400 KB )</strong><br />
                            <br />
                            <asp:Image ID="memImg" runat="server" AlternateText="Image"
                                Height="110px" Width="100px" />
                        </span>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top"><span class="style2">* </span>Add Description:</td>
                    <td class="style3" valign="top">


                        <telerik:RadEditor runat="server" ID="txtDescription" Width="800px" Height="350px" Skin="Silk" EditModes="Design" NewLineMode="Br">
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


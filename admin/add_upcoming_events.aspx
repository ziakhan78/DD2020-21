<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="add_upcoming_events.aspx.cs" Inherits="admin_add_upcoming_events" %>

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
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                    <tr>
                        <td colspan="5" class="header_title">Add Upcoming District Events
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5" align="right"><span class="style2">*</span> Denotes Mandatory field.
                        </td>
                    </tr>


                    <tr>
                        <td class="style3">For Rotary Year</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="rbtnYear" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">2016 - 2017</asp:ListItem>
                                <asp:ListItem Value="1">2017 - 2018</asp:ListItem>
                                <asp:ListItem Value="2">2018 - 2019</asp:ListItem>

                            </asp:RadioButtonList>
                        </td>
                    </tr>


                    <tr>
                        <td class="style3"><span class="style2">*</span> Event Name</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtEventName" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEname" runat="server"
                                ControlToValidate="txtEventName" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Please Enter Event Name" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="style3"><span class="style2">*</span> Event Date</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <telerik:RadDateInput ID="eventDate" runat="server" DateFormat="dd-MM-yyyy" Width="100px" EmptyMessage="dd-mm-yyyy" CssClass="txtBox" Skin="Silk" MinDate="01-01-1900"></telerik:RadDateInput>
                            <asp:RequiredFieldValidator
                                ID="rfvCharterDate" runat="server" ControlToValidate="eventDate"
                                Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="A"
                                CssClass="txt_validation"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="style3">Time</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <telerik:RadDateInput ID="eventTime" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="hh:mm"></telerik:RadDateInput>

                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td class="style3">Venue</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtVenue1" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="style3"></td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtVenue2" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="style3"></td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtVenue3" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="style3">Dress Code</td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="rbtnDressCode" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Smart Casuals</asp:ListItem>
                                <asp:ListItem>Formals</asp:ListItem>
                                <asp:ListItem>Ethnic</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="style3" valign="top">Event Description</td>
                        <td class="style1" valign="top">:</td>
                        <td colspan="3" valign="top">
                            <telerik:RadEditor ID="txtEventDesc" runat="server" EditModes="Design" Skin="Silk" Width="700" Height="250">
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
                        <td class="style3">GPS Coordinates</td>
                        <td class="style1">:</td>
                        <td valign="top" colspan="3">Latitude
                    <asp:TextBox ID="txtGPSLati" runat="server" CssClass="txtBox"></asp:TextBox>&nbsp;Longitude
                    <asp:TextBox ID="txtGPSLongi" runat="server" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td class="style3" valign="top">Upload Event Image</td>
                        <td class="style1" valign="top">:</td>
                        <td colspan="3">
                            <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="53" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload2_FileUploaded">
                            </telerik:RadAsyncUpload>
                            <br />
                            <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and maximum file size is 400 KB )</strong><br />
                                <br />
                                <asp:Image ID="eventImg" runat="server" AlternateText="Image"
                                    Height="110px" Width="100px" />
                            </span>
                        </td>
                    </tr>


                    <tr>
                        <td class="style3" valign="top">Upload Direction Map</td>
                        <td class="style1" valign="top">:</td>
                        <td colspan="3" valign="top">
                            <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="53" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                            </telerik:RadAsyncUpload>
                            <br />
                            <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and maximum file size is 400 KB)</strong><br />
                                <br />
                                <asp:Image ID="mapImg" runat="server" AlternateText="Image"
                                    Height="110px" Width="100px" />
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Event Registration Facility:</td>
                        <td colspan="4">
                            <asp:RadioButtonList ID="rbtnRegister" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnRegister_SelectedIndexChanged">
                                <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr id="trRegister" runat="server">
                        <td colspan="5">
                            <tr>
                                <td colspan="5" class="header_subtitle">Lead Hosts</td>
                            </tr>

                            <tr>
                                <td class="style3">Lead Host Amount(<asp:Image ID="Image10" runat="server" ImageUrl="~/admin_icons/rupee.gif" />) </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <telerik:RadNumericTextBox ID="txtLeadHostAmt" runat="server" CssClass="txt"
                                        MaxLength="5" Width="60px" Skin="Silk">
                                        <NumberFormat AllowRounding="False" DecimalDigits="2"
                                            KeepTrailingZerosOnFocus="True" />
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Lead Hosts</td>
                                <td class="style1">:
                                </td>
                                <td class="style2" colspan="3">
                                    <asp:DropDownList ID="ddlLeadHostClub" runat="server" AppendDataBoundItems="true"
                                        CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name"
                                        DataValueField="id" AutoPostBack="True">
                                        <asp:ListItem Value="0">Select Club Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnPartnerClub" runat="server" Text="Add More..." CssClass="btn" OnClick="btnPartnerClub_Click" />
                                </td>
                            </tr>

                            <tr id="trLeadHost" runat="server">
                                <td class="style3"></td>
                                <td class="style1">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ListBox ID="listHostLubs" runat="server" Height="90px" Width="400px"
                                        CssClass="txtBox"></asp:ListBox>
                                    <br />
                                    <asp:Button ID="btnPartnerClubRemove" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnPartnerClubRemove_Click" />
                                </td>
                            </tr>

                            <tr>
                                <td class="header_subtitle" colspan="5">Co Host-I
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Amount (<asp:Image ID="Image7" runat="server" ImageUrl="~/admin_icons/rupee.gif" />) </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <telerik:RadNumericTextBox ID="txtCoHost1Amt" runat="server" CssClass="txt"
                                        MaxLength="5" Width="60px" Skin="Silk">
                                        <NumberFormat AllowRounding="False" DecimalDigits="2"
                                            KeepTrailingZerosOnFocus="True" />
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Host Title </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtCoHost1Title" runat="server" CssClass="txtBox" Width="200px" placeholder="Co Host Title"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="style3">Co Hosts Club</td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlCohost1Clubs" runat="server" AppendDataBoundItems="true"
                                        CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name"
                                        DataValueField="id" AutoPostBack="True">
                                        <asp:ListItem Value="0">Select Club Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAddCohost" runat="server" Text="Add More..." CssClass="btn" OnClick="btnAddCohost_Click" />
                                </td>
                            </tr>


                            <tr id="trCoHost1" runat="server">
                                <td class="style3"></td>
                                <td class="style1">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ListBox ID="listCoHost1" runat="server" Height="90px" Width="400px"
                                        CssClass="txtBox"></asp:ListBox>
                                    <br />
                                    <asp:Button ID="btnRemoveCohost" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnRemoveCohost_Click" />
                                </td>
                            </tr>


                            <tr>
                                <td class="header_subtitle" colspan="5">Co Host-II
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Host Amount (<asp:Image ID="Image8" runat="server" ImageUrl="~/admin_icons/rupee.gif" />) </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <telerik:RadNumericTextBox ID="txtCoHost2Amt" runat="server" CssClass="txt"
                                        MaxLength="5" Width="60px" Skin="Silk">
                                        <NumberFormat AllowRounding="False" DecimalDigits="2"
                                            KeepTrailingZerosOnFocus="True" />
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Host Title </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtCoHost2Title" runat="server" CssClass="txtBox" Width="200px" placeholder="Co Host Title"></asp:TextBox>

                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Hosts Clubs</td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlCohost2Clubs" runat="server" AppendDataBoundItems="true"
                                        CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name"
                                        DataValueField="id" AutoPostBack="True">
                                        <asp:ListItem Value="0">Select Club Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAddCohost2" runat="server" Text="Add More..." CssClass="btn" OnClick="btnAddCohost2_Click" />
                                </td>
                            </tr>

                            <tr id="trCoHost2" runat="server">
                                <td class="style3"></td>
                                <td class="style1">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ListBox ID="listCoHost2" runat="server" Height="90px" Width="400px"
                                        CssClass="txtBox"></asp:ListBox>
                                    <br />
                                    <asp:Button ID="btnRemoveCohost2" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnRemoveCohost2_Click" />
                                </td>
                            </tr>


                            <tr>
                                <td class="header_subtitle" colspan="5">Co Host-III
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Host Amount (<asp:Image ID="Image12" runat="server" ImageUrl="~/admin_icons/rupee.gif" />) </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <telerik:RadNumericTextBox ID="txtCoHost3Amt" runat="server" CssClass="txt"
                                        MaxLength="5" Width="60px" Skin="Silk">
                                        <NumberFormat AllowRounding="False" DecimalDigits="2"
                                            KeepTrailingZerosOnFocus="True" />
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style3">Co Host Title </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtCoHost3Title" runat="server" CssClass="txtBox" Width="200px" placeholder="Co Host Title"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td class="style3">Co Hosts Clubs</td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlCohost3Clubs" runat="server" AppendDataBoundItems="true"
                                        CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name"
                                        DataValueField="id" AutoPostBack="True">
                                        <asp:ListItem Value="0">Select Club Name</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAddCohost3" runat="server" Text="Add More..." CssClass="btn" OnClick="btnAddCohost3_Click" />
                                </td>
                            </tr>

                            <tr id="trCoHost3" runat="server">
                                <td class="style3"></td>
                                <td class="style1">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ListBox ID="listCoHost3" runat="server" Height="90px" Width="400px"
                                        CssClass="txtBox"></asp:ListBox>
                                    <br />
                                    <asp:Button ID="btnRemoveCohost3" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnRemoveCohost3_Click" />
                                </td>
                            </tr>


                            <tr>
                                <td class="header_subtitle" colspan="5">Committee of Host
                                </td>
                            </tr>

                            <tr>
                                <td class="style3">Committee of Host Amount(<asp:Image ID="Image11" runat="server" ImageUrl="~/admin_icons/rupee.gif" />) </td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <telerik:RadNumericTextBox ID="txtCommitteeHostAmt" runat="server" CssClass="txt"
                                        MaxLength="5" Width="60px" Skin="Silk">
                                        <NumberFormat AllowRounding="False" DecimalDigits="2"
                                            KeepTrailingZerosOnFocus="True" />
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="style3">Committee of Hosts</td>
                                <td class="style1">:</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlCommitteeHOfHost" runat="server" AppendDataBoundItems="True"
                                        CssClass="txtBox" DataSourceID="DsAllMembers" DataTextField="Name"
                                        DataValueField="MemberId">
                                        <asp:ListItem>Select</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAddCommitteeOfHosts" runat="server" Text="Add More..." CssClass="btn" OnClick="btnAddCommitteeOfHosts_Click" />
                                </td>
                            </tr>

                            <tr id="trCommitteeHost" runat="server">
                                <td class="style3"></td>
                                <td class="style1">&nbsp;</td>

                                <td colspan="3">
                                    <asp:ListBox ID="listCommitteeOfHosts" runat="server" Height="150px" Width="400px"
                                        CssClass="txtBox"></asp:ListBox>
                                    <br />
                                    <asp:Button ID="btnRemoveCommitteeOfHosts" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnRemoveCommitteeOfHosts_Click" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="5" class="header_subtitle">Registration Charges
                                </td>
                            </tr>

                              <tr>
                        <td align="right">Registration Charge:</td>
                        <td colspan="4">
                            <asp:RadioButtonList ID="rbtnRegCharge" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnRegCharge_SelectedIndexChanged" >
                                <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                           <tr>
                               <td colspan="3">
                                   <asp:Panel ID="RegistrationPanel" runat="server">


                                 


                            <tr>
                                <td colspan="5" width="100%">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="style3" width="206px">Cost (<asp:Image ID="Image1" runat="server" ImageUrl="~/admin_icons/rupee.gif" />)</td>
                                            <td class="style1">:</td>

                                            <td>From : 
                    <telerik:RadDatePicker ID="dateFC1" runat="server"
                        Culture="English (United Kingdom)" Skin="Silk">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                            ViewSelectorText="x" Skin="Silk">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadDatePicker>
                                            </td>
                                            <td>To : 
                    <telerik:RadDatePicker ID="dateTC1" runat="server"
                        Culture="English (United Kingdom)" Skin="Silk">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                            ViewSelectorText="x" Skin="Silk">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/admin_icons/rupee.gif" />
                                                <telerik:RadNumericTextBox ID="txtCost1" runat="server" CssClass="txt"
                                                    MaxLength="5" Width="60px" Skin="Silk">
                                                    <NumberFormat AllowRounding="False" DecimalDigits="2"
                                                        KeepTrailingZerosOnFocus="True" />
                                                </telerik:RadNumericTextBox>&nbsp;per person</td>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="5" width="100%">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="style3" width="206px">Cost (<asp:Image ID="Image2" runat="server" ImageUrl="~/admin_icons/rupee.gif" />)</td>
                                            <td class="style1">:</td>

                                            <td>From :
                                    <telerik:RadDatePicker ID="dateFC2" runat="server"
                                        Culture="English (United Kingdom)" Skin="Silk">
                                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                                            ViewSelectorText="x" Skin="Silk">
                                        </Calendar>
                                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </DateInput>
                                    </telerik:RadDatePicker>
                                            </td>
                                            <td>To : 
                    <telerik:RadDatePicker ID="dateTC2" runat="server"
                        Culture="English (United Kingdom)" Skin="Silk">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                            ViewSelectorText="x" Skin="Silk">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadDatePicker>
                                            </td>

                                            <td>
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/admin_icons/rupee.gif" />
                                                <telerik:RadNumericTextBox ID="txtCost2" runat="server" CssClass="txt"
                                                    MaxLength="5" Width="60px" Skin="Silk">
                                                    <NumberFormat AllowRounding="False" DecimalDigits="2"
                                                        KeepTrailingZerosOnFocus="True" />
                                                </telerik:RadNumericTextBox>&nbsp;per person</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="5" width="100%">
                                    <table style="width: 100%">

                                        <tr>
                                            <td class="style3" width="206px">Cost (<asp:Image ID="Image3" runat="server" ImageUrl="~/admin_icons/rupee.gif" />)</td>
                                            <td class="style1">:</td>

                                            <td>From : 
                    <telerik:RadDatePicker ID="dateFC3" runat="server"
                        Culture="English (United Kingdom)" Skin="Silk">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                            ViewSelectorText="x" Skin="Silk">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadDatePicker>
                                            </td>
                                            <td>To :
                                        <telerik:RadDatePicker ID="dateTC3" runat="server"
                                            Culture="English (United Kingdom)" Skin="Silk">
                                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                                                ViewSelectorText="x" Skin="Silk">
                                            </Calendar>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                        </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/admin_icons/rupee.gif" />
                                                <telerik:RadNumericTextBox ID="txtCost3" runat="server" CssClass="txt"
                                                    MaxLength="5" Width="60px" Skin="Silk">
                                                    <NumberFormat AllowRounding="False" DecimalDigits="2"
                                                        KeepTrailingZerosOnFocus="True" />
                                                </telerik:RadNumericTextBox>&nbsp;per person</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                              <tr>
                                <td colspan="5" class="header_subtitle">Payment Details:
                                </td>
                            </tr>

                            <tr>
                                <td valign="top" align="right" >
                                    Payment send to Acount of: 
                                </td>
                                <td colspan="4" >
                                   <asp:TextBox ID="txtAccountName" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox></td>
                            </tr>

                             <tr>
                                <td colspan="5" class="header_subtitle">Where to send Payment:
                                </td>
                            </tr>

                            <tr>
                                <td valign="top" align="right" >
                                    Address: 
                                </td>
                                <td colspan="4" >
                                    <telerik:RadEditor ID="txtPayAddress" runat="server" EditModes="Design" Height="250" Skin="Silk" NewLineMode="Br" >
                                        <CssFiles>
                                            <telerik:EditorCssFile Value="../css/editor.css" />
                                        </CssFiles>
                                        <Tools>
                                            <telerik:EditorToolGroup>
                                                <telerik:EditorTool Name="Bold" />
                                                <telerik:EditorTool Name="Italic" />
                                                <telerik:EditorTool Name="Underline" />
                                               <%-- <telerik:EditorTool Name="LinkManager" />
                                                <telerik:EditorTool Name="Unlink" />
                                                <telerik:EditorTool Name="JustifyFull" />
                                                <telerik:EditorTool Name="JustifyCenter" />
                                                <telerik:EditorTool Name="JustifyLeft" />
                                                <telerik:EditorTool Name="JustifyRight" />
                                                <telerik:EditorTool Name="InsertUnorderedList" />
                                                <telerik:EditorTool Name="InsertOrderedList" />--%>
                                            </telerik:EditorToolGroup>
                                        </Tools>
                                    </telerik:RadEditor></td>
                            </tr>

                                         </asp:Panel>

                               </td>
                           </tr>

                        </td>
                    </tr>






                    <tr>
                        <td class="style3">&nbsp;</td>
                        <td class="style1">&nbsp;</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                    CssClass="btn"
                                    ValidationGroup="A" OnClick="btnSubmit_Click" />
                                &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel"
                                    CssClass="btn" CausesValidation="False" />
                                <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                    SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="DSMembers" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                    SelectCommand="SELECT * FROM [ViewMembers] WHERE district_no='3141' and MemType='Active' and ([DistrictClubID] = @DistrictClubID) ORDER BY [Name]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlLeadHostClub" Name="DistrictClubID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:SqlDataSource ID="DsAllMembers" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                    SelectCommand="SELECT * FROM [ViewMembers] where district_no='3141' and MemType='Active' ORDER BY [Name]"></asp:SqlDataSource>
                            </div>
                        </td>
                    </tr>

                </table>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>





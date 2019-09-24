<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_projects.aspx.cs" Inherits="admin_add_projects" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function OnClientValidationFailed(sender, args) {
            var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
            if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                if (sender.get_allowedFileExtensions().indexOf(fileExtention)) {
                    alert("Wrong file extension!");
                }
                else {
                    alert("File size exceeds the maximum allowed size!");
                }
            }
            else {
                alert("Not correct extension!");
            }
        }
    </script>

    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style2 {
            text-align: left;
        }

        .auto-style1 {
            text-align: right;
            height: 23px;
        }

        .auto-style2 {
            height: 23px;
        }

        .auto-style3 {
            color: #FF0000;
        }

        .auto-style4 {
            text-align: right;
            color: #FF0000;
        }
    </style>

  <%--  <style type="text/css">
        /*body {
            font-family: Arial;
            font-size: 10pt;
        }*/

        table {
            width: 100%;
            margin-bottom: -1px;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

           <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
                <tr>
                    <td colspan="3" class="header_title">Add Projects</td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style1" colspan="3"><span class="auto-style3"><strong>*</strong></span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td colspan="3" class="header_subtitle">Project Details</td>
                </tr>

                 <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Club Name</td>
                    <td>:</td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLClub" runat="server" AppendDataBoundItems="true" AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name" DataValueField="ri_club_no" OnSelectedIndexChanged="DDLClub_SelectedIndexChanged">
                            <asp:ListItem>Select Club Name</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Year</td>
                    <td>:</td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLYears" runat="server" AutoPostBack="True" CssClass="txtBox">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Start Date</td>
                    <td>:</td>
                    <td class="style2">
                        <telerik:RadDatePicker ID="dtStartDate" runat="server" Culture="(Default)" Skin="Silk">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="dtStartDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Start Date" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Completion Date</td>
                    <td>:</td>
                    <td class="style2">
                        <telerik:RadDatePicker ID="dtEndDate" runat="server" Culture="(Default)" Skin="Silk">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="dtEndDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Completion Date" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <%--  <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Name of Club</td>
                    <td>:</td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLClubName2" runat="server" AppendDataBoundItems="true" AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="title1" DataValueField="id" OnSelectedIndexChanged="DDLClubName2_SelectedIndexChanged">
                            <asp:ListItem>Select Club Name</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvClubname" runat="server" ControlToValidate="DDLClubName2" CssClass="txt_validation" ErrorMessage="Select Club Name" InitialValue="Select Club Name" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>


                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Title</td>
                    <td>:</td>
                    <td>

                        <asp:TextBox ID="txtProName" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectTitle" runat="server" ControlToValidate="txtProName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Title" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Type of Project</td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:RadioButtonList ID="rbtnProjectType" runat="server"
                            RepeatDirection="Horizontal" AutoPostBack="True"
                            OnSelectedIndexChanged="rbtnProjectType_SelectedIndexChanged" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">Club Project</asp:ListItem>
                            <asp:ListItem Value="1">Joint Project</asp:ListItem>
                            <asp:ListItem Value="2">District Grant Project</asp:ListItem>
                            <asp:ListItem Value="3">Global Grant Project</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>


                <tr id="TRDistrictGrantNo" runat="server">
                    <td class="style1">District Grant No.
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtDistGrantNo" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr id="TRGlobalGrantNo" runat="server">
                    <td class="style1">Global Grant No.
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtGlobalGrantNo" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>


                <tr id="TRDistType_Joint" runat="server">
                    <td class="style1">Partner Club District No.</td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:RadioButtonList ID="rbtnDistNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbtnDistNo_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="True" Value="0">3141</asp:ListItem>
                            <asp:ListItem Value="1">Other</asp:ListItem>
                        </asp:RadioButtonList>
                        &nbsp;
                        <telerik:RadNumericTextBox ID="txtDistrictNo" runat="server" CssClass="txtBox" MaxLength="5" Width="80px" Skin="Silk">
                            <NumberFormat DecimalDigits="0" GroupSeparator="" GroupSizes="7" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>

                <tr id="TRPartnerClub_Joint" runat="server">
                    <td class="style1">Partner Club Name</td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                            AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo"
                            DataTextField="club_name" DataValueField="id">
                            <asp:ListItem>Select Club Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:TextBox ID="txtDistClubName" runat="server" Width="350px" CssClass="txtBox">RC of </asp:TextBox>
                        <asp:Button ID="btnPartnerClub" runat="server" Text="Add More..." CssClass="btn" OnClick="btnPartnerClub_Click" />
                    </td>
                </tr>

                <tr id="TRPartnerClub_JointList" runat="server" valign="top">
                    <td class="style1">Partner Club List</td>
                    <td align="center" valign="top">:</td>
                    <td valign="middle" class="auto-style2">
                        <asp:ListBox ID="listPartnerClub" runat="server" Height="150px" Width="300px"
                            CssClass="txtBox"></asp:ListBox>
                        <br />
                        <asp:Button ID="btnPartnerClubRemove" runat="server" CssClass="btn" Text="Remove" Width="100px" OnClick="btnPartnerClubRemove_Click" />
                    </td>
                </tr>




                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Location
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtProjectLocation" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectLocation" runat="server" ControlToValidate="txtProjectLocation" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Location" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>




                <tr>
                    <td valign="top" class="style1"><span class="auto-style3"><strong>*</strong></span>Project Description</td>
                    <td valign="top">:
                    </td>
                    <td class="style1">

                        <div align="left">
                            <asp:TextBox ID="txtDesc" runat="server" Width="750px" TextMode="MultiLine"
                                Height="130px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProjectDesc" runat="server" ControlToValidate="txtDesc" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Description" ValidationGroup="P"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Cost (&#8377;)</td>
                    <td>:</td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtProjectCost" runat="server" MaxLength="8" Width="80px" CssClass="txtBox" Skin="Silk">
                            <NumberFormat DecimalDigits="2" GroupSeparator="," GroupSizes="3" />
                        </telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectCost" runat="server" ControlToValidate="txtProjectCost" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Cost" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Avenue of Service Covered</td>
                    <td>:</td>
                    <td class="style2">

                        <asp:DropDownList ID="ddlAvenueCovered" runat="server" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Club Service</asp:ListItem>
                            <asp:ListItem>Community Service - Medical</asp:ListItem>
                            <asp:ListItem>Community Service - Non Medical</asp:ListItem>
                            <asp:ListItem>International Service</asp:ListItem>
                            <asp:ListItem>New Generations</asp:ListItem>
                            <asp:ListItem>Vocational Service</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvAveCovered" runat="server" ControlToValidate="ddlAvenueCovered" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Avenue of Service Covered" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Project Chairperson</td>
                    <td>:</td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLChairperson" runat="server" AppendDataBoundItems="True" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvChairPerson" runat="server" ControlToValidate="DDLChairperson" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Chairperson" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Committees Members</td>
                    <td>:</td>
                    <td class="style2">
                        <asp:DropDownList ID="DDLMembers" runat="server" AppendDataBoundItems="True" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btnAddmore" runat="server" CssClass="btn" OnClick="btnAddmore_Click" Text="Add More..." ValidationGroup="add" />
                    </td>
                </tr>

                <tr id="TRTopics" runat="server" valign="top">
                    <td class="style1">&nbsp;</td>
                    <td align="center" valign="top">&nbsp;</td>
                    <td valign="middle" class="auto-style2">
                        <asp:ListBox ID="listTopics" runat="server" Height="150px" Width="300px"
                            CssClass="txtBox"></asp:ListBox>
                        <br />
                        <asp:Button ID="btnRemove" runat="server" CssClass="btn"
                            OnClick="btnRemove_Click" Text="Remove" Width="100px" />
                    </td>
                </tr>

                <tr>
                    <td class="style1" valign="top">Beneficiaries</td>
                    <td valign="top">:</td>
                    <td class="style2">

                        <asp:TextBox ID="txtBeneficiaries" runat="server" Width="750px" Height="130px"
                            TextMode="MultiLine" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>





                <tr>
                    <td colspan="3" class="header_subtitle">Project Address</td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>Address
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtAdd1" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectAdd" runat="server" ControlToValidate="txtAdd1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project Address" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;
                    </td>
                    <td></td>
                    <td class="style2">
                        <asp:TextBox ID="txtAdd2" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1"><span class="auto-style3"><strong>*</strong></span>City
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtCity" runat="server" Width="250px" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProjectCity" runat="server" ControlToValidate="txtCity" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Enter Project City" ValidationGroup="P"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        <div align="right">
                            Pin
                        </div>
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtPin" runat="server" Width="100px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        <div align="right">State</div>
                    </td>
                    <td>:</td>
                    <td class="style2">

                        <div align="left">
                            <asp:TextBox ID="txtState" runat="server" Width="250px" CssClass="txtBox"></asp:TextBox>
                            &nbsp;
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        <div align="right">
                            Country
                        </div>
                    </td>
                    <td>:
                    </td>
                    <td class="style2">
                        <div align="left">
                            <asp:TextBox ID="txtCountry" runat="server" Width="250px" CssClass="txtBox"></asp:TextBox>
                            &nbsp;
                        </div>
                    </td>
                </tr>



                <tr>
                    <td class="style1">Phone No. 1
                    </td>
                    <td>:
                    </td>
                    <td class="style2">

                        <div align="left">
                            <telerik:RadTextBox ID="txtPhCC1" runat="server" LabelWidth="64px" MaxLength="3" Width="35px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                                        <telerik:RadTextBox ID="txtPhAC1" runat="server" LabelWidth="64px" MaxLength="4" Width="40px" CssClass="txtBox" Skin="Silk">
                                        </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                    <telerik:RadNumericTextBox ID="txtPh1" runat="server" MaxLength="8" Width="80px" CssClass="txtBox" Skin="Silk">
                        <NumberFormat DecimalDigits="0" GroupSeparator="" GroupSizes="9" />
                    </telerik:RadNumericTextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="style1">Phone No. 2
                    </td>
                    <td>:
                    </td>
                    <td class="style2">

                        <div align="left">
                            <telerik:RadTextBox ID="txtPhCC2" runat="server" LabelWidth="64px" MaxLength="3" Width="35px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                                        <telerik:RadTextBox ID="txtPhAC2" runat="server" LabelWidth="64px" MaxLength="4" Width="40px" CssClass="txtBox" Skin="Silk">
                                        </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                    <telerik:RadNumericTextBox ID="txtPh2" runat="server" MaxLength="8" Width="80px" CssClass="txtBox" Skin="Silk">
                        <NumberFormat DecimalDigits="0" GroupSeparator="" GroupSizes="9" />
                    </telerik:RadNumericTextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="style1">Fax No.
                    </td>
                    <td>:
                    </td>
                    <td class="style2">

                        <div align="left">
                            <telerik:RadTextBox ID="txtFaxCC" runat="server" LabelWidth="64px" MaxLength="3" Width="35px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                                        <telerik:RadTextBox ID="txtFaxAC" runat="server" LabelWidth="64px" MaxLength="4" Width="40px" CssClass="txtBox" Skin="Silk">
                                        </telerik:RadTextBox>
                            &nbsp;-&nbsp;
                    <telerik:RadNumericTextBox ID="txtFax" runat="server" MaxLength="8" Width="80px" CssClass="txtBox" Skin="Silk">
                        <NumberFormat DecimalDigits="0" GroupSeparator="" GroupSizes="9" />
                    </telerik:RadNumericTextBox>
                        </div>
                    </td>
                </tr>



                <tr>
                    <td class="style1">Website
                    </td>
                    <td>:
                    </td>
                    <td class="style2">

                        <div align="left">
                            <asp:TextBox ID="txtWebsite" runat="server" Width="450px" Text="http://www." CssClass="txtBox"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr id="TR1" runat="server">
                    <td class="style1">Geographical Coordinates 
                    </td>
                    <td>:
                    </td>
                    <td class="style2">Latitude :
                        <asp:TextBox ID="txtGeoLatitude" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>&nbsp;                        
                        Longitude :
                        <asp:TextBox ID="txtGeoLongitude" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1" valign="top">Direction to Project Site</td>
                    <td valign="top">:</td>
                    <td class="style2">

                        <asp:TextBox ID="txtProjectDrection" runat="server" Height="50px" TextMode="MultiLine"
                            Width="750px" CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="header_subtitle">Project Contact Persons</td>
                </tr>

                <tr>
                    <td colspan="3">



                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1"
                            DataKeyNames="id" EmptyDataText="No records has been added.">
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150" />
                                <asp:BoundField DataField="designation" HeaderText="Designation" ItemStyle-Width="150" />
                                <asp:BoundField DataField="emailId" HeaderText="Email-Id" ItemStyle-Width="150" />
                                <asp:BoundField DataField="mobile" HeaderText="Mobile" ItemStyle-Width="150" />
                                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="100" HeaderText="Action" />
                            </Columns>
                        </asp:GridView>
                        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                            <tr>
                                <td style="width: 210px" align="left">Name:<br />
                                    <asp:TextBox ID="txtName" runat="server" Width="200" MaxLength="30" CssClass="txtBox" />
                                    <asp:RequiredFieldValidator ID="rfvCname" runat="server" ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="CP"></asp:RequiredFieldValidator>

                                </td>
                                <td style="width: 150px" align="left">Designation:<br />
                                    <asp:TextBox ID="txtDesignation" runat="server" Width="140" MaxLength="30" CssClass="txtBox" />
                                </td>
                                <td style="width: 210px" align="left">Email-Id:<br />
                                    <asp:TextBox ID="txtEmailId" runat="server" Width="200" MaxLength="30" CssClass="txtBox" />
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailId" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="CP"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmailId" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid email-id!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="CP"></asp:RegularExpressionValidator>

                                </td>
                                <td style="width: 120px" align="left">Mobile:<br />
                                    <asp:TextBox ID="txtMobile" runat="server" Width="110" MaxLength="10" CssClass="txtBox" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" CssClass="btn" ValidationGroup="CP" />
                                </td>
                            </tr>
                        </table>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM project_contact_tbl where project_id=@project_id"
                            InsertCommand="INSERT INTO project_contact_tbl VALUES (0, @name, @designation, @emailId, @mobile)"
                            UpdateCommand="UPDATE project_contact_tbl SET name = @name, designation = @designation, emailId=@emailId, mobile=@mobile WHERE id = @id"
                            DeleteCommand="DELETE FROM project_contact_tbl WHERE id = @id">
                            <InsertParameters>
                                <asp:ControlParameter Name="name" ControlID="txtName" Type="String" />
                                <asp:ControlParameter Name="designation" ControlID="txtDesignation" Type="String" />
                                <asp:ControlParameter Name="emailId" ControlID="txtEmailId" Type="String" />
                                <asp:ControlParameter Name="mobile" ControlID="txtMobile" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="designation" Type="String" />
                                <asp:Parameter Name="emailId" Type="String" />
                                <asp:Parameter Name="mobile" Type="String" />
                            </UpdateParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="id" Name="project_id" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="header_subtitle">Project Images</td>
                </tr>

                <tr>
                    <td class="style1" valign="top">Upload Image</td>
                    <td valign="top">:</td>
                    <td class="style2">
                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="57" MaxFileInputsCount="30" OnClientValidationFailed="OnClientValidationFailed" MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg" EnableInlineProgress="true" MultipleFileSelection="Automatic" Skin="Default" />
                        <br />
                        <span class="auto-style4"><strong>Please upload only 30 images and image format only .jpeg or .jpg, maximum file size 500 kb.</strong></span>
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="3">
                        <table cellpadding="5" cellspacing="5" width="100%">
                            <tr>

                                <td align="center">
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("project_images") %>' Visible="false"></asp:Label>
                                            <div style="float: left; margin: 8px;">
                                                <asp:Image ID="img1" runat="server" BorderWidth="0" Height="100px" Width="100px" /><br />
                                                <br />
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("project_images") %>' CommandName="Delete" AlternateText="Delete" ToolTip="Delete Image" ImageUrl="~/admin_icons/delete.gif" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>

                    <td colspan="3">
                        <div align="center">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="P" />
                            &nbsp;
                            <asp:Button ID="btncancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btncancel_Click" Text="Cancel" />
                            <%--<asp:SqlDataSource ID="DSDistClubNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [View_AllClubs] order by club_name asc"></asp:SqlDataSource>--%>
                             <asp:SqlDataSource ID="DSDistClubNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="DSdistMembers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [MemberId], [Name] FROM [ViewMembers] ORDER BY [Name]"></asp:SqlDataSource>
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


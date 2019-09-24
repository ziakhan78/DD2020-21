<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_club_details.aspx.cs" Inherits="admin_view_club_details" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: RI District-3141 | Admin ::</title>

    <link href="../css/popup.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="holder_dhy">
            <header></header>
            <section>

                <table style="width: 1000px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                     <tr>
                        <td colspan="4" class="header_subtitle">Club Details</td>                        
                    </tr>


                    <tr>
                        <td align="right" width="200px"><b>Rotary Club of:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblClubName" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right"><b>Club No.:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblClubNo" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right"><b>Charter Date:</b></td>
                        <td class="auto-style1">

                            <asp:Label ID="lblCharterDate" runat="server"></asp:Label>

                        </td>
                        <td class="style1" colspan="2">

                            &nbsp;</td>
                    </tr>
                     <tr>
                        <td align="right">Members:</td>
                        <td class="style1">

                            <asp:Label ID="lblMembers" runat="server"></asp:Label>

                        </td>
                        <td class="style1" colspan="2">

                            &nbsp;</td>
                    </tr>

                      <tr>
                        <td align="right">Women Members:</td>
                        <td class="style1">

                            <asp:Label ID="lblWomensMembers" runat="server"></asp:Label>

                        </td>
                        <td class="style1" colspan="2">

                            &nbsp;</td>
                    </tr>

                      <tr>
                        <td align="right">Inner Wheel Clubs:</td>
                        <td class="style1">
                            <asp:Label ID="lblInnerWheelClubs" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right">Rotaract Clubs:</td>
                        <td class="style1">
                            <asp:Label ID="lblRotaractClubs" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right">Interact Clubs:</td>
                        <td class="style1">
                            <asp:Label ID="lblInteractClubs" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right">Sr. Citizen Clubs:</td>
                        <td class="style1">
                            <asp:Label ID="lblSrCitizenClubs" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right">RCC Clubs:</td>
                        <td class="style1">
                            <asp:Label ID="lblRccClubs" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Meeting Venue:</td>
                        <td class="style1">
                            <asp:Label ID="lblVenue" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Day:</td>
                        <td class="style1">

                            <asp:Label ID="lblMeetingDay" runat="server"></asp:Label>

                        </td>
                        <td class="style1" colspan="2">

                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Time:</td>
                        <td class="style1">

                            <asp:Label ID="lblMeetingTime" runat="server"></asp:Label>

                        </td>
                        <td class="style1" colspan="2">

                            &nbsp;</td>
                    </tr>  
                    
                     <tr>
                        <td align="right"><b>District Secretary:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblDS" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right"><b>Assistant Trainer:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblAT" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right"><b>Assistant Governor:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblAG" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right"><b>OCV:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblOcv" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right"><b>Installation:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblInstallation" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>
                 

                 

                     <tr>
                        <td colspan="4" class="header_subtitle">President Details</td>
                        
                    </tr>

                    <tr>
                        <td align="right"><strong>Name:</strong></td>
                        <td class="style1">
                            <strong>
                            <asp:Label ID="lblPresidentName" runat="server"></asp:Label>
                            </strong>
                        </td>
                        <td class="style1" rowspan="7">
                            <asp:Image ID="imgPresident" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td class="style1" rowspan="7">
                            <asp:Image ID="imgPresidentSpouse" runat="server" Height="100px" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">JR (Joined Rotary):</td>
                        <td class="style1">
                            <asp:Label ID="lblJr" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Classification:</td>
                        <td class="style1">
                            <asp:Label ID="lblClassification" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><b>Mobile:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right"><b>Email:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Tel. Office:</td>
                        <td class="style1">
                            <asp:Label ID="lblPhOffice" runat="server"></asp:Label>
                        </td>
                        
                    </tr>

                     <tr>
                        <td align="right">Tel. Residence:</td>
                        <td class="style1">
                            <asp:Label ID="lblPhResi" runat="server"></asp:Label>
                        </td>
                       
                    </tr>

                     <tr>
                        <td align="right" style="vertical-align:top;">Address:</td>
                        <td class="style1">
                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Birthday:</td>
                        <td class="style1">
                            <asp:Label ID="lblDob" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Blood Group:</td>
                        <td class="style1">
                            <asp:Label ID="lblBg" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Wedding Date:</td>
                        <td class="style1">
                            <asp:Label ID="lblAnni" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Name:</td>
                        <td class="style1">
                            <asp:Label ID="lblSpouseName" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Birthday:</td>
                        <td class="style1">
                            <asp:Label ID="lblSdob" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Blood Group:</td>
                        <td class="style1">
                            <asp:Label ID="lblSbg" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>


                    <tr>
                        <td colspan="4" class="header_subtitle">Secretary Details</td>
                        
                    </tr>

                    <tr>
                        <td align="right"><b>Name:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblSecretaryName" runat="server"></asp:Label>
                        </td>
                        <td class="style1" rowspan="7">
                            <asp:Image ID="imgSecretary" runat="server" Height="100px" Width="100px" />
                            </td>
                        <td class="style1" rowspan="7">
                            <asp:Image ID="imgSecretarySpouse" runat="server" Height="100px" Width="100px" /></td>
                    </tr>
                    <tr>
                        <td align="right">JR (Joined Rotary):</td>
                        <td class="style1">
                            <asp:Label ID="lblSecJr" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Classification:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecClassi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><b>Mobile:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblSecMobile" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right"><b>Email:</b></td>
                        <td class="auto-style1">
                            <asp:Label ID="lblSecEmail" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Tel. Office:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecPhOffice" runat="server"></asp:Label>
                        </td>
                       
                    </tr>

                     <tr>
                        <td align="right">Tel. Residence:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecPhResi" runat="server"></asp:Label>
                        </td>
                       
                    </tr>

                     <tr>
                        <td align="right" style="vertical-align:top;">Address:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecAddress" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Birthday:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecDob" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Blood Group:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecBg" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Wedding Date:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecAnni" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Name:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecSpouse" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Birthday:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecSdob" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                     <tr>
                        <td align="right">Spouse Blood Group:</td>
                        <td class="style1">
                            <asp:Label ID="lblSecSbg" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                      <tr>
                        <td colspan="4" class="header_subtitle">BOD Details</td>
                        
                    </tr>

                     <tr>
                        <td colspan="4" >
                            <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                       <%-- <telerik:GridBoundColumn DataField="MemberId" DataType="System.Int32" FilterControlAltText="Filter MemberId column" HeaderText="MemberId" SortExpression="MemberId" UniqueName="MemberId">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DistrictClubID" DataType="System.Int32" FilterControlAltText="Filter DistrictClubID column" HeaderText="DistrictClubID" SortExpression="DistrictClubID" UniqueName="DistrictClubID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MembershipNo" DataType="System.Int32" FilterControlAltText="Filter MembershipNo column" HeaderText="MembershipNo" SortExpression="MembershipNo" UniqueName="MembershipNo">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MemType" FilterControlAltText="Filter MemType column" HeaderText="MemType" SortExpression="MemType" UniqueName="MemType">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CharterMember" FilterControlAltText="Filter CharterMember column" HeaderText="CharterMember" SortExpression="CharterMember" UniqueName="CharterMember">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FName" FilterControlAltText="Filter FName column" HeaderText="FName" SortExpression="FName" UniqueName="FName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MName" FilterControlAltText="Filter MName column" HeaderText="MName" SortExpression="MName" UniqueName="MName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LName" FilterControlAltText="Filter LName column" HeaderText="LName" SortExpression="LName" UniqueName="LName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CallName" FilterControlAltText="Filter CallName column" HeaderText="CallName" SortExpression="CallName" UniqueName="CallName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Suffix" FilterControlAltText="Filter Suffix column" HeaderText="Suffix" SortExpression="Suffix" UniqueName="Suffix">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="designation" FilterControlAltText="Filter designation column" HeaderText="Designation" SortExpression="designation" UniqueName="designation">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" ReadOnly="True" SortExpression="Name" UniqueName="Name">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="EmailId" FilterControlAltText="Filter EmailId column" HeaderText="EmailId" SortExpression="EmailId" UniqueName="EmailId">
                                        </telerik:GridBoundColumn>
                                         <%--<telerik:GridBoundColumn DataField="MobileCc1" FilterControlAltText="Filter MobileCc1 column" HeaderText="MobileCc1" SortExpression="MobileCc1" UniqueName="MobileCc1">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="Mobile1" FilterControlAltText="Filter Mobile1 column" HeaderText="Mobile" SortExpression="Mobile1" UniqueName="Mobile1">
                                        </telerik:GridBoundColumn>

                                      <%--  <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Classification" FilterControlAltText="Filter Classification column" HeaderText="Classification" SortExpression="Classification" UniqueName="Classification">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Qualification" FilterControlAltText="Filter Qualification column" HeaderText="Qualification" SortExpression="Qualification" UniqueName="Qualification">
                                        </telerik:GridBoundColumn> <telerik:GridBoundColumn DataField="AltEmailId" FilterControlAltText="Filter AltEmailId column" HeaderText="AltEmailId" SortExpression="AltEmailId" UniqueName="AltEmailId">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Password" FilterControlAltText="Filter Password column" HeaderText="Password" SortExpression="Password" UniqueName="Password">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DOB" DataType="System.DateTime" FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" UniqueName="DOB">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BG" FilterControlAltText="Filter BG column" HeaderText="BG" SortExpression="BG" UniqueName="BG">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Hobbies" FilterControlAltText="Filter Hobbies column" HeaderText="Hobbies" SortExpression="Hobbies" UniqueName="Hobbies">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RHF" FilterControlAltText="Filter RHF column" HeaderText="RHF" SortExpression="RHF" UniqueName="RHF">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TrfAmt" DataType="System.Decimal" FilterControlAltText="Filter TrfAmt column" HeaderText="TrfAmt" SortExpression="TrfAmt" UniqueName="TrfAmt">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TRF" FilterControlAltText="Filter TRF column" HeaderText="TRF" SortExpression="TRF" UniqueName="TRF">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DOJ" DataType="System.DateTime" FilterControlAltText="Filter DOJ column" HeaderText="DOJ" SortExpression="DOJ" UniqueName="DOJ">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FoodPreference" FilterControlAltText="Filter FoodPreference column" HeaderText="FoodPreference" SortExpression="FoodPreference" UniqueName="FoodPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DrinkPreference" FilterControlAltText="Filter DrinkPreference column" HeaderText="DrinkPreference" SortExpression="DrinkPreference" UniqueName="DrinkPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ProposedBy" FilterControlAltText="Filter ProposedBy column" HeaderText="ProposedBy" SortExpression="ProposedBy" UniqueName="ProposedBy">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MorningBTTC" FilterControlAltText="Filter MorningBTTC column" HeaderText="MorningBTTC" SortExpression="MorningBTTC" UniqueName="MorningBTTC">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="NoonBTTC" FilterControlAltText="Filter NoonBTTC column" HeaderText="NoonBTTC" SortExpression="NoonBTTC" UniqueName="NoonBTTC">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EveningBTTC" FilterControlAltText="Filter EveningBTTC column" HeaderText="EveningBTTC" SortExpression="EveningBTTC" UniqueName="EveningBTTC">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MemberImage" FilterControlAltText="Filter MemberImage column" HeaderText="MemberImage" SortExpression="MemberImage" UniqueName="MemberImage">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SName" FilterControlAltText="Filter SName column" HeaderText="SName" SortExpression="SName" UniqueName="SName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SDOB" DataType="System.DateTime" FilterControlAltText="Filter SDOB column" HeaderText="SDOB" SortExpression="SDOB" UniqueName="SDOB">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SBG" FilterControlAltText="Filter SBG column" HeaderText="SBG" SortExpression="SBG" UniqueName="SBG">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SRHF" FilterControlAltText="Filter SRHF column" HeaderText="SRHF" SortExpression="SRHF" UniqueName="SRHF">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Anniversary" DataType="System.DateTime" FilterControlAltText="Filter Anniversary column" HeaderText="Anniversary" SortExpression="Anniversary" UniqueName="Anniversary">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SMobile" FilterControlAltText="Filter SMobile column" HeaderText="SMobile" SortExpression="SMobile" UniqueName="SMobile">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SEmailId" FilterControlAltText="Filter SEmailId column" HeaderText="SEmailId" SortExpression="SEmailId" UniqueName="SEmailId">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SHobbies" FilterControlAltText="Filter SHobbies column" HeaderText="SHobbies" SortExpression="SHobbies" UniqueName="SHobbies">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SFoodPreference" FilterControlAltText="Filter SFoodPreference column" HeaderText="SFoodPreference" SortExpression="SFoodPreference" UniqueName="SFoodPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SDrinkPreference" FilterControlAltText="Filter SDrinkPreference column" HeaderText="SDrinkPreference" SortExpression="SDrinkPreference" UniqueName="SDrinkPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SImage" FilterControlAltText="Filter SImage column" HeaderText="SImage" SortExpression="SImage" UniqueName="SImage">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RAdd1" FilterControlAltText="Filter RAdd1 column" HeaderText="RAdd1" SortExpression="RAdd1" UniqueName="RAdd1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RAdd2" FilterControlAltText="Filter RAdd2 column" HeaderText="RAdd2" SortExpression="RAdd2" UniqueName="RAdd2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RCity" FilterControlAltText="Filter RCity column" HeaderText="RCity" SortExpression="RCity" UniqueName="RCity">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RState" FilterControlAltText="Filter RState column" HeaderText="RState" SortExpression="RState" UniqueName="RState">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RCountry" FilterControlAltText="Filter RCountry column" HeaderText="RCountry" SortExpression="RCountry" UniqueName="RCountry">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPin" FilterControlAltText="Filter RPin column" HeaderText="RPin" SortExpression="RPin" UniqueName="RPin">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhoneCc1" FilterControlAltText="Filter RPhoneCc1 column" HeaderText="RPhoneCc1" SortExpression="RPhoneCc1" UniqueName="RPhoneCc1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhoneAc1" FilterControlAltText="Filter RPhoneAc1 column" HeaderText="RPhoneAc1" SortExpression="RPhoneAc1" UniqueName="RPhoneAc1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhone1" FilterControlAltText="Filter RPhone1 column" HeaderText="RPhone1" SortExpression="RPhone1" UniqueName="RPhone1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhoneCc2" FilterControlAltText="Filter RPhoneCc2 column" HeaderText="RPhoneCc2" SortExpression="RPhoneCc2" UniqueName="RPhoneCc2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhoneAc2" FilterControlAltText="Filter RPhoneAc2 column" HeaderText="RPhoneAc2" SortExpression="RPhoneAc2" UniqueName="RPhoneAc2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RPhone2" FilterControlAltText="Filter RPhone2 column" HeaderText="RPhone2" SortExpression="RPhone2" UniqueName="RPhone2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RFaxCc" FilterControlAltText="Filter RFaxCc column" HeaderText="RFaxCc" SortExpression="RFaxCc" UniqueName="RFaxCc">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RFaxAc" FilterControlAltText="Filter RFaxAc column" HeaderText="RFaxAc" SortExpression="RFaxAc" UniqueName="RFaxAc">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RFax" FilterControlAltText="Filter RFax column" HeaderText="RFax" SortExpression="RFax" UniqueName="RFax">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CompanyName" FilterControlAltText="Filter CompanyName column" HeaderText="CompanyName" SortExpression="CompanyName" UniqueName="CompanyName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CompanyDesignation" FilterControlAltText="Filter CompanyDesignation column" HeaderText="CompanyDesignation" SortExpression="CompanyDesignation" UniqueName="CompanyDesignation">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OAdd1" FilterControlAltText="Filter OAdd1 column" HeaderText="OAdd1" SortExpression="OAdd1" UniqueName="OAdd1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OAdd2" FilterControlAltText="Filter OAdd2 column" HeaderText="OAdd2" SortExpression="OAdd2" UniqueName="OAdd2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OCity" FilterControlAltText="Filter OCity column" HeaderText="OCity" SortExpression="OCity" UniqueName="OCity">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPin" FilterControlAltText="Filter OPin column" HeaderText="OPin" SortExpression="OPin" UniqueName="OPin">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OState" FilterControlAltText="Filter OState column" HeaderText="OState" SortExpression="OState" UniqueName="OState">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OCountry" FilterControlAltText="Filter OCountry column" HeaderText="OCountry" SortExpression="OCountry" UniqueName="OCountry">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhoneCc1" FilterControlAltText="Filter OPhoneCc1 column" HeaderText="OPhoneCc1" SortExpression="OPhoneCc1" UniqueName="OPhoneCc1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhoneAc1" FilterControlAltText="Filter OPhoneAc1 column" HeaderText="OPhoneAc1" SortExpression="OPhoneAc1" UniqueName="OPhoneAc1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhone1" FilterControlAltText="Filter OPhone1 column" HeaderText="OPhone1" SortExpression="OPhone1" UniqueName="OPhone1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhoneCc2" FilterControlAltText="Filter OPhoneCc2 column" HeaderText="OPhoneCc2" SortExpression="OPhoneCc2" UniqueName="OPhoneCc2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhoneAc2" FilterControlAltText="Filter OPhoneAc2 column" HeaderText="OPhoneAc2" SortExpression="OPhoneAc2" UniqueName="OPhoneAc2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OPhone2" FilterControlAltText="Filter OPhone2 column" HeaderText="OPhone2" SortExpression="OPhone2" UniqueName="OPhone2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OFaxCc" FilterControlAltText="Filter OFaxCc column" HeaderText="OFaxCc" SortExpression="OFaxCc" UniqueName="OFaxCc">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OFaxAc" FilterControlAltText="Filter OFaxAc column" HeaderText="OFaxAc" SortExpression="OFaxAc" UniqueName="OFaxAc">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OFax" FilterControlAltText="Filter OFax column" HeaderText="OFax" SortExpression="OFax" UniqueName="OFax">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="OMail" FilterControlAltText="Filter OMail column" HeaderText="OMail" SortExpression="OMail" UniqueName="OMail">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Website" FilterControlAltText="Filter Website column" HeaderText="Website" SortExpression="Website" UniqueName="Website">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C1Name" FilterControlAltText="Filter C1Name column" HeaderText="C1Name" SortExpression="C1Name" UniqueName="C1Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C1DOB_D" DataType="System.DateTime" FilterControlAltText="Filter C1DOB_D column" HeaderText="C1DOB_D" SortExpression="C1DOB_D" UniqueName="C1DOB_D">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="GenderC1" FilterControlAltText="Filter GenderC1 column" HeaderText="GenderC1" SortExpression="GenderC1" UniqueName="GenderC1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C2Name" FilterControlAltText="Filter C2Name column" HeaderText="C2Name" SortExpression="C2Name" UniqueName="C2Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C2DOB_D" DataType="System.DateTime" FilterControlAltText="Filter C2DOB_D column" HeaderText="C2DOB_D" SortExpression="C2DOB_D" UniqueName="C2DOB_D">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="GenderC2" FilterControlAltText="Filter GenderC2 column" HeaderText="GenderC2" SortExpression="GenderC2" UniqueName="GenderC2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C3Name" FilterControlAltText="Filter C3Name column" HeaderText="C3Name" SortExpression="C3Name" UniqueName="C3Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="C3DOB_D" DataType="System.DateTime" FilterControlAltText="Filter C3DOB_D column" HeaderText="C3DOB_D" SortExpression="C3DOB_D" UniqueName="C3DOB_D">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="GenderC3" FilterControlAltText="Filter GenderC3 column" HeaderText="GenderC3" SortExpression="GenderC3" UniqueName="GenderC3">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="MailPreference" FilterControlAltText="Filter MailPreference column" HeaderText="MailPreference" SortExpression="MailPreference" UniqueName="MailPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FaxPreference" FilterControlAltText="Filter FaxPreference column" HeaderText="FaxPreference" SortExpression="FaxPreference" UniqueName="FaxPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AddressPreference" FilterControlAltText="Filter AddressPreference column" HeaderText="AddressPreference" SortExpression="AddressPreference" UniqueName="AddressPreference">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCheckBoxColumn DataField="Status" DataType="System.Boolean" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status">
                                        </telerik:GridCheckBoxColumn>
                                        <telerik:GridBoundColumn DataField="AddedDate" DataType="System.DateTime" FilterControlAltText="Filter AddedDate column" HeaderText="AddedDate" SortExpression="AddedDate" UniqueName="AddedDate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="UpdatedDate" DataType="System.DateTime" FilterControlAltText="Filter UpdatedDate column" HeaderText="UpdatedDate" SortExpression="UpdatedDate" UniqueName="UpdatedDate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Ipaddress" FilterControlAltText="Filter Ipaddress column" HeaderText="Ipaddress" SortExpression="Ipaddress" UniqueName="Ipaddress">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="district_no" DataType="System.Int32" FilterControlAltText="Filter district_no column" HeaderText="district_no" SortExpression="district_no" UniqueName="district_no">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="club_name" FilterControlAltText="Filter club_name column" HeaderText="club_name" SortExpression="club_name" UniqueName="club_name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ri_club_no" DataType="System.Int32" FilterControlAltText="Filter ri_club_no column" HeaderText="ri_club_no" SortExpression="ri_club_no" UniqueName="ri_club_no">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="charter_date" DataType="System.DateTime" FilterControlAltText="Filter charter_date column" HeaderText="charter_date" SortExpression="charter_date" UniqueName="charter_date">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="meeting_day" FilterControlAltText="Filter meeting_day column" HeaderText="meeting_day" SortExpression="meeting_day" UniqueName="meeting_day">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="meeting_time" DataType="System.DateTime" FilterControlAltText="Filter meeting_time column" HeaderText="meeting_time" SortExpression="meeting_time" UniqueName="meeting_time">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="venue1" FilterControlAltText="Filter venue1 column" HeaderText="venue1" SortExpression="venue1" UniqueName="venue1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="venue2" FilterControlAltText="Filter venue2 column" HeaderText="venue2" SortExpression="venue2" UniqueName="venue2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="landmark" FilterControlAltText="Filter landmark column" HeaderText="landmark" SortExpression="landmark" UniqueName="landmark">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="gps_longitude" FilterControlAltText="Filter gps_longitude column" HeaderText="gps_longitude" SortExpression="gps_longitude" UniqueName="gps_longitude">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="city" FilterControlAltText="Filter city column" HeaderText="city" SortExpression="city" UniqueName="city">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="gps_latitude" FilterControlAltText="Filter gps_latitude column" HeaderText="gps_latitude" SortExpression="gps_latitude" UniqueName="gps_latitude">
                                        </telerik:GridBoundColumn><telerik:GridBoundColumn DataField="MobileCc2" FilterControlAltText="Filter MobileCc2 column" HeaderText="MobileCc2" SortExpression="MobileCc2" UniqueName="MobileCc2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Mobile2" FilterControlAltText="Filter Mobile2 column" HeaderText="Mobile2" SortExpression="Mobile2" UniqueName="Mobile2">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SMobileCc" FilterControlAltText="Filter SMobileCc column" HeaderText="SMobileCc" SortExpression="SMobileCc" UniqueName="SMobileCc">
                                        </telerik:GridBoundColumn>
                                        
                                       <telerik:GridBoundColumn DataField="year" FilterControlAltText="Filter year column" HeaderText="year" SortExpression="year" UniqueName="year">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" SortExpression="id" UniqueName="id">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="designation_id" DataType="System.Int32" FilterControlAltText="Filter designation_id column" HeaderText="designation_id" SortExpression="designation_id" UniqueName="designation_id">
                                        </telerik:GridBoundColumn>--%>
                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="true" />
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="z_GetAllBodInMailByDist3141ClubId" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Dist3141ClubId" QueryStringField="id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td >
                            &nbsp;</td>
                    </tr>

                   

                    
                     <tr>
                        <td colspan="4" class="header_subtitle">Flagship Project of Club</td>
                        
                    </tr>

                      <tr>
                        <td align="right" style="vertical-align:top;">Flagship Project Text:</td>
                        <td class="style1">
                            <asp:Label ID="lblFlagship" runat="server"></asp:Label>
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>

                      <tr>
                        <td align="right" style="vertical-align:top;">Flagship Project Image:</td>
                        <td class="style1">
                            <asp:Image ID="imgFlagship" runat="server" Height="100px" Width="100px" />
                        </td>
                        <td class="style1" colspan="2">
                            &nbsp;</td>
                    </tr>


                </table>
            </section>


        </div>
        <div class="clearfix"></div>

        <div align="center" style="margin-top: 5px;"><a href="Javascript:self.close();" class="btn">Close</a></div>


    </form>
</body>
</html>


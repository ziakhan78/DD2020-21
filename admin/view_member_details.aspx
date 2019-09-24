<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_member_details.aspx.cs" Inherits="admin_view_member_details" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: RI District 3141 | Admin ::</title>
    <link href="../css/popup1.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="holder_dhy">
            <header></header>
            <section>



                <table style="width: 800px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">


                    <tr>
                        <td colspan="4" class="header_title">Member Details</td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Club Details</td>
                    </tr>

                    <tr>
                        <td align="right">Rotary Club of</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblClubName" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">RI Club No.</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblClubNo" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Charter Date</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">

                            <asp:Label ID="lblCharterDate" runat="server"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Day</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">

                            <asp:Label ID="lblMeetingDay" runat="server"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Time</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">

                            <asp:Label ID="lblMeetingTime" runat="server"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Venue</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">

                            <asp:Label ID="lblVenue" runat="server"></asp:Label>

                        </td>
                    </tr>

                    <tr>
                        <td align="right">GPS Coordinates</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">

                            <asp:Label ID="lblGPS" runat="server"></asp:Label>

                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Member Details</td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">RI Membership No.</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td>
                            <div align="left">
                                <asp:Label ID="lblMembershipNo" runat="server"></asp:Label>
                            </div>
                        </td>
                        <td rowspan="7" valign="top">
                            <asp:Image ID="MemImage" runat="server" AlternateText="Member Image"
                                Height="110px" Width="100px" BorderColor="#FFCC00" BorderStyle="Solid" BorderWidth="1px" />
                            &nbsp;<asp:Image ID="SpouseImage" runat="server" AlternateText="Spouse Image"
                                Height="110px" Width="100px" BorderColor="#FFCC00" BorderStyle="Solid" BorderWidth="1px" />
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Membership Type </div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td>
                            <asp:Label ID="lblMembershipType" runat="server"></asp:Label></td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Charter Member </div>
                        </td>
                        <td class="style1">:</td>
                        <td>
                            <asp:Label ID="lblCharterMember" runat="server"></asp:Label></td>
                    </tr>



                    <tr>
                        <td>
                            <div align="right">Name</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server"></asp:Label></td>
                    </tr>



                    <tr>
                        <td>
                            <div align="right">Call name (Nickname)</div>
                        </td>
                        <td class="style1">:</td>
                        <td>
                            <asp:Label ID="lblCallName" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Gender</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td>
                            <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Classification</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblClassification" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Qualification</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblQualification" runat="server"></asp:Label></td>
                    </tr>



                    <tr>
                        <td>
                            <div align="right">Email-Id</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                    </tr>

                  <%--  <tr>
                        <td>
                            <div align="right">Alternate Email-Id</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblAltEmail" runat="server"></asp:Label></td>
                    </tr>--%>

                    <tr>
                        <td>
                            <div align="right">Mobile No. </div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblmob1" runat="server"></asp:Label></td>
                    </tr>
                   <%-- <tr>
                        <td>
                            <div align="right">Mobile No.2 </div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblMob2" runat="server"></asp:Label></td>
                    </tr>--%>


                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2" align="left" valign="middle">
                            <asp:Label ID="lblDOB" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Blood Group</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblBG" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Hobbies</div>
                        </td>
                        <td class="style1">:</td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblHobbies" runat="server"></asp:Label></td>
                    </tr>


                    <tr>
                        <td align="right">TRF Amount US $</td>
                        <td class="style1">:
                        </td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblTRF" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">TRF Status </div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblTrfStatus" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right">Date of Joining</td>
                        <td class="style1">:
                        </td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblDOJ" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td class="style3">
                            <div align="right">Food Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblFood" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td class="style3">
                            <div align="right">Drink Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblDrink" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Proposed / Introduced By</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblProposed" runat="server"></asp:Label></td>
                    </tr>


                    <tr>
                        <td class="style3" valign="top" align="right">Best Time to Call</td>
                        <td class="style1" valign="top">:</td>
                        <td colspan="2">&nbsp;</td>
                    </tr>


                    <%-- <tr>
                    <td colspan="4" class="header_subtitle">Positions</td>
                </tr>


                <tr>
                    <td align="right" valign="top">Position(s) Held</td>
                    <td class="style1" valign="top">:</td>
                    <td align="left" colspan="2" valign="top">
                        <telerik:RadGrid ID="RadGrid1" runat="server" Width="600px" CellSpacing="0" DataSourceID="DSClubPositionHeld" GridLines="None">

                            <FilterMenu EnableImageSprites="False"></FilterMenu>

                            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"
                                EnableImageSprites="True">
                            </HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="DSClubPositionHeld">
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="20px"></HeaderStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="years" HeaderText="Year" HeaderStyle-Font-Bold="true"
                                        SortExpression="years" UniqueName="years">

                                        <ItemStyle Width="100px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="100px"></HeaderStyle>

                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="designation" HeaderText="Position Held" HeaderStyle-Font-Bold="true"
                                        SortExpression="designation" UniqueName="designation">
                                        <ItemStyle Width="400px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="400px"></HeaderStyle>

                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="type" HeaderText="Position In" HeaderStyle-Font-Bold="true"
                                        SortExpression="type" UniqueName="type">
                                        <ItemStyle Width="80px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="80px"></HeaderStyle>
                                    </telerik:GridBoundColumn>

                                </Columns>

                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>

                        <asp:SqlDataSource ID="DSClubPositionHeld" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [ViewMembers] WHERE ([Member_id] = @Member_id) ORDER BY [Years] DESC">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Member_id" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>



                <tr>
                    <td colspan="4" class="header_subtitle">Awards</td>

                </tr>

                <tr>
                    <td align="right" valign="top">Award(s) Won</td>
                    <td class="style1" valign="top">:</td>
                    <td align="left" colspan="2" valign="top">
                        <telerik:RadGrid ID="RadGrid2" runat="server" Width="600px">
                            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"
                                EnableImageSprites="True">
                            </HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False">
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="20px"></HeaderStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="year" HeaderText="Year" HeaderStyle-Font-Bold="true"
                                        SortExpression="year" UniqueName="year">
                                        <ItemStyle Width="100px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="100px"></HeaderStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="award_name" HeaderText="Award Name" HeaderStyle-Font-Bold="true"
                                        SortExpression="award_name" UniqueName="award_name">
                                        <ItemStyle Width="400px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="400px"></HeaderStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="type" HeaderText="Type" HeaderStyle-Font-Bold="true"
                                        SortExpression="type" UniqueName="type">
                                        <ItemStyle Width="80px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Font-Bold="True" Width="80px"></HeaderStyle>
                                    </telerik:GridBoundColumn>



                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>--%>





                    <tr>
                        <td colspan="4" class="header_subtitle">Spouse Details</td>

                    </tr>

                    <tr>
                        <td>
                            <div align="right">Spouse Name </div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblSpouseName" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right">Spouse Date of Birth</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblSDOB" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Spouse Blood Group</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblSBG" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Anniversary</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td align="left" valign="middle" colspan="2">
                            <asp:Label ID="lblAnni" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Mobile No.</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblSMob" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Email-Id</div>
                        </td>
                        <td class="style1">:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblSEmail" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right">Hobbies</td>
                        <td class="style1">:</td>
                        <td colspan="2">
                            <asp:Label ID="lblSHobbies" runat="server"></asp:Label></td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Food Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblSFood" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Drink Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblSDrink" runat="server"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="4" class="header_subtitle">Residence Address</td>

                    </tr>

                    <tr>
                        <td valign="top">
                            <div align="right">Address</div>
                        </td>
                        <td valign="top">:
                        </td>
                        <td colspan="2" valign="top">
                            <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">City</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCity" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Pincode</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblPin" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">State</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblState" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Country</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblCountry" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Residence Phone 1</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblPhone1" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Residence Phone 2</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblPhone2" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Residence Fax</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblFax" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Company Address</td>

                    </tr>


                    <tr>
                        <td>
                            <div align="right">Company Name</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompany" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Designation</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompDesig" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div align="right">Address</div>
                        </td>
                        <td valign="top">:
                        </td>
                        <td colspan="2" valign="top">
                            <div align="left">
                                <asp:Label ID="lblCompAdd" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">City</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompCity" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Pincode</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompPin" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">State</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblCompState" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Country</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblCompCountry" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Business Phone 1</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompPhone1" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business Phone 2</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompPhone2" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business Fax  </div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblCompFax" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business E-Mail</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <div align="left">
                                <asp:Label ID="lblCompEmail" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Website</div>
                        </td>
                        <td>:
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblWebsite" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Children Details</td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Child 1 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblChildName1" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <asp:Label ID="lblChildDOB1" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <div align="right">Gender </div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <div align="left">
                                <asp:Label ID="lblChildGender1" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <div align="right">Child 2 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblChildName2" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <div align="left">
                                <asp:Label ID="lblChildDOB2" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <div align="right">Gender </div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <div align="left">
                                <asp:Label ID="lblChildGender2" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td colspan="2">
                            <div align="left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Child 3 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <asp:Label ID="lblChildName3" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <div align="left">
                                <asp:Label ID="lblChildDOB3" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="style4">
                            <div align="right">Gender </div>
                        </td>
                        <td>:</td>
                        <td colspan="2">
                            <div align="left">
                                <asp:Label ID="lblChildGender3" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Communication Preferences</td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Mail (Post) Preference </div>
                        </td>
                        <td>:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblMailRef" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Fax Preference </div>
                        </td>
                        <td>:</td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblFaxRef" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div align="right">Email Preference  </div>
                        </td>
                        <td valign="top">:</td>
                        <td align="left" valign="top" colspan="2">
                            <asp:Label ID="lblEmailRef" runat="server"></asp:Label></td>
                    </tr>



                </table>


            </section>


        </div>
        <div class="clearfix"></div>

        <div align="center" style="margin-top: 5px;"><a href="Javascript:self.close();" class="btn">Close</a></div>


    </form>
</body>
</html>


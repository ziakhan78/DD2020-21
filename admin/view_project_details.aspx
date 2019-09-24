<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_project_details.aspx.cs" Inherits="admin_view_project_details" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: Project Details ::</title>  
    <link href="../css/popup.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="holder_dhy">
            <header></header>
            <section>

                <table style="width: 800px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                    <tr>
                        <td colspan="4" class="header_title">View Project Details</td>
                    </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Project Details</td>
                    </tr>

                    <tr>
                        <td align="right" style="width:140px;">Project Year</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectYear" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Project Title</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectTitle" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Start Date</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">End Date</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblEndDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Project Type</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Project Location</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectLocation" runat="server"></asp:Label>
                        </td>
                    </tr>
                   
                    <tr>
                        <td align="right">Project Description</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectDescription" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Project Cost</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectCost" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Avenue of Covered</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblAvenueOfCovered" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Project Chairperson</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblProjectChairperson" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Committee Members</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblCommitteeMembers" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Beneficiaries</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblBeneficiaries" runat="server"></asp:Label>
                        </td>
                    </tr>

                      <tr>
                        <td align="right">Partner Club District No.</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblPartnerClubDistrictNo" runat="server"></asp:Label>
                        </td>
                    </tr>

                      <tr>
                        <td align="right">Partner Club Name</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblPartnerClubName" runat="server"></asp:Label>
                        </td>
                    </tr>

                      <tr>
                        <td align="right">District Grant No.</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblDistrictGrantNo" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">District Global No.</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblDistrictGlobalNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                   

                    <tr>
                        <td colspan="4" class="header_subtitle">Project Address</td>
                    </tr>                    

                    <tr>
                        <td align="right">Address</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblAdd" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">City</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblCity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Pin</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblPin" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">State</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Country</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblCountry" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Phone-1</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblPhone1" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Phone-2</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblPhone2" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">Fax</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblFax" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">website</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblWebsite" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">GEO Latitude</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblGeoLatitude" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td align="right">GEO Longitude</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblGeoLongitude" runat="server"></asp:Label>
                        </td>
                    </tr>

                      <tr>
                        <td align="right">Direction Project Site</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="2">
                            <asp:Label ID="lblDirectionProjectSite" runat="server"></asp:Label>
                        </td>
                    </tr>

                      <%--                club_id, project_year, project_title, start_date, end_date, project_type, project_location, project_description, project_cost, 
                        avenue_of_covered, project_chairperson, committee_members, beneficiaries, 
                         project_images, partner_club_district_no, partner_club_name, district_grant_no, district_global_no, add1, add2, city, pin, state, country, ph1_cc, ph1_ac, phone1, 
                         ph2_cc, ph2_ac, phone2, fax_cc, fax_ac, fax, website, geo_latitude, geo_longitude, direction_project_site, status, ipaddress, added_date--%>


                    <tr>
                        <td colspan="4" class="header_subtitle">Project Contact Persons</td>

                    </tr>

                   <tr>
                       <td colspan="4">
                           <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" GridLines="None" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                               <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" >
                                   <Columns>
                                      
                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                     
                                       <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Name" SortExpression="name" UniqueName="name">
                                       </telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="designation" FilterControlAltText="Filter designation column" HeaderText="Designation" SortExpression="designation" UniqueName="designation">
                                       </telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="emailId" FilterControlAltText="Filter emailId column" HeaderText="EmailId" SortExpression="emailId" UniqueName="emailId">
                                       </telerik:GridBoundColumn>
                                       <telerik:GridBoundColumn DataField="mobile" FilterControlAltText="Filter mobile column" HeaderText="Mobile" SortExpression="mobile" UniqueName="mobile">
                                       </telerik:GridBoundColumn>
                                   </Columns>
                               </MasterTableView>
                               <HeaderStyle Font-Bold="True" />
                           </telerik:RadGrid>
                              </td>
                   </tr>

                    <tr>
                        <td colspan="4" class="header_subtitle">Project Images</td>

                    </tr>

                    <tr>
                        <td colspan="4">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
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


            </section>


        </div>
        <div class="clearfix"></div>

        <div align="center" style="margin-top: 5px;"><a href="Javascript:self.close();" class="btn">Close</a></div>


    </form>
</body>
</html>


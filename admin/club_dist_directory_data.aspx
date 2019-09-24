<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="club_dist_directory_data.aspx.cs" Inherits="admin_club_dist_directory_data" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="2" class="header_title">District Directory Data
                    </td>
                </tr>
                <!-- search and sort start -->

                <tr>
                    <td valign="top" class="style5" align="left">
                        <table width="200">
                            <tr>
                                <td valign="top" align="center" style="width: 195px; border-right: #f4f4f4 1px solid; border-top: #f4f4f4 1px solid; border-left: #f4f4f4 1px solid; border-bottom: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                                    <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="border-collapse: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
                                        <tr>
                                            <td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'"
                                                onmouseout="this.style.backgroundColor='#f9f9f9'" align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkA" runat="server" OnClick="LnkA_Click" CssClass="txtSearch">A</asp:LinkButton></td>
                                            <td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkB" runat="server"
                                                    OnClick="LnkB_Click" CssClass="txtSearch">B</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkC" runat="server"
                                                    OnClick="LnkC_Click" CssClass="txtSearch">C</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkD" runat="server"
                                                    OnClick="LnkD_Click" CssClass="txtSearch">D</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkE" runat="server"
                                                    OnClick="LnkE_Click" CssClass="txtSearch">E</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkF" runat="server"
                                                    OnClick="LnkF_Click" CssClass="txtSearch">F</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center" class="auto-style1">
                                                <asp:LinkButton ID="LnkG" runat="server"
                                                    OnClick="LnkG_Click" CssClass="txtSearch">G</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkH" runat="server"
                                                    OnClick="LnkH_Click" CssClass="txtSearch">H</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkI" runat="server"
                                                    OnClick="LnkI_Click" CssClass="txtSearch">I</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkJ" runat="server"
                                                    OnClick="LnkJ_Click" CssClass="txtSearch">J</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkK" runat="server"
                                                    OnClick="LnkK_Click" CssClass="txtSearch">K</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkL" runat="server"
                                                    OnClick="LnkL_Click" CssClass="txtSearch">L</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkM" runat="server"
                                                    OnClick="LnkM_Click" CssClass="txtSearch">M</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkN" runat="server" OnClick="LnkN_Click" CssClass="txtSearch">N</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkO" runat="server"
                                                    OnClick="LnkO_Click" CssClass="txtSearch">O</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkP" runat="server"
                                                    OnClick="LnkP_Click" CssClass="txtSearch">P</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkQ" runat="server"
                                                    OnClick="LnkQ_Click" CssClass="txtSearch">Q</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkR" runat="server"
                                                    OnClick="LnkR_Click" CssClass="txtSearch">R</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkS" runat="server"
                                                    OnClick="LnkS_Click" CssClass="txtSearch">S</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkT" runat="server"
                                                    OnClick="LnkT_Click" CssClass="txtSearch">T</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkU" runat="server"
                                                    OnClick="LnkU_Click" CssClass="txtSearch">U</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkV" runat="server"
                                                    OnClick="LnkV_Click" CssClass="txtSearch">V</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkW" runat="server"
                                                    OnClick="LnkW_Click" CssClass="txtSearch">W</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkX" runat="server"
                                                    OnClick="LnkX_Click" CssClass="txtSearch">X</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkY" runat="server"
                                                    OnClick="LnkY_Click" CssClass="txtSearch">Y</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkZ" runat="server"
                                                    OnClick="LnkZ_Click" CssClass="txtSearch">Z</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="Linkbutton1" runat="server"
                                                    OnClick="Linkbutton1_Click" CssClass="txtSearch">ALL</asp:LinkButton>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>




                    <td valign="top" width="300px" align="right">
                        <table style="text-align: right;" width="300px">

                            <tr>
                                <td valign="top" align="center" style="border: 1px solid #f4f4f4;"
                                    bgcolor="#f4f4f4" class="style1">
                                    <b>&nbsp; ::&nbsp;Search By ::</b>
                                </td>
                            </tr>
                            <tr>

                                <td valign="top" align="right" width="100%">
                                    <table width="100%">


                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                    RepeatDirection="Horizontal" AutoPostBack="false">
                                                    <asp:ListItem Selected="True" Value="0">Name</asp:ListItem>
                                                    <asp:ListItem Value="1">Designation</asp:ListItem>


                                                </asp:RadioButtonList>

                                            </td>
                                        </tr>



                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                    BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                                    OnClick="btnSearch_Click" Text="Search" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>



                <tr>
                    <td colspan="3">
                        <asp:Panel ID="PanelSort" runat="server" Width="100%" GroupingText="">
                            <table align="left" width="100%">
                                <tr>
                                    <%--<td width="50%">
                                        <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                            OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                                            <asp:ListItem Value="0">All</asp:ListItem>
                                            <asp:ListItem Value="1">Members</asp:ListItem>
                                            <asp:ListItem Value="2">President</asp:ListItem>
                                            <asp:ListItem Value="3">Secretary</asp:ListItem>
                                        </asp:RadioButtonList>

                                    </td>--%>
                                    <td width="50%" align="right">
                                        <asp:Button ID="btnSendLoginPass" runat="server" CssClass="btn"
                                            OnClick="btnSendLoginPass_Click" Text="Send Login Id Password" />
                                        &nbsp;<asp:Button ID="btnSendDistrictDirectoryData" runat="server" CssClass="btn"
                                            Text="Send District Directory Data" OnClick="btnSendDistrictDirectoryData_Click" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <!-- search and sort end -->

                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True"
                            GridLines="None"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand"
                            PageSize="100" Skin="Default">
                            <HeaderContextMenu EnableAutoScroll="True">
                            </HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <Columns>







                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>



                                    <telerik:GridTemplateColumn HeaderText="Select" FilterControlToolTip="Select for sending mail" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblcid" runat="server" Text='<%# Eval("MemberId") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblClubId" runat="server" Text='<%# Eval("DistrictClubID") %>' Visible="false"></asp:Label>
                                            <asp:CheckBox ID="chkActive" runat="server" TextAlign="Left"></asp:CheckBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>





                                    <%--       <telerik:GridBoundColumn DataField="club_name" HeaderText="Rotary Club of"
                                        SortExpression="club_name" UniqueName="club_name">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridTemplateColumn HeaderText="Club Name" SortExpression="club_name">
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" onclick="MM_openBrWindow('view_club_details.aspx?id=<%# Eval("DistrictClubID") %>','01111','width=1060, height=900')"><%# Eval("club_name") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="Name" HeaderText="President"
                                        SortExpression="Name" UniqueName="Name">
                                        <ItemStyle VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="EmailId" HeaderText="Email-Id"
                                        SortExpression="EmailId" UniqueName="EmailId">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <%--    <telerik:GridBoundColumn DataField="password" HeaderText="Password"
                                        SortExpression="password" UniqueName="password">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>            --%>



                                    <telerik:GridTemplateColumn HeaderText="Mobile" SortExpression="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobile1" runat="server" Text='<%# Eval("Mobile1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="70px" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="70px" />
                                    </telerik:GridTemplateColumn>




                                </Columns>
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <div align="left">
                        </div>

                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display."
                            Style="font-weight: 700"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="700px" CssClass="txt" CellPadding="4" ForeColor="#333333" GridLines="None" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

                                    <%-- <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
                                  <asp:BoundField DataField="DistrictClubID" HeaderText="DistrictClubID" SortExpression="DistrictClubID" />
                                  <asp:BoundField DataField="MembershipNo" HeaderText="MembershipNo" SortExpression="MembershipNo" />
                                  <asp:BoundField DataField="MemType" HeaderText="MemType" SortExpression="MemType" />
                                  <asp:BoundField DataField="CharterMember" HeaderText="CharterMember" SortExpression="CharterMember" />--%>



                                    <%--<asp:BoundField DataField="MobileCc1" HeaderText="MobileCc1" SortExpression="MobileCc1" />--%>


                                    <%-- <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />--%>

                                    <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>

                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />

                                    </asp:TemplateField>

                                    <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" HeaderStyle-HorizontalAlign="Left" />

                                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" HeaderStyle-HorizontalAlign="Left" />

                                    <asp:BoundField DataField="EmailId" HeaderText="EmailId" SortExpression="EmailId" HeaderStyle-HorizontalAlign="Left" />



                                    <asp:BoundField DataField="Mobile1" HeaderText="Mobile1" SortExpression="Mobile1" HeaderStyle-HorizontalAlign="Left" />


                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle Font-Bold="True" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#fff" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>

                            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [View_BodMembers]"></asp:SqlDataSource>--%>


                            <asp:DetailsView ID="DetailsView1" runat="server"  Width="700px" AutoGenerateRows="False" CssClass="txt" CellPadding="4" ForeColor="#333333" GridLines="None"  >
                                <AlternatingRowStyle BackColor="White" />
                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <Fields>
                                    
                                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" ItemStyle-Font-Bold="true" />
                                     <asp:BoundField DataField="DOJ" HeaderText="JR" SortExpression="DOJ" DataFormatString="{0:yyyy}" />
                                    
                                    <asp:BoundField DataField="Classification" HeaderText="Classification" SortExpression="Classification" />
                                  
                                    <asp:BoundField DataField="Mobile1" HeaderText="Mobile" SortExpression="Mobile1" ItemStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="EmailId" HeaderText="Email" SortExpression="EmailId" ItemStyle-Font-Bold="true" />
                                      <%--<asp:BoundField DataField="RPhoneCc1" HeaderText="RPhoneCc1" SortExpression="RPhoneCc1" />
                                    <asp:BoundField DataField="RPhoneAc1" HeaderText="RPhoneAc1" SortExpression="RPhoneAc1" />
                                    <asp:BoundField DataField="RPhone1" HeaderText="RPhone1" SortExpression="RPhone1" />--%>

                                     <asp:TemplateField HeaderText="Tel. Office">
                                        <ItemTemplate>
                                            <%# Eval("OPhoneCc1") %><%# Eval("OPhoneAc1") %><%# Eval("OPhone1") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tel. Residence">
                                        <ItemTemplate>
                                            <%# Eval("RPhoneCc1") %><%# Eval("RPhoneAc1") %><%# Eval("RPhone1") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%# Eval("RAdd1") %> <%# Eval("RAdd2") %> <%# Eval("RCity") %> <%# Eval("RPin") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <%--  <asp:BoundField DataField="OPhoneCc1" HeaderText="OPhoneCc1" SortExpression="OPhoneCc1" />
                                    <asp:BoundField DataField="OPhoneAc1" HeaderText="OPhoneAc1" SortExpression="OPhoneAc1" />
                                    <asp:BoundField DataField="OPhone1" HeaderText="OPhone1" SortExpression="OPhone1" />--%>

                                     <asp:BoundField DataField="DOB" HeaderText="Birthdate" SortExpression="DOB" DataFormatString="{0:dd MMMM}" />

                                     <asp:TemplateField HeaderText="Blood Group">
                                        <ItemTemplate>
                                            <%# Eval("BG") %><%# Eval("RHF") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  

                                   <asp:BoundField DataField="Anniversary" HeaderText="Wedding Date" SortExpression="Anniversary" DataFormatString="{0:dd MMMM}" />

                                   <%-- <asp:BoundField DataField="RAdd1" HeaderText="RAdd1" SortExpression="RAdd1" />
                                    <asp:BoundField DataField="RAdd2" HeaderText="RAdd2" SortExpression="RAdd2" />
                                    <asp:BoundField DataField="RCity" HeaderText="RCity" SortExpression="RCity" />
                                    <asp:BoundField DataField="RState" HeaderText="RState" SortExpression="RState" />
                                    <asp:BoundField DataField="RCountry" HeaderText="RCountry" SortExpression="RCountry" />
                                    <asp:BoundField DataField="RPin" HeaderText="RPin" SortExpression="RPin" />
                                  
                                  --%>
                                   
<%--                                   
                                 
                                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
                                    <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />--%>
                                   
                                </Fields>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                            </asp:DetailsView>

                         <%--   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="z_GetAllBodByDist3141ClubId" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="Dist3141ClubId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>

                              <asp:DetailsView ID="DetailsView2" runat="server" Width="700px" AutoGenerateRows="False" CssClass="txt" CellPadding="4" ForeColor="#333333" GridLines="None" >
                                  <AlternatingRowStyle BackColor="White" />
                                  <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                  <EditRowStyle BackColor="#2461BF" />
                                  <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <Fields>
                                    
                                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" ItemStyle-Font-Bold="true" />
                                     <asp:BoundField DataField="DOJ" HeaderText="JR" SortExpression="DOJ" DataFormatString="{0:yyyy}" />
                                    
                                    <asp:BoundField DataField="Classification" HeaderText="Classification" SortExpression="Classification" />
                                  
                                    <asp:BoundField DataField="Mobile1" HeaderText="Mobile" SortExpression="Mobile1" ItemStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="EmailId" HeaderText="Email" SortExpression="EmailId" ItemStyle-Font-Bold="true" />
                                     
                                     <asp:TemplateField HeaderText="Tel. Office">
                                        <ItemTemplate>
                                            <%# Eval("OPhoneCc1") %><%# Eval("OPhoneAc1") %><%# Eval("OPhone1") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tel. Residence">
                                        <ItemTemplate>
                                            <%# Eval("RPhoneCc1") %><%# Eval("RPhoneAc1") %><%# Eval("RPhone1") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%# Eval("RAdd1") %> <%# Eval("RAdd2") %> <%# Eval("RCity") %> <%# Eval("RPin") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>                               

                                     <asp:BoundField DataField="DOB" HeaderText="Birthdate" SortExpression="DOB" DataFormatString="{0:dd MMMM}" />

                                     <asp:TemplateField HeaderText="Blood Group">
                                        <ItemTemplate>
                                            <%# Eval("BG") %><%# Eval("RHF") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                   <asp:BoundField DataField="Anniversary" HeaderText="Wedding Date" SortExpression="Anniversary" DataFormatString="{0:dd MMMM}" />

                                  
                                   
                                </Fields>
                                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="#EFF3FB" />
                            </asp:DetailsView>

                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>




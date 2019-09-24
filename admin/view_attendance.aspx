<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_attendance.aspx.cs" Inherits="admin_view_attendance" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View Club Attendance
               </td>
            </tr>
             <tr style="height:40px;" >
       <td align="center" colspan="3">Select Month : <asp:DropDownList ID="DDLMonth" runat="server" 
                      CssClass="txt" AutoPostBack="True" 
               onselectedindexchanged="DDLMonth_SelectedIndexChanged" >
                  </asp:DropDownList>
                </td>
       </tr>
            <tr>
            <td>
            
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                    AllowSorting="True" CellSpacing="0" 
                    GridLines="None" onitemcommand="RadGrid1_ItemCommand" 
                    PageSize="100" Skin="WebBlue">
                    <HeaderContextMenu EnableAutoScroll="True">
                    </HeaderContextMenu>
                    <MasterTableView autogeneratecolumns="False" DataKeyNames="id" 
                        >
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

                            <telerik:GridBoundColumn DataField="month" 
                                FilterControlAltText="Filter month column" HeaderText="Month" 
                                SortExpression="month" UniqueName="month">
                                 <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                 <HeaderStyle Width="150px" />
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="club_name" 
                                FilterControlAltText="Filter club_name column" HeaderStyle-Width="100px" 
                                HeaderText="Rotary Club Of" ItemStyle-Width="100px" SortExpression="club_name" 
                                UniqueName="club_name">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="300px" />
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="President" 
                                FilterControlAltText="Filter President column" HeaderStyle-Width="100px" 
                                HeaderText="President" ItemStyle-Width="100px" SortExpression="President" 
                                UniqueName="President">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="250px" />
                            </telerik:GridBoundColumn>

                            <%--<telerik:GridBoundColumn DataField="Secretary" 
                                FilterControlAltText="Filter Secretary column" HeaderText="Secretary" 
                                SortExpression="Secretary" UniqueName="Secretary">
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridBoundColumn DataField="Membership_Strength" 
                                DataType="System.Int32" 
                                FilterControlAltText="Filter Membership_Strength column" 
                                HeaderText="Membership Strength" SortExpression="Membership_Strength" 
                                UniqueName="Membership_Strength">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="25px" />
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="No_of_Meetings_Held" 
                                DataType="System.Int32" 
                                FilterControlAltText="Filter No_of_Meetings_Held column" 
                                HeaderText="No. of Meetings" SortExpression="No_of_Meetings_Held" 
                                UniqueName="No_of_Meetings_Held">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="25px" />
                            </telerik:GridBoundColumn>
                           <%-- <telerik:GridBoundColumn DataField="No_of_Meetings_Cancelled" 
                                DataType="System.Int32" 
                                FilterControlAltText="Filter No_of_Meetings_Cancelled column" 
                                HeaderText="No_of_Meetings_Cancelled" SortExpression="No_of_Meetings_Cancelled" 
                                UniqueName="No_of_Meetings_Cancelled">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>--%>
                            <telerik:GridBoundColumn DataField="Average_Attendance" DataType="System.Int32" 
                                FilterControlAltText="Filter Average_Attendance column" 
                                HeaderText="Average Attendance" SortExpression="Average_Attendance" 
                                UniqueName="Average_Attendance">
                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="25px" />
                            </telerik:GridBoundColumn>
                           <%-- <telerik:GridBoundColumn DataField="Canceled_Meeting_Date_1" 
                                DataType="System.DateTime" 
                                FilterControlAltText="Filter Canceled_Meeting_Date_1 column" 
                                HeaderText="Canceled_Meeting_Date_1" SortExpression="Canceled_Meeting_Date_1" 
                                UniqueName="Canceled_Meeting_Date_1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Canceled_Meeting_Date_2" 
                                DataType="System.DateTime" 
                                FilterControlAltText="Filter Canceled_Meeting_Date_2 column" 
                                HeaderText="Canceled_Meeting_Date_2" SortExpression="Canceled_Meeting_Date_2" 
                                UniqueName="Canceled_Meeting_Date_2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Reason_for_Cancelled_1" 
                                FilterControlAltText="Filter Reason_for_Cancelled_1 column" 
                                HeaderText="Reason_for_Cancelled_1" SortExpression="Reason_for_Cancelled_1" 
                                UniqueName="Reason_for_Cancelled_1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Reason_for_Cancelled_2" 
                                FilterControlAltText="Filter Reason_for_Cancelled_2 column" 
                                HeaderText="Reason_for_Cancelled_2" SortExpression="Reason_for_Cancelled_2" 
                                UniqueName="Reason_for_Cancelled_2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ds" FilterControlAltText="Filter ds column" 
                                HeaderText="District Secretary" SortExpression="ds" UniqueName="ds">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ag" FilterControlAltText="Filter ag column" 
                                HeaderText="Assistance Governor" SortExpression="ag" UniqueName="ag">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="gc" FilterControlAltText="Filter gc column" 
                                HeaderText="Group Coordinator" SortExpression="gc" UniqueName="gc">
                            </telerik:GridBoundColumn>--%>


                           <%-- <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" 
                                FilterControlAltText="Filter added_date column" HeaderText="added_date" 
                                SortExpression="added_date" UniqueName="added_date">
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False" >
                     <ItemTemplate>
                             <a href='add_attendance.aspx?id=<%# Eval("id") %>'>Edit</a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"  Width="30px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px"></ItemStyle>
  </telerik:GridTemplateColumn>
 <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">        
            <ItemTemplate>
                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                </cc1:ConfirmButtonExtender>
                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete" 
                    CommandArgument='<%# Eval("id") %>' runat="Server" 
                    AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
            </ItemTemplate>
             <HeaderStyle HorizontalAlign="Center" Width="30px" />
             <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
    </telerik:GridTemplateColumn> 

                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
               <%-- <asp:SqlDataSource ID="DSAttendance" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                    SelectCommand="SELECT * FROM [View_Clubs_Attendance]"></asp:SqlDataSource>--%>
            
            </td>
            </tr>

            <tr><td align="center" colspan="3">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>

            </table>
            </ContentTemplate></asp:UpdatePanel>
             <!-- search and sort start -->
</asp:Content>


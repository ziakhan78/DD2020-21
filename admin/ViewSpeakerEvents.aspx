<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewSpeakerEvents.aspx.cs" Inherits="admin_ViewSpeakerEvents" Title="" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    

     <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View Upcoming Club Events</td>
            </tr> 
        
        <tr>
            <td align="left" valign="top" >
                <asp:Panel ID="PanelSortMeet" runat="server" Width="100%" GroupingText="Sort Speakers & Events">
               <table align="left">
                        <tr>
                            <td>
                                <b>Sort By :</b> </td>
                            <td >
                                 <asp:RadioButtonList ID="rbtnsort" runat="server" AutoPostBack="True" 
                     
                    RepeatDirection="Horizontal" onselectedindexchanged="rbtnsort_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                    <asp:ListItem Value="1">Speakers</asp:ListItem>
                    <asp:ListItem Value="2">Events</asp:ListItem>
                     <asp:ListItem Value="3">Date</asp:ListItem>
                </asp:RadioButtonList>
                               
                            </td>
                            <td> 
                                <asp:Panel ID="PanelDate" runat="server">
                                    <table class="style5">
                                        <tr>
                                            <td>
                                                From :</td>
                                            <td>
                                                <telerik:RadDatePicker ID="dateFrom" Runat="server">
                                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                                        ViewSelectorText="x">
                                                    </Calendar>
                                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                                                    </DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                To :</td>
                                            <td>
                                                <telerik:RadDatePicker ID="dateTo" Runat="server">
                                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                                        ViewSelectorText="x">
                                                    </Calendar>
                                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                                                    </DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSortdateSubmit" runat="server" 
                                                    onclick="btnSortdateSubmit_Click" Text="Submit" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>                        
                    </table>
                </asp:Panel>
            </td>
            
        </tr>
       
        <tr>
        
       <td colspan="3">
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
               AllowSorting="True" GridLines="None" 
               Skin="WebBlue" onitemcommand="RadGrid1_ItemCommand" PageSize="50" 
               onpageindexchanged="RadGrid1_PageIndexChanged" 
               onpagesizechanged="RadGrid1_PageSizeChanged" 
               onsortcommand="RadGrid1_SortCommand">
               <HeaderContextMenu EnableAutoScroll="True">
               </HeaderContextMenu>
               <MasterTableView autogeneratecolumns="False" datakeynames="id" >                   
                   <CommandItemSettings ExportToPdfText="Export to PDF" />
                   <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                       Visible="True">
                   </RowIndicatorColumn>
                   <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                       Visible="True">
                   </ExpandCollapseColumn>
                   <Columns>
                       
                       <telerik:GridTemplateColumn HeaderText="Sr.">
                        <ItemTemplate>
                            <%# Container.DataSetIndex +1 %>
                        </ItemTemplate>
                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                       </telerik:GridTemplateColumn>
                       
                        <telerik:GridBoundColumn DataField="date" DataType="System.DateTime" ItemStyle-VerticalAlign="Top" AllowSorting="true" HeaderStyle-Font-Underline="true" HeaderStyle-Width="105px"
                           HeaderText="Date" SortExpression="date" UniqueName="date" DataFormatString="{0:dd, MMM yyyy}" >
                            <HeaderStyle Font-Underline="True" Width="105px" />
                            <ItemStyle VerticalAlign="Top" Width="105px" />
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="time" HeaderText="Time" ItemStyle-VerticalAlign="Top" AllowSorting="false" HeaderStyle-Font-Underline="false" HeaderStyle-Width="70px"
                           SortExpression="time" UniqueName="time">                           
                           <HeaderStyle Font-Underline="False" Width="70px" />
                           <ItemStyle VerticalAlign="Top" Width="70px" />
                       </telerik:GridBoundColumn>  
                       
                        <telerik:GridBoundColumn DataField="ClubName" HeaderText="RC of" ItemStyle-VerticalAlign="Top" HeaderStyle-Font-Underline="true" HeaderStyle-Width="120px"
                           SortExpression="ClubName" UniqueName="ClubName">
                            <HeaderStyle Font-Underline="True" Width="120px" />
                           <ItemStyle VerticalAlign="Top" Width="120px" />
                       </telerik:GridBoundColumn>     
                       
                                       
                       <telerik:GridBoundColumn DataField="name" HeaderText="Spk. Name" ItemStyle-VerticalAlign="Top" HeaderStyle-Font-Underline="true" HeaderStyle-Width="100px"
                           SortExpression="name" UniqueName="name">
                           <HeaderStyle Font-Underline="True" Width="100px" />
                           <ItemStyle VerticalAlign="Top" Width="100px" />
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="event_name" HeaderText="Event Name" ItemStyle-VerticalAlign="Top" HeaderStyle-Font-Underline="true" HeaderStyle-Width="100px"
                           SortExpression="event_name" UniqueName="event_name">
                           <HeaderStyle Font-Underline="True" Width="100px" />
                           <ItemStyle VerticalAlign="Top" Width="100px" />
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="topics" HeaderText="Topic" ItemStyle-VerticalAlign="Top" AllowSorting="false" HeaderStyle-Font-Underline="false" HeaderStyle-Width="100px"
                           SortExpression="topics" UniqueName="topics">
                           <HeaderStyle Font-Underline="False" Width="100px" />
                           <ItemStyle VerticalAlign="Top" Width="100px" />
                       </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="venue" HeaderText="Venue" ItemStyle-VerticalAlign="Top" AllowSorting="false" HeaderStyle-Font-Underline="false" HeaderStyle-Width="150px"
                           SortExpression="venue" UniqueName="venue">
                           <HeaderStyle Font-Underline="False" Width="150px" />
                           <ItemStyle VerticalAlign="Top" Width="150px" />
                       </telerik:GridBoundColumn>
                       
                        <telerik:GridBoundColumn DataField="speaker_events" HeaderText="Type" ItemStyle-VerticalAlign="Top" HeaderStyle-Font-Underline="true" HeaderStyle-Width="50px"
                           SortExpression="speaker_events" UniqueName="speaker_events">
                            <HeaderStyle Font-Underline="True" Width="50px" />
                           <ItemStyle VerticalAlign="Top" Width="50px" />
                       </telerik:GridBoundColumn>     
                                            
                        <telerik:GridTemplateColumn  HeaderText="Action" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center"  HeaderStyle-Font-Underline="false">
                     <ItemTemplate>
                             <a href='AddSpeakerEvents.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
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
          <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               SelectCommand="SELECT ROW_NUMBER () OVER (ORDER BY date DESC) AS RowNumber, SUBSTRING(club_name, 16, 500) AS ClubName, * FROM [View_SpeakerEvents]">
           </asp:SqlDataSource>--%>
            </td>
        </tr> 
        <tr><td align="center" colspan="2">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>       
       
    </table>
    
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


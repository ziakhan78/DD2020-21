<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_ocv_report_book.aspx.cs" Inherits="admin_view_ocv_report_book" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    
    <table style="width:100%;" class="txt" >
               
            <tr>              
               <td class="header_title">View OCV Report Book
               </td>
            </tr>
            
           
       
            <tr>
                <td>
                <asp:Panel ID="SearchPanel" runat="server" GroupingText="Search By">
						<table style="text-align:right;" width="865px">
						
					
						<tr>
							
							<td valign="top" align="right" width="100%">
								<table width="100%">
								
								
								<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left" width="150px"  >
                                           <asp:RadioButtonList ID="rbtnSearch" runat="server" 
                                                RepeatDirection="Horizontal" 
                                                onselectedindexchanged="rbtnSearch_SelectedIndexChanged" 
                                                AutoPostBack="True">
                                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                                <asp:ListItem Value="1">Club Name</asp:ListItem> 
                                            </asp:RadioButtonList>                                           
                                        </td>

                                        <td align="left">                                        
                                            <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                                                CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                                                DataValueField="id" 
                                                onselectedindexchanged="DDLClubName_SelectedIndexChanged" 
                                                AutoPostBack="True">
                                                <asp:ListItem>Select Club Name</asp:ListItem>
                                            </asp:DropDownList>
                                        
                                        </td>
									</tr>									
									
									
									
								</table>
							</td>
						</tr>
						</table>
						</asp:Panel>
                </td>
            </tr>
          
       
        <tr>
       <td>
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True"  GridLines="None" 
               Skin="WebBlue"  PageSize="25" onitemcommand="RadGrid1_ItemCommand" 
               onpageindexchanged="RadGrid1_PageIndexChanged" 
               onpagesizechanged="RadGrid1_PageSizeChanged" 
               onsortcommand="RadGrid1_SortCommand">
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" 
                   DataKeyNames="id">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
    
        

        
         <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridTemplateColumn>
        
      
        <telerik:GridBoundColumn DataField="ClubName" HeaderText="Club Name RC of" HeaderStyle-Font-Underline="true"
            SortExpression="ClubName" UniqueName="ClubName">
            <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="200px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>

        
        <telerik:GridTemplateColumn HeaderText="Title">
        <ItemTemplate >
        <a href='../OCV_Report_Books/<%# Eval("ocv_files") %>' target="_blank"><%# Eval("ocv_files")%></a>
        </ItemTemplate>
        
        <HeaderStyle Width="380px" HorizontalAlign="Left" Font-Bold="true" />
        <ItemStyle Width="380px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridTemplateColumn>
        
         
        
         <%--<telerik:GridTemplateColumn HeaderText="File Size" >
        <ItemTemplate >
            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("file_size")%>'></asp:Label>
        </ItemTemplate>
        <HeaderStyle Width="110px" VerticalAlign="Top" HorizontalAlign="Right" />
         <ItemStyle Width="110px" VerticalAlign="Top" HorizontalAlign="Right"></ItemStyle> 
        </telerik:GridTemplateColumn>
        --%>
        
        <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime"  HeaderText="Uploaded Date" SortExpression="added_date" UniqueName="added_date" DataFormatString="{0:dd, MMM yyyy}" >
                            <HeaderStyle Font-Underline="True" Width="125px" />
                            <ItemStyle VerticalAlign="Top" Width="125px" />
        </telerik:GridBoundColumn>
        
        
         <telerik:GridBoundColumn DataField="ip_address" HeaderText="IP Address" HeaderStyle-Font-Underline="true"
            SortExpression="ip_address" UniqueName="ip_address">
            <HeaderStyle Width="100px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="100px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
      
        
      
        
<%--    <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                     <ItemTemplate>
                        <a href='add_ocv_report_book.aspx?id=<%# Eval("id") %>'>Edit</a>
                     </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
  </telerik:GridTemplateColumn>--%>

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
</MasterTableView>
               <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
           </telerik:RadGrid>
           
           
          <%--  <asp:SqlDataSource ID="DSocvBook" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               
               SelectCommand="SELECT * FROM [View_OCV_Book] order by added_date desc">
               
           </asp:SqlDataSource>--%>

               <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                   SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
               </asp:SqlDataSource>
           
           
           
       </td></tr>
       
           <tr><td align="center" colspan="3">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr></table>
       
     </ContentTemplate>   
    </asp:UpdatePanel>
     
</asp:Content>





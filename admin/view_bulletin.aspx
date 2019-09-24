<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_bulletin.aspx.cs" Inherits="view_bulletin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   <table style="width:100%;" class="txt" >
               
            <tr>              
               <td class="header_title">View Bulletin
               </td>
            </tr>
       
        <tr>
       <td align="center">
           <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" 
               AutoPostBack="True" onselectedindexchanged="rbtnType_SelectedIndexChanged">
               <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
               <asp:ListItem Value="1">Club Wise</asp:ListItem>
              
           </asp:RadioButtonList>
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" AutoPostBack="True" 
               onselectedindexchanged="DDLClubName_SelectedIndexChanged" >
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
       </td></tr>
       
        <tr>
       <td>
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" DataSourceID="DSBulletien" GridLines="None" 
               Skin="WebBlue"  PageSize="100" 
               onpageindexchanged="RadGrid1_PageIndexChanged" 
               onpagesizechanged="RadGrid1_PageSizeChanged" 
               onsortcommand="RadGrid1_SortCommand" >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" datasourceid="DSBulletien" 
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
        
        <telerik:GridBoundColumn DataField="title" HeaderText="Title" HeaderStyle-Font-Underline="true"
            SortExpression="title" UniqueName="title">
            <HeaderStyle Width="300px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="300px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
        
        <telerik:GridTemplateColumn HeaderText="Bulletin">
        <ItemTemplate >
        <a href='../Bulletin/<%# Eval("bulletin") %>' target="_blank"><%# Eval("bulletin")%></a>
        </ItemTemplate>
        
        <HeaderStyle Width="370px" HorizontalAlign="Left" Font-Bold="true" />
        <ItemStyle Width="370px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridTemplateColumn>
        
         <telerik:GridBoundColumn DataField="frequency" HeaderText="Frequency" HeaderStyle-Font-Underline="true"
            SortExpression="frequency" UniqueName="frequency">
            <HeaderStyle Width="70px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="70px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
        
         <telerik:GridBoundColumn DataField="status" HeaderText="Status" HeaderStyle-Font-Underline="true"
            SortExpression="status" UniqueName="status">
            <HeaderStyle Width="50px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="50px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
      
        
      
        
    <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                     <ItemTemplate>
                             <a href='add_bulletin.aspx?id=<%# Eval("id") %>'>Edit</a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
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
</MasterTableView>
               <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
           </telerik:RadGrid>
           <asp:SqlDataSource ID="DSBulletien" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               SelectCommand="SELECT * FROM [bulletin_tbl] order by id desc">
           </asp:SqlDataSource>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                      
                      
               SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
       </td></tr>
       
       <tr><td align="center" colspan="3">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>
            </table>
       </ContentTemplate>
       </asp:UpdatePanel>
</asp:Content>


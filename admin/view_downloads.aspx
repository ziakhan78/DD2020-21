<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_downloads.aspx.cs" Inherits="admin_view_downloads" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    
     <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View Downloads
               </td>
            </tr>
            
            <tr>
            <td>
             <asp:RadioButtonList ID="rbtnType" runat="server" AutoPostBack="True" 
                     RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True">General</asp:ListItem>
                     <asp:ListItem>Club Leaders</asp:ListItem>
                     <asp:ListItem>District Officers</asp:ListItem>
                     <asp:ListItem >Manuals</asp:ListItem> 
                 </asp:RadioButtonList>
                 
                  
            </td>
            </tr>
       
        <tr>
       <td>
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" DataSourceID="DSDownloads" GridLines="None" 
               Skin="WebBlue" onitemcommand="RadGrid1_ItemCommand" PageSize="100" 
               onitemdatabound="RadGrid1_ItemDataBound">
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" datasourceid="DSDownloads" 
                   DataKeyNames="download_id">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
    
        
<%--       <telerik:GridBoundColumn DataField="RowNumber" HeaderText="Sr."  AllowSorting="false"
            SortExpression="RowNumber" UniqueName="RowNumber">
<HeaderStyle Width="20px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="20px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn> --%>    
          
       <%--  <telerik:GridBoundColumn HeaderStyle-Font-Underline="true"
            DataField="download_id" HeaderText="download_id" 
            SortExpression="download_id" UniqueName="download_id" DataType="System.Int32" 
            ReadOnly="True">
        </telerik:GridBoundColumn>--%>
        
         <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridTemplateColumn>
        
       <%-- <telerik:GridBoundColumn DataField="title" HeaderText="Title" HeaderStyle-Font-Underline="true"
            SortExpression="title" UniqueName="title">
            <HeaderStyle Width="345px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="345px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>--%>
        
        <telerik:GridTemplateColumn HeaderText="Title">
        <ItemTemplate >
        <a href='../Downloads/<%# Eval("download_files") %>' target="_blank"><%# Eval("title")%></a>
        </ItemTemplate>
        
        <HeaderStyle  HorizontalAlign="Left" Font-Bold="true" />
        <ItemStyle  HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridTemplateColumn>
        
         <telerik:GridTemplateColumn HeaderText="Author" >
        <ItemTemplate >
       <%# Eval("author")%>
        </ItemTemplate>
         <ItemStyle Width="230px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle> 
        </telerik:GridTemplateColumn>
        
        
         <telerik:GridTemplateColumn HeaderText="File Size" >
        <ItemTemplate >
            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("file_size")%>'></asp:Label>
        </ItemTemplate>
        <HeaderStyle Width="70px" VerticalAlign="Top" HorizontalAlign="Right" />
         <ItemStyle Width="70px" VerticalAlign="Top" HorizontalAlign="Right"></ItemStyle> 
        </telerik:GridTemplateColumn>
        
        
        
        
         <telerik:GridBoundColumn DataField="status" HeaderText="Status" HeaderStyle-Font-Underline="true"
            SortExpression="status" UniqueName="status">
            <HeaderStyle Width="50px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="50px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
      
        
      
        
    <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                     <ItemTemplate>
                             <a href='add_downloads.aspx?id=<%# Eval("download_id") %>'>Edit</a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px"></ItemStyle>
  </telerik:GridTemplateColumn>
 <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">        
            <ItemTemplate>
                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                </cc1:ConfirmButtonExtender>
                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete" 
                    CommandArgument='<%# Eval("download_id") %>' runat="Server" 
                    AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
            </ItemTemplate>
             <HeaderStyle HorizontalAlign="Center" Width="30px" />
             <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
    </telerik:GridTemplateColumn> 
      
    </Columns>
</MasterTableView>
               <HeaderStyle Font-Bold="True" />
                <AlternatingItemStyle CssClass="treeView" />
                                                <ItemStyle CssClass="treeView" />
           </telerik:RadGrid>
           <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               SelectCommand="SELECT ROW_NUMBER () OVER (ORDER BY download_id) AS RowNumber, * FROM [downloads_tbl]">
           </asp:SqlDataSource>--%>
           
            <asp:SqlDataSource ID="DSDownloads" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               
               SelectCommand="SELECT * FROM [downloads_tbl] WHERE status='Active' and ([section] = @section) ORDER BY [title] asc">
               <SelectParameters>
                   <asp:ControlParameter ControlID="rbtnType" DefaultValue="General" 
                       Name="section" PropertyName="SelectedValue" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
           
           
       </td></tr></table>
       
     </ContentTemplate>   
    </asp:UpdatePanel>
     
</asp:Content>






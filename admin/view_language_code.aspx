<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_language_code.aspx.cs" Inherits="admin_view_language_code" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View Language Code
               </td>
            </tr>
            
           
			
       
        <tr>
       <td colspan="3">
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
               AllowSorting="True" 
               Skin="WebBlue"  PageSize="25" CellSpacing="0" DataSourceID="DSLanguageCode" GridLines="None" OnItemCommand="RadGrid1_ItemCommand" >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" DataSourceID="DSLanguageCode" DataKeyNames="id" >
    <CommandItemSettings ExportToPdfText="Export to PDF" />
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
      

         <telerik:GridBoundColumn DataField="language" HeaderText="Language" 
            SortExpression="language" UniqueName="language" FilterControlAltText="Filter language column">
        </telerik:GridBoundColumn>
        
        <telerik:GridBoundColumn DataField="code" FilterControlAltText="Filter code column" HeaderText="Code" SortExpression="code" UniqueName="code">
        </telerik:GridBoundColumn>
        

              
      <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False" >
                     <ItemTemplate>
                             <a href='add_language_code.aspx?id=<%# Eval("id") %>'>Edit</a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px"></HeaderStyle>

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
         
           <asp:SqlDataSource ID="DSLanguageCode" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" SelectCommand="SELECT * FROM [language_code_tbl] ORDER BY [language]"></asp:SqlDataSource>
         
       </td></tr>
       <tr><td align="center" colspan="4">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>

       </table>
     
     </ContentTemplate>
     </asp:UpdatePanel>
     
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_3140DG_data.aspx.cs" Inherits="admin_view_3140DG_data" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View DGs & RIPs Data
               </td>
            </tr>
           
       
        <tr >
       <td colspan="3">
           &nbsp;</td></tr>

           <tr>
			<td align="right">Select</td>
			    <td>
                    :</td>
                <td width="600">
                    <asp:DropDownList ID="DDLDGs" runat="server" AutoPostBack="True" CssClass="txt">
                        <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Rotary International President</asp:ListItem>
                    <asp:ListItem>Rotary International President Elect</asp:ListItem>
                    <asp:ListItem>Rotary International President Nominee</asp:ListItem>
                    <asp:ListItem>District Governor</asp:ListItem>
                    <asp:ListItem>District Governor Elect</asp:ListItem>
                    <asp:ListItem>District Governor Nominee</asp:ListItem>
                    </asp:DropDownList>
                </td>
			</tr>		

            <tr>
			<td></td>
			    <td>
                </td>
                <td>
                </td>
			</tr>		
       
        <tr >
       <td colspan="3">
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" DataSourceID="SqlDataSource1" 
               Skin="WebBlue"  PageSize="100" onitemcommand="RadGrid1_ItemCommand" >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" datasourceid="SqlDataSource1" DataKeyNames="id">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <CommandItemSettings ExportToPdfText="Export to Pdf" />
    <Columns>
              
        
         <telerik:GridBoundColumn DataField="DGs_RIPs_Data" HeaderText="Data" 
            SortExpression="DGs_RIPs_Data" UniqueName="DGs_RIPs_Data">
            <HeaderStyle Width="660px" />
            <ItemStyle VerticalAlign="Top" Width="660px" />
        </telerik:GridBoundColumn>
        
        
        
        
      <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False" >
                     <ItemTemplate>
                             <a href='add_3140DG_data.aspx?id=<%# Eval("id") %>'>Edit</a>
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
          
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnString %>" 
               SelectCommand="SELECT * FROM [DGs_RIPs_Data_tbl] WHERE ([DGs_RIPs] = @DGs_RIPs)  order by id desc">
               <SelectParameters>
                   <asp:ControlParameter ControlID="DDLDGs" Name="DGs_RIPs" 
                       PropertyName="SelectedValue" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
          
       </td></tr>
        <tr><td align="left" colspan="3">
            &nbsp;</td></tr>
       </table>
     </ContentTemplate></asp:UpdatePanel>
</asp:Content>




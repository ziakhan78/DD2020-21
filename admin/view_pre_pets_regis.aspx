<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_pre_pets_regis.aspx.cs" Inherits="admin_view_pre_pets_regis" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script type="text/JavaScript">
            <!--
     function MM_openBrWindow(theURL, winName, features) { //v2.0
         window.open(theURL, winName, features);
     }
            //-->
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    
    <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View Pre PETS Registration Form
               </td>
            </tr>           
           
       
        <tr>
       <td>
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" DataSourceID="DSPrePets" GridLines="None" 
               Skin="WebBlue" onitemcommand="RadGrid1_ItemCommand" PageSize="50" >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" datasourceid="DSPrePets" 
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
       
        
         <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name" HeaderStyle-Font-Underline="true" >
                                        <ItemTemplate>
                                        <a href="javascript:void(0)"onclick="MM_openBrWindow('pets_popup_details.aspx?id=<%# Eval("id")%>', '01111', 'width=620, height=600')" >
                                        <%# Eval("name")%>
                                        </a>
                                        </ItemTemplate>
                                        <HeaderStyle Width="150px" HorizontalAlign="Left" />
                                        <ItemStyle Width="150px" HorizontalAlign="Left" VerticalAlign="Top" />
          </telerik:GridTemplateColumn> 
        

        <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name" HeaderStyle-Font-Underline="true"
            SortExpression="club_name" UniqueName="club_name">
            <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="200px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="classification" HeaderText="Classification" HeaderStyle-Font-Underline="true"
            SortExpression="classification" UniqueName="classification">
            <HeaderStyle Width="150px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="150px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="emailId" HeaderText="Email-Id" HeaderStyle-Font-Underline="true"
            SortExpression="emailId" UniqueName="emailId">
            <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="200px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>


         <telerik:GridBoundColumn DataField="mobile" HeaderText="Mobile" HeaderStyle-Font-Underline="true"
            SortExpression="mobile" UniqueName="mobile">
            <HeaderStyle Width="100px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="100px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
      
        
      
        
   <%-- <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                     <ItemTemplate>
                             <a href='add_downloads.aspx?id=<%# Eval("download_id") %>'>Edit</a>
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
          
           
            <asp:SqlDataSource ID="DSPrePets" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>"                
               SelectCommand="SELECT * FROM [View_PrePETS] ORDER BY name asc">             
           </asp:SqlDataSource>
           
           
       </td></tr></table>
       
     </ContentTemplate>   
    </asp:UpdatePanel>
     
</asp:Content>







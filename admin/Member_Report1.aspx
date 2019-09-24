
<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="Member_Report1.aspx.cs" Inherits="admin_Member_Report1" Title="" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Export Members Spouse Occasion Data
               </td>
        </tr>
        
         <tr>           
               <td >
                   <asp:Panel ID="PanelSortReports" runat="server" 
                       GroupingText="Sort Reports" Width="885px">
                       <table align="left">
                           <tr>
                              
                               <td>
                                   <asp:RadioButtonList ID="rbtnSort" runat="server" AutoPostBack="True" 
                                       onselectedindexchanged="rbtnSort_SelectedIndexChanged" 
                                       RepeatDirection="Horizontal">
                                       <asp:ListItem Selected="True" Text="All" Value="0"></asp:ListItem>
                                       <asp:ListItem Text="By Month" Value="1"></asp:ListItem>
                                       <asp:ListItem Text="By Date" Value="2"></asp:ListItem>
                                       
                                   </asp:RadioButtonList>
                               </td>
                               <td align="left">
                                   
                                   <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" 
                                       onselectedindexchanged="ddlMonth_SelectedIndexChanged">
                                   </asp:DropDownList>                                   
                                   
                                   <asp:Panel ID="PanelDate" runat="server">
                                       <table class="style5">
                                           <tr>
                                               <td>
                                                   From :</td>
                                               <td>
                                                   <telerik:raddatepicker id="dateFrom" runat="server">
                                                       <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False" 
                                                           viewselectortext="x">
                                                       </calendar>
                                                       <datepopupbutton hoverimageurl="" imageurl="" />
                                                       <dateinput dateformat="dd/MM/yyyy" displaydateformat="dd/MM/yyyy">
                                                       </dateinput>
                                                   </telerik:raddatepicker>
                                               </td>
                                               <td>
                                                   To :</td>
                                               <td>
                                                   <telerik:raddatepicker id="dateTo" runat="server">
                                                       <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False" 
                                                           viewselectortext="x">
                                                       </calendar>
                                                       <datepopupbutton hoverimageurl="" imageurl="" />
                                                       <dateinput dateformat="dd/MM/yyyy" displaydateformat="dd/MM/yyyy">
                                                       </dateinput>
                                                   </telerik:raddatepicker>
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
               <td >
           
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView"
                        Width="885px" >
                       <Columns>
                        
                                                  
                            <asp:BoundField DataField="dob" HeaderText="Date" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"
                               SortExpression="dob" /> 
                               
                           <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                               <ItemTemplate >
                                   
                               <%# Eval("Name")%>
                               </ItemTemplate>
                           </asp:TemplateField>
                           
                         
                                <asp:BoundField DataField="status" HeaderText="Occaision" SortExpression="status" HeaderStyle-Width="120px" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        
                             
                       </Columns>
                   </asp:GridView>
                
               </td>
        </tr>
         <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" 
                    onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            &nbsp;</td>
        </tr>
        </table>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="export_excel.aspx.cs" Inherits="admin_export_excel" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Export Members Data
               </td>
        </tr>
        <tr>
        <td class="style1">
                    <b>Select The Fields for Export to Excel</b></td>
        </tr>
        
        <tr>
        <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="DSMem" CssClass="treeView" 
                        RepeatColumns="4" RepeatDirection="Horizontal" 
                        Width="780px" >
                        <ItemTemplate>                                                  
                             <asp:CheckBox ID="chk" runat="server" />
                             <asp:Label ID="lblName" runat="server" Text='<%# Eval("COLUMN_NAME") %>'></asp:Label>&nbsp;                                                  
                            <br />                            
                        </ItemTemplate>
                    </asp:DataList>                    
                    
          
            <asp:SqlDataSource ID="DSMem" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="select COLUMN_NAME from information_schema.columns
 where table_name = 'View_MemberForExcel'
order by ordinal_position"></asp:SqlDataSource>
           </td>
        </tr>
        
      <tr>
      <td style="text-align: center">
          <asp:Button ID="btnEx" runat="server" onclick="btnEx_Click" Text="Get Report" 
              CssClass="btn" Width="100px" />
          &nbsp;<asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" Text="Reset" 
              CssClass="btn" Width="100px" />
          </td>
      </tr>
        
      <tr>
      <td>
      <div style="overflow-y: scroll; width:766px;">
          <asp:GridView ID="GridView1" runat="server" CssClass="treeView">
          </asp:GridView>
          </div>
          </td>
          
      </tr>
        
         <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" 
                    onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" 
                    Visible="False" Width="100px" />
            &nbsp;</td>
        </tr>
        </table>
</asp:Content>


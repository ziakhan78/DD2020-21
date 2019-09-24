<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="clubs_user_info_report.aspx.cs" Inherits="admin_clubs_user_info_report" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
        <tr>
            <td class="header_title">
                Export Club's User Info. Report
            </td>
        </tr>

        <tr>
            <td >
                <%--<div style="overflow-y: scroll; width:880px;">--%>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView" >
                        <Columns>
                            <asp:BoundField DataField="Sr" HeaderText="Sr." HeaderStyle-Width="30px" ItemStyle-Width="30px" ReadOnly="True" SortExpression="Sr" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="club_name" HeaderText="Club Name" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />                            
                            <asp:BoundField DataField="Name" HeaderText="President" HeaderStyle-Width="220px" ItemStyle-Width="220px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />                          
                            <asp:BoundField DataField="EmailId" HeaderText="EmailId / Username" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                             <asp:BoundField DataField="Password" HeaderText="Password" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        </Columns>
                    </asp:GridView>
               <%-- </div>--%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            </td>
        </tr>
    </table>
</asp:Content>




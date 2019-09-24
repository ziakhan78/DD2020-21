<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="presidents_reports.aspx.cs" Inherits="admin_presidents_reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>
            <td class="header_title">
                President's List Report
            </td>
        </tr>

        <tr>
            <td >
                <%--<div style="overflow-y: scroll; width:880px;">--%>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView"  >
                        <Columns>
                            <asp:BoundField DataField="Sr" HeaderText="Sr." HeaderStyle-Width="20px" ItemStyle-Width="20px" ReadOnly="True" SortExpression="Sr" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="Name" HeaderText="President" HeaderStyle-Width="225px" ItemStyle-Width="225px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="designation" HeaderText="Designation" HeaderStyle-Width="85px" ItemStyle-Width="85px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="club_name" HeaderText="Club Name" HeaderStyle-Width="190px" ItemStyle-Width="190px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" HeaderStyle-Width="120px" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="EmailId" HeaderText="EmailId" HeaderStyle-Width="230px" ItemStyle-Width="230px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        </Columns>
                    </asp:GridView>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            </td>
        </tr>
    </table>
</asp:Content>


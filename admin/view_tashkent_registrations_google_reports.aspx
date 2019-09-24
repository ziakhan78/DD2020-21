<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_tashkent_registrations_google_reports.aspx.cs" Inherits="admin_view_tashkent_registrations_google_reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table style="width: 100%;" class="txt">

        <tr>
            <td colspan="3" class="header_title">View Tashkent Registrations Google Report
            </td>
        </tr>
        <!-- search and sort start -->



        <tr>
            <td colspan="3">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="DSInbound">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="100" />
                        <asp:BoundField DataField="emailId" HeaderText="emailId" ItemStyle-Width="150" />

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DSInbound" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * from View_TashkentRegistrations order by name"></asp:SqlDataSource>

                <br />
                <asp:Button Text="Export" OnClick="ExportTextFile" runat="server" />

            </td>
        </tr>


    </table>

</asp:Content>




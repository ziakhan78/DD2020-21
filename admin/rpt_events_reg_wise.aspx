<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="rpt_events_reg_wise.aspx.cs" Inherits="admin_rpt_events_reg_wise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="txt">
        <tr>
            <td class="header_title">Events Registration Report - Registration No. Wise
            </td>
        </tr>

         <tr>
			<td colspan="3">
                Select Event :
                <asp:DropDownList ID="DDLEventName" runat="server" DataSourceID="DSEventsReg" DataTextField="event_title" DataValueField="id" AppendDataBoundItems="true" CssClass="txt" AutoPostBack="True" OnSelectedIndexChanged="DDLEventName_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                </td>
			</tr>

        <tr>
            <td>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    >
                    <Columns>

                        <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <%# Eval("Sr") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="regis_no" HeaderText="Registration No." HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="regis_no" />
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                        <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />
                        <asp:BoundField DataField="mobile" HeaderText="Mobile" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="mobile" />
                        <asp:BoundField DataField="emailId" HeaderText="Email-Id" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="emailId" />
                        <asp:BoundField DataField="payment_type" HeaderText="Payment Mode" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_type" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="amount" DataFormatString="{0:n}" />
                        <asp:BoundField DataField="payment_status" HeaderText="Status" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_status" />
                        <asp:BoundField DataField="added_date" HeaderText="Regis. Date Time" HeaderStyle-Width="500px" ItemStyle-Width="500px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="added_date" DataFormatString="{0:dd MMM, yyyy hh:mm:ss}" />

                    </Columns>
                </asp:GridView>
              
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            </td>
        </tr>

         <tr><td align="center" colspan="3">
             <asp:SqlDataSource ID="DSEventsReg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [event_title] FROM [Dist_Event_Reg_Master_tbl] ORDER BY [event_title]"></asp:SqlDataSource>
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
             <asp:SqlDataSource ID="DSDistClubNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc"></asp:SqlDataSource>
            </td></tr>
    </table>
</asp:Content>
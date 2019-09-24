<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="rpt_3rd_trf_club_wise.aspx.cs" Inherits="admin_rpt_3rd_trf_club_wise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="txt">
        <tr>
            <td class="header_title">Club Wise Report
            </td>
        </tr>


        <tr>
            <td>

                <asp:RadioButtonList ID="rbtnType" runat="server"
                    RepeatDirection="Horizontal" AutoPostBack="True"
                    OnSelectedIndexChanged="pe_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                    <asp:ListItem Value="1">Club Wise</asp:ListItem>
                    <asp:ListItem Value="2">Not Participating Club</asp:ListItem>
                </asp:RadioButtonList>

                <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                    CssClass="txt" DataSourceID="DSDistClubNo"
                    DataTextField="club_name" DataValueField="id" AutoPostBack="True"
                    OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                    <asp:ListItem>Select Club Name</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                    Width="100%" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>

                        <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# Eval("Sr") %>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="190px" ItemStyle-Width="190px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />

                        <asp:TemplateField HeaderText="No. of Members" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                            <ItemTemplate>
                                <%# Eval("maxnoofclub")%>
                            </ItemTemplate>

                            <FooterTemplate>
                                <b>Total :
                                    <asp:Label ID="lblTotal" runat="server" /></b>
                            </FooterTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%">
                    <Columns>

                        <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# Eval("Sr") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                        <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />
                        <asp:BoundField DataField="regis_no" HeaderText="Reg. No." HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="regis_no" />
                        <asp:BoundField DataField="mobile" HeaderText="Mobile" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="mobile" />
                        <asp:BoundField DataField="emailId" HeaderText="Email-Id" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="emailId" />
                        <asp:BoundField DataField="payment_type" HeaderText="Payment Mode" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_type" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="amount" DataFormatString="{0:n}" />
                        <asp:BoundField DataField="payment_status" HeaderText="Status" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_status" />
                        <asp:BoundField DataField="added_date" HeaderText="Regis. Date Time" HeaderStyle-Width="500px" ItemStyle-Width="500px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="added_date" DataFormatString="{0:dd MMM, yyyy hh:mm:ss}" />

                    </Columns>
                </asp:GridView>

                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="885px">
                    <Columns>

                        <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# Eval("Sr") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="300px" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />

                    </Columns>
                </asp:GridView>


            </td>
        </tr>

        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" Text="No records to display."></asp:Label></td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
                &nbsp;<asp:SqlDataSource ID="DSDistClubNo" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnString %>"
                    SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

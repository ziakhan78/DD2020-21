<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ri_account_report.aspx.cs" Inherits="admin_ri_account_report" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">--%>
    <table width="100%" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

        <tr>
            <td colspan="2" class="header_title">Rotary Account Report
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Panel ID="PanelSort" runat="server" Width="100%" GroupingText="Sort By">
                    <asp:RadioButtonList ID="rbtnAccount" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnAccount_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                        <asp:ListItem Value="1">With Account</asp:ListItem>
                        <asp:ListItem Value="2">Without Account</asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:RadioButtonList ID="rbtnClubwise" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnClubwise_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                        <asp:ListItem Value="1">Clubwise</asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                        AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClub"
                        DataTextField="club_name" DataValueField="id"
                        OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                        <asp:ListItem>Select Club Name</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DSDistClub" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                        SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                </asp:Panel>

            </td>
        </tr>

        <tr>
            <td>

                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" AllowSorting="false" Skin="Default" PageSize="100" CssClass="treeView" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                    <MasterTableView AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Sr.">
                                <ItemTemplate>
                                    <%# Container.DataSetIndex +1 %>
                                </ItemTemplate>
                                <ItemStyle Width="30px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="30px" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" ReadOnly="True" SortExpression="Name" UniqueName="Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="club_name" FilterControlAltText="Filter club_name column" HeaderText="Club Name" SortExpression="club_name" UniqueName="club_name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EmailId" FilterControlAltText="Filter EmailId column" HeaderText="Email Id" SortExpression="EmailId" UniqueName="EmailId" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile1" FilterControlAltText="Filter Mobile1 column" HeaderText="Mobile" SortExpression="Mobile1" UniqueName="Mobile1" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ri_account_created" FilterControlAltText="Filter ri_account_created column" HeaderText="Rotary Account" SortExpression="ri_account_created" UniqueName="ri_account_created" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>


                        </Columns>
                    </MasterTableView>
                    <HeaderStyle Font-Bold="true" />
                    <ItemStyle HorizontalAlign="Left" />
                </telerik:RadGrid>


            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
                &nbsp;</td>
        </tr>

        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                    Style="font-weight: bold; font-size: 14px; color: #FF0000;"></asp:Label>

            </td>
        </tr>

    </table>

</asp:Content>


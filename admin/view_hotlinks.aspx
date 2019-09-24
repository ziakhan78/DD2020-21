<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_hotlinks.aspx.cs" Inherits="view_hotlinks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td colspan="3" class="header_title">View Hot Links
                    </td>
                </tr>
                <tr>
                    <td align="center">

                        <asp:RadioButtonList ID="rbtnFor" runat="server"
                            RepeatDirection="Horizontal" AutoPostBack="True"
                            OnSelectedIndexChanged="rbtnFor_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True" Text="All"></asp:ListItem>
                            <asp:ListItem Value="1" Text="District"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Club"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Default"></asp:ListItem>
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
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" DataSourceID="DSHotlinks" GridLines="None"
                            Skin="WebBlue" OnItemCommand="RadGrid1_ItemCommand" PageSize="100"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataSourceID="DSHotlinks"
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

                                    <telerik:GridBoundColumn DataField="title" HeaderText="Title" HeaderStyle-Font-Underline="true"
                                        SortExpression="title" UniqueName="title">
                                        <HeaderStyle Width="500px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="500px" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Links">
                                        <ItemTemplate>
                                            <a href='<%# Eval("link_file") %>' target="_blank"><%# Eval("link_file")%></a>
                                        </ItemTemplate>

                                        <HeaderStyle Width="500px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="500px" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                    <%--<telerik:GridBoundColumn DataField="status" HeaderText="Status" HeaderStyle-Font-Underline="true"
            SortExpression="status" UniqueName="status">
            <HeaderStyle Width="50px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="50px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>--%>



                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <a href='add_hotlinks.aspx?id=<%# Eval("id") %>'>Edit</a>
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>

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
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DSHotlinks" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>"
                            SelectCommand="SELECT * FROM [hotlinks_tbl]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>"
                            SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



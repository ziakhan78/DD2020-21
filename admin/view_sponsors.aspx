<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_sponsors.aspx.cs" Inherits="admin_view_sponsors" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table width="100%" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Sponsers
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnOrder" runat="server" Text="Set Display Order" OnClick="btnOrder_Click" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" DataSourceID="DSSponser" GridLines="None"
                            Skin="WebBlue" PageSize="100" OnItemCommand="RadGrid1_ItemCommand">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataSourceID="DSSponser"
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
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="Title" SortExpression="title">
                                        <ItemTemplate>
                                            <a href='../Sponsers_Logo/<%# Eval("logo") %>' target="_blank"><%# Eval("title")%></a>
                                        </ItemTemplate>
                                        <HeaderStyle Width="400px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="400px" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="start_date" HeaderText="Start Date" DataFormatString="{0:dd MMMM, yyyy}"
                                        SortExpression="start_date" UniqueName="start_date" DataType="System.DateTime">
                                        <HeaderStyle Width="110px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="110px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="end_date" HeaderText="End Date" DataFormatString="{0:dd MMMM, yyyy}"
                                        SortExpression="end_date" UniqueName="end_date" DataType="System.DateTime">
                                        <HeaderStyle Width="110px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="110px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="status" HeaderText="Status" HeaderStyle-Font-Underline="true"
                                        SortExpression="status" UniqueName="status">
                                        <HeaderStyle Width="50px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="50px" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_sponsor.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>

                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
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
                        </telerik:RadGrid>


                        <asp:SqlDataSource ID="DSSponser" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>"
                            SelectCommand="SELECT * FROM [dist_sponsers_tbl] ORDER BY display_order asc"></asp:SqlDataSource>
                    </td>
                </tr>

                <tr id="TrList" runat="server">
                    <td>

                        <telerik:RadListBox ID="ListOrder" runat="server" AllowReorder="True" DataSourceID="DSSpnsorList" Width="500px" Skin="WebBlue" DataTextField="title" DataValueField="display_order" Height="300px">

                            <ButtonSettings TransferButtons="All" />
                        </telerik:RadListBox>
                        <asp:SqlDataSource ID="DSSpnsorList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" SelectCommand="SELECT * FROM [dist_sponsers_tbl] ORDER BY display_order asc"></asp:SqlDataSource>



                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnDispOrder" runat="server" OnClick="btnDispOrder_Click" Text="Update Display Order" /></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_add_discon_registration_rate.aspx.cs" Inherits="admin_view_add_discon_registration_rate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="14" class="header_title">View Discon Registration Fees Master </td>
                </tr>

                <tr>
                    <td>


                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" DataSourceID="DSPHSM" GridLines="None"
                            Skin="WebBlue" PageSize="50"
                            OnItemCommand="RadGrid1_ItemCommand">

                            <MasterTableView AutoGenerateColumns="False" DataSourceID="DSPHSM" DataKeyNames="id">

                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="member_type" HeaderText="Member Type" HeaderStyle-Font-Underline="true"
                                        SortExpression="member_type" UniqueName="member_type">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="category" HeaderText="Category" HeaderStyle-Font-Underline="true"
                                        SortExpression="category" UniqueName="category">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="registration_fees_for" HeaderText="registration_fees_for" HeaderStyle-Font-Underline="true"
                                        SortExpression="registration_fees_for" UniqueName="registration_fees_for">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="date_from" HeaderText="Date From" DataFormatString="{0:dd MMMM, yyyy}"
                                        SortExpression="date_from" UniqueName="date_from" DataType="System.DateTime">
                                        <HeaderStyle Width="150px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="150px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="date_to" HeaderText="Date To" DataFormatString="{0:dd MMMM, yyyy}"
                                        SortExpression="date_to" UniqueName="date_to" DataType="System.DateTime">
                                        <HeaderStyle Width="150px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="150px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>


                                    <telerik:GridBoundColumn DataField="amount" HeaderText="Amount" HeaderStyle-Font-Underline="true"
                                        SortExpression="amount" UniqueName="amount">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>


                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_phsm.aspx?id=<%# Eval("id") %>'>Edit</a>
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
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DSPHSM" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM discon_registration_rate_master_tbl order by category "></asp:SqlDataSource>

                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


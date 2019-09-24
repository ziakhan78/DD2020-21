<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_monthly_message.aspx.cs" Inherits="admin_view_monthly_message" Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Monthly Message
                    </td>
                </tr>

                <!-- search and sort start -->

              <tr>
                    <td  colspan="3">
                                        <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                            OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                                            <asp:ListItem Value="1">RI</asp:ListItem>
                                            <asp:ListItem Value="2">DG</asp:ListItem>
                                            <asp:ListItem Value="3">TRF Chair</asp:ListItem>
                                        </asp:RadioButtonList>

                    </td>
                </tr>

                <tr>
                    <td colspan="3"></td>
                </tr>
                <!-- search and sort end -->

                <tr>
                    <td colspan="3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" GridLines="None"
                            Skin="Default" OnItemCommand="RadGrid1_ItemCommand" PageSize="100"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
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

                                 

                                    <telerik:GridBoundColumn HeaderStyle-Font-Underline="true"
                                        DataField="month" HeaderText="Month/Year" SortExpression="month" UniqueName="month" DataFormatString="{0:MMMM, yyyy}">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="message_from" HeaderText="Message From" HeaderStyle-Font-Underline="true"
                                        SortExpression="message_from" UniqueName="message_from">
                                    </telerik:GridBoundColumn>


                                     <telerik:GridBoundColumn DataField="message" HeaderText="Message" HeaderStyle-Font-Underline="true"
                                        SortExpression="message" UniqueName="message">
                                    </telerik:GridBoundColumn>

                                 

                                      <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <a href='add_monthly_message.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
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
                            <AlternatingItemStyle VerticalAlign="Top" />
                            <ItemStyle VerticalAlign="Top" />
                        </telerik:RadGrid>
                      
                    </td>
                </tr>

                <tr>
                    <td align="left" colspan="4">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: 700"></asp:Label></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>




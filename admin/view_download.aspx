<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_download.aspx.cs" Inherits="admin_view_download" Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
        .AlphabetPager a, .AlphabetPager span
        {
            font-family: Arial, Tahoma, Times New Roman, verdana;
            font-size: 11px;
            display: inline-block;
            height: 15px;
            line-height: 15px;
            min-width: 15px;
            text-align: center;
            text-decoration: none;
            font-weight: normal;
            padding: 0 1px 0 1px;
        }
        .AlphabetPager a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .AlphabetPager span
        {
            background-color: #df0909;
            color: #fff;
            border: 1px solid #e9e5e5;
        }
        .space {
            padding-bottom: 4px;
            margin-bottom:5px;
            
        }

        .AlphabetPager a:hover
        {
            background-color: #df0909;
            color: #fff;
            border: 1px solid;
        }
      

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="2" class="header_title">View Downloads
                    </td>
                </tr>

                <!-- search and sort Start -->

                <tr>
                    <td valign="top">
                        <div style="width: 170px; border: 1px solid #f4f4f4; vertical-align: middle; text-align: center; margin-bottom: 10px; padding-top: 5px; background-color: #f2f2f2; height: 20px;">
                            <b>::&nbsp;Alphabetic Search&nbsp;::</b>
                        </div>
                        <div class="AlphabetPager" style="width: 160px;">
                            <asp:Repeater ID="rptAlphabets" runat="server" >
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text='<%#Eval("Value")%>' Visible='<%# !Convert.ToBoolean(Eval("Selected"))%>'
                                        OnClick="Alphabet_Click" CssClass="space" />
                                    <asp:Label runat="server" Text='<%#Eval("Value")%>' Visible='<%# Convert.ToBoolean(Eval("Selected"))%>' />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </td>


                    <td valign="top" width="300px" align="right">
                          <div style="width: 300px; border: 1px solid #f4f4f4; vertical-align: middle; text-align: center; margin-bottom: 10px; padding-top: 5px; background-color: #f2f2f2; height: 20px;">
                            <b>::&nbsp;Search By&nbsp;::</b>
                        </div>

                        <asp:Panel ID="SearchPanel1" runat="server" DefaultButton="btnSearch">
                            <table width="100%">
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:RadioButtonList ID="rbtnSearch" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">Text</asp:ListItem>
                                            <asp:ListItem Value="1">Author</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>

                                <tr>
                                    <td valign="top" align="left">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                            OnClick="btnSearch_Click" Text="Search" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                </tr>

                <!-- search and sort end -->

                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbtnDownloadType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnDownloadType_SelectedIndexChanged">
                            <asp:ListItem Text="Powerpoints" Selected="True" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Documents" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Manuals" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" GridLines="None"
                            Skin="Default" OnItemCommand="RadGrid1_ItemCommand" PageSize="25"
                            OnItemDataBound="RadGrid1_ItemDataBound" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
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



                                    <telerik:GridTemplateColumn HeaderText="Title" SortExpression="title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFile" runat="server" Text='<%# Eval("file_name") %>' Visible="false"></asp:Label>
                                            <a id="hrefLink" runat="server" href="" target="_blank"><%# Eval("title")%></a>
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" Font-Underline="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Author" SortExpression="author">
                                        <ItemTemplate>
                                            <%# Eval("author")%>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Underline="true" />
                                        <ItemStyle Width="230px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridBoundColumn DataField="event_name" HeaderText="Event Name" HeaderStyle-Font-Underline="true"
                                        SortExpression="event_name" UniqueName="event_name">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>



                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <a href='add_download.aspx?id=<%# Eval("id") %>'>
                                                <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
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


                       <%-- <asp:SqlDataSource ID="DSDownloads" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [download_tbl] where download_type='Powerpoints' ORDER BY [event_date] DESC, [title]"></asp:SqlDataSource>--%>




                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>






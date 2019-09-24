
<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_domain_ftp.aspx.cs" Inherits="admin_view_domain_ftp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

             <table style="width:100%;" class="txt" >

                <tr>
                    <td colspan="3" class="header_title">
                        View 3140-Club's Domain & FTP Information
                    </td>
                </tr>

                <tr>
                    <td >
                       <%-- <div style="overflow-y: scroll; width:880px;">--%>
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                                             AllowSorting="True" CellSpacing="0" DataSourceID="DSdomain_ftp" 
                                             GridLines="Horizontal" Skin="WebBlue" PageSize="25" 
                                             onitemcommand="RadGrid1_ItemCommand">
                                <MasterTableView autogeneratecolumns="False" datakeynames="id" datasourceid="DSdomain_ftp">
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>

                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="club_name" 
                                                                 FilterControlAltText="Filter club_name column" HeaderText="Rotary Club Of" 
                                                                 ReadOnly="True" SortExpression="club_name" UniqueName="club_name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="280px" />
                                        </telerik:GridBoundColumn>

                                        <%--  <telerik:GridBoundColumn DataField="DistrictClubNo" DataType="System.Int32" 
                                        FilterControlAltText="Filter DistrictClubNo column" HeaderText="Club No." 
                                        SortExpression="DistrictClubNo" UniqueName="DistrictClubNo">
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="75px" />
                                        </telerik:GridBoundColumn>--%>

                                       <%-- <telerik:GridBoundColumn DataField="domain_name" 
                                                                 FilterControlAltText="Filter domain_name column" HeaderText="Domain Name" 
                                                                 SortExpression="domain_name" UniqueName="domain_name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="280px" />
                                        </telerik:GridBoundColumn>--%>

                                         <telerik:GridTemplateColumn HeaderText="Domain Name">
                                            <ItemTemplate>
                                            <a href='http://<%# Eval("domain_name") %>' target="_blank" ><%# Eval("domain_name") %></a>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="280px" />
                                        </telerik:GridTemplateColumn>



                                        <telerik:GridBoundColumn DataField="ftp_username" 
                                                                 FilterControlAltText="Filter ftp_username column" HeaderText="FTP Username" 
                                                                 SortExpression="ftp_username" UniqueName="ftp_username">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="150px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ftp_password" 
                                                                 FilterControlAltText="Filter ftp_password column" HeaderText="FTP Password" 
                                                                 SortExpression="ftp_password" UniqueName="ftp_password">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="110px" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Name" 
                                                                 FilterControlAltText="Filter Name column" HeaderText="President Name" ReadOnly="True" 
                                                                 SortExpression="Name" UniqueName="Name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="230px" />
                                        </telerik:GridBoundColumn>
                                        <%-- <telerik:GridBoundColumn DataField="EmailId" 
                                        FilterControlAltText="Filter EmailId column" HeaderText="Email-Id" 
                                        SortExpression="EmailId" UniqueName="EmailId">
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="175px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Mobile1" 
                                        FilterControlAltText="Filter Mobile1 column" HeaderText="Mobile" 
                                        SortExpression="Mobile1" UniqueName="Mobile1">
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="90px" />
                                        </telerik:GridBoundColumn>--%>

                                        <%-- <telerik:GridBoundColumn DataField="Classification" 
                                        FilterControlAltText="Filter Classification column" HeaderText="Classification" 
                                        SortExpression="Classification" UniqueName="Classification">
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridTemplateColumn  HeaderText="Action" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                                                                     ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                            <ItemTemplate>
                                                <a href='add_domain_ftp_info.aspx?id=<%# Eval("id") %>'>Edit</a>
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

                                    <%--  <telerik:GridBoundColumn DataField="id" DataType="System.Int32" 
                                    FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" 
                                    SortExpression="id" UniqueName="id">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="club_id" DataType="System.Int32" 
                                    FilterControlAltText="Filter club_id column" HeaderText="club_id" 
                                    SortExpression="club_id" UniqueName="club_id">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" 
                                    FilterControlAltText="Filter added_date column" HeaderText="added_date" 
                                    SortExpression="added_date" UniqueName="added_date">
                                    </telerik:GridBoundColumn>

                                    --%>
                                    </Columns>

                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>

                                <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />

                                <FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="DSdomain_ftp" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                                               SelectCommand="SELECT * FROM [View_DomainFTP] ORDER BY [club_name]">
                            </asp:SqlDataSource>

                        <%--</div>--%>
                    </td>

                </tr>

            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
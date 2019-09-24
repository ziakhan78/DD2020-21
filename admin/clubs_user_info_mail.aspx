<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="clubs_user_info_mail.aspx.cs" Inherits="admin_clubs_user_info_mail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

             <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >

                <tr>
                    <td class="header_title">
                        Club's User Info. Send Mail
                    </td>
                </tr>

                <tr>
                    <td >
                        
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                                             AllowSorting="True" CellSpacing="0" DataSourceID="DSdomain_ftp" 
                                             GridLines="Horizontal" Skin="WebBlue" PageSize="25" >
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

                                          <telerik:GridTemplateColumn HeaderText="Select" FilterControlToolTip="Select for sending mail" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
        <ItemTemplate>        
          <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>' Visible="false"></asp:Label>
          <asp:Label ID="lblcid" runat="server" Text='<%# Eval("MemberId") %>' Visible="false"></asp:Label>        
          <asp:CheckBox id="chkActive" Runat="server" TextAlign="Left"></asp:CheckBox>
        </ItemTemplate>
<HeaderStyle HorizontalAlign="Left" Width="20px" VerticalAlign="Top"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" Width="20px" VerticalAlign="Top"></ItemStyle>

        </telerik:GridTemplateColumn>


                                        <telerik:GridBoundColumn DataField="club_name" 
                                                                 FilterControlAltText="Filter club_name column" HeaderText="Rotary Club Of" 
                                                                 ReadOnly="True" SortExpression="club_name" UniqueName="club_name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="280px" />
                                        </telerik:GridBoundColumn>

                                         <telerik:GridTemplateColumn HeaderText="Domain Name">
                                            <ItemTemplate>
                                            <a href='http://<%# Eval("domain_name") %>' target="_blank" ><%# Eval("domain_name") %></a>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="280px" />
                                        </telerik:GridTemplateColumn>

                                        <%-- <telerik:GridBoundColumn DataField="ftp_username" 
                                                                 FilterControlAltText="Filter ftp_username column" HeaderText="FTP Username" 
                                                                 SortExpression="ftp_username" UniqueName="ftp_username">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="150px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ftp_password" 
                                                                 FilterControlAltText="Filter ftp_password column" HeaderText="FTP Password" 
                                                                 SortExpression="ftp_password" UniqueName="ftp_password">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="110px" />
                                        </telerik:GridBoundColumn>  --%>                                 
                                        

                                        <telerik:GridBoundColumn DataField="Name" 
                                                                 FilterControlAltText="Filter Name column" HeaderText="President Name" ReadOnly="True" 
                                                                 SortExpression="Name" UniqueName="Name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="230px" />
                                        </telerik:GridBoundColumn>   
                                            
                                         
                                         

                                       

                                   
                                    </Columns>

                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>

                                <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />

                                <FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="DSdomain_ftp" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                                               SelectCommand="SELECT * FROM [View_DomainFTP] ORDER BY [club_name]">
                            </asp:SqlDataSource>

                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnSendLoginPass" runat="server" CssClass="btn" 
                            onclick="btnSendLoginPass_Click" Text="Send Login Id Password" />
                    </td>
                </tr>

            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

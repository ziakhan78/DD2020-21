<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_service_above_self_awards.aspx.cs" Inherits="admin_view_service_above_self_awards" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <table style="width:100%;" class="txt" >

        <tr>
            <td colspan="3" class="header_title">View Service Above Self Awards</td>
        </tr>

        <tr>
            <td>
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                 AllowSorting="True" DataSourceID="DSDonors" GridLines="None" 
                                 Skin="WebBlue"  PageSize="100" 
                    onitemcommand="RadGrid1_ItemCommand">

                    <MasterTableView autogeneratecolumns="False" datasourceid="DSDonors" DataKeyNames="id">

                        <Columns>

                            <telerik:GridTemplateColumn HeaderText="Sr.">
                                <ItemTemplate>
                                <%# Container.DataSetIndex +1 %>
                                </ItemTemplate>
                                <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridTemplateColumn>


                             <telerik:GridBoundColumn DataField="Years" HeaderText="years" HeaderStyle-Font-Underline="true"
                                                     SortExpression="years" UniqueName="years">
                                <HeaderStyle Width="70px" HorizontalAlign="Left" Font-Bold="true" />
                                <ItemStyle Width="70px" HorizontalAlign="Left" VerticalAlign="Top" />
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="Name" HeaderText="Name" HeaderStyle-Font-Underline="true"
                                                     SortExpression="Name" UniqueName="Name">
                                <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="true" />
                                <ItemStyle Width="200px" HorizontalAlign="Left" VerticalAlign="Top" />
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name" HeaderStyle-Font-Underline="true"
                                                     SortExpression="club_name" UniqueName="club_name">
                                <HeaderStyle Width="200px" HorizontalAlign="Left" Font-Bold="true" />
                                <ItemStyle Width="200px" HorizontalAlign="Left" VerticalAlign="Top" />
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                                                         ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                <ItemTemplate>
                                    <a href='add_service_above_self_awards.aspx?id=<%# Eval("id") %>'>Edit</a>
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
                    <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
                </telerik:RadGrid>
                <asp:SqlDataSource ID="DSDonors" runat="server" 
                                   ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                                   SelectCommand="SELECT (fname+' '+ mname+' '+lname) as Name,* FROM service_above_self_awards_tbl order by years desc, fname,mname,lname">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


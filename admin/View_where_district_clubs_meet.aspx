<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="View_where_district_clubs_meet.aspx.cs" Inherits="admin_View_where_district_clubs_meet" Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>



            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View District Rotary Clubs</td>
                </tr>

                <tr>

                    <!-- search and sort start -->

                    <tr>
                        <td valign="top" class="style5" align="left">
                            <table width="200">
                                <tr>
                                    <td valign="top" align="center" style="width: 195px; border-right: #f4f4f4 1px solid; border-top: #f4f4f4 1px solid; border-left: #f4f4f4 1px solid; border-bottom: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                                        <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="border-collapse: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
                                            <tr>
                                                <td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'"
                                                    onmouseout="this.style.backgroundColor='#f9f9f9'" align="center">
                                                    <asp:LinkButton ID="LnkA" runat="server" OnClick="LnkA_Click" CssClass="txtSearch">A</asp:LinkButton></td>
                                                <td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkB" runat="server"
                                                        OnClick="LnkB_Click" CssClass="txtSearch">B</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkC" runat="server"
                                                        OnClick="LnkC_Click" CssClass="txtSearch">C</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkD" runat="server"
                                                        OnClick="LnkD_Click" CssClass="txtSearch">D</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkE" runat="server"
                                                        OnClick="LnkE_Click" CssClass="txtSearch">E</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkF" runat="server"
                                                        OnClick="LnkF_Click" CssClass="txtSearch">F</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkG" runat="server"
                                                        OnClick="LnkG_Click" CssClass="txtSearch">G</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkH" runat="server"
                                                        OnClick="LnkH_Click" CssClass="txtSearch">H</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkI" runat="server"
                                                        OnClick="LnkI_Click" CssClass="txtSearch">I</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkJ" runat="server"
                                                        OnClick="LnkJ_Click" CssClass="txtSearch">J</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkK" runat="server"
                                                        OnClick="LnkK_Click" CssClass="txtSearch">K</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkL" runat="server"
                                                        OnClick="LnkL_Click" CssClass="txtSearch">L</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkM" runat="server"
                                                        OnClick="LnkM_Click" CssClass="txtSearch">M</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkN" runat="server" OnClick="LnkN_Click" CssClass="txtSearch">N</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkO" runat="server"
                                                        OnClick="LnkO_Click" CssClass="txtSearch">O</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkP" runat="server"
                                                        OnClick="LnkP_Click" CssClass="txtSearch">P</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkQ" runat="server"
                                                        OnClick="LnkQ_Click" CssClass="txtSearch">Q</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkR" runat="server"
                                                        OnClick="LnkR_Click" CssClass="txtSearch">R</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkS" runat="server"
                                                        OnClick="LnkS_Click" CssClass="txtSearch">S</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkT" runat="server"
                                                        OnClick="LnkT_Click" CssClass="txtSearch">T</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkU" runat="server"
                                                        OnClick="LnkU_Click" CssClass="txtSearch">U</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkV" runat="server"
                                                        OnClick="LnkV_Click" CssClass="txtSearch">V</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkW" runat="server"
                                                        OnClick="LnkW_Click" CssClass="txtSearch">W</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkX" runat="server"
                                                        OnClick="LnkX_Click" CssClass="txtSearch">X</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkY" runat="server"
                                                        OnClick="LnkY_Click" CssClass="txtSearch">Y</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkZ" runat="server"
                                                        OnClick="LnkZ_Click" CssClass="txtSearch">Z</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="Linkbutton1" runat="server"
                                                        OnClick="Linkbutton1_Click" CssClass="txtSearch">ALL</asp:LinkButton>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>




                        <td valign="top" width="300px" align="right">
                            <table style="text-align: right;" width="300px">

                                <tr>
                                    <td valign="top" align="center" style="border: 1px solid #f4f4f4;"
                                        bgcolor="#f4f4f4" class="style1">
                                        <b>&nbsp; ::&nbsp;Search By ::</b>
                                    </td>
                                </tr>
                                <tr>



                                    <td valign="top" align="right" width="100%">
                                        <asp:Panel ID="SearchPanel" runat="server" DefaultButton="btnSearch">
                                            <table width="100%">


                                                <tr>
                                                    <td valign="top" bordercolor="#ffffff" align="left">
                                                        <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                            RepeatDirection="Horizontal" AutoPostBack="True"
                                                            OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                            <asp:ListItem Selected="True" Value="0">Name of Club</asp:ListItem>
                                                            <asp:ListItem Value="1">City</asp:ListItem>
                                                            <asp:ListItem Value="2">Day</asp:ListItem>

                                                        </asp:RadioButtonList>

                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td valign="top" bordercolor="#ffffff" align="left">
                                                        <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                            BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                        <asp:DropDownList ID="DDLDay" runat="server" CssClass="txt"
                                                            OnSelectedIndexChanged="DDLDay_SelectedIndexChanged" AutoPostBack="True">
                                                            <asp:ListItem>Select Day</asp:ListItem>
                                                            <asp:ListItem>Monday</asp:ListItem>
                                                            <asp:ListItem>Tuesday</asp:ListItem>
                                                            <asp:ListItem>Wednesday</asp:ListItem>
                                                            <asp:ListItem>Thursday</asp:ListItem>
                                                            <asp:ListItem>Friday</asp:ListItem>
                                                            <asp:ListItem>Saturday</asp:ListItem>
                                                            <asp:ListItem>Sunday</asp:ListItem>
                                                        </asp:DropDownList>
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
                            </table>
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
                                Skin="WebBlue" PageSize="100" OnItemCommand="RadGrid1_ItemCommand"
                                OnPageIndexChanged="RadGrid1_PageIndexChanged"
                                OnPageSizeChanged="RadGrid1_PageSizeChanged"
                                OnSortCommand="RadGrid1_SortCommand"
                                OnItemDataBound="RadGrid1_ItemDataBound">
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <%--<telerik:GridBoundColumn DataField="id" DataType="System.Int32" HeaderText="id" 
            ReadOnly="True" SortExpression="id" UniqueName="id">
        </telerik:GridBoundColumn>--%>

                                        <%-- <telerik:GridBoundColumn DataField="RowNumber" HeaderText="Sr." SortExpression="RowNumber" UniqueName="RowNumber" AllowSorting="false">
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridBoundColumn>--%>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="club_name" HeaderText="Rotary Club of" SortExpression="club_name" UniqueName="club_name">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="venue" HeaderText="Venue" SortExpression="venue" UniqueName="venue">
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="meet_days" HeaderText="Day" SortExpression="meet_days" UniqueName="meet_days">
                                            <ItemStyle Width="70px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="time" HeaderText="Time" SortExpression="time" UniqueName="time">
                                            <ItemStyle Width="60px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="club_No" HeaderText="Club No." SortExpression="club_No" UniqueName="club_No">
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="years" HeaderText="Years" SortExpression="years" UniqueName="years">
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="MemStrength" HeaderText="Strength" SortExpression="MemStrength" UniqueName="MemStrength">
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridBoundColumn>


                                        <%-- <telerik:GridBoundColumn DataField="charter_date" HeaderText="Charter Date" SortExpression="charter_date" UniqueName="charter_date">
            <ItemStyle Width="60px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridBoundColumn>--%>

                                        <telerik:GridTemplateColumn HeaderText="Charter Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCharterDt" runat="server" Text='<%# Eval("charter_date") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="120px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False">
                                            <ItemTemplate>
                                                <a href='add_where_district_clubs_meet.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                                            </ItemTemplate>

                                            <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top"></ItemStyle>
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


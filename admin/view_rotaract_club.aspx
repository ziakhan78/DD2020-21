<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_rotaract_club.aspx.cs" Inherits="admin_view_rotaract_club" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Rotaract Club
                    </td>
                </tr>
                <!-- search and sort start -->

                <tr>
                    <td valign="top" align="left">
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
                        <asp:Panel ID="SearchPanel" runat="server" DefaultButton="btnSearch">
                            <table style="text-align: right;" width="300px">

                                <tr>
                                    <td valign="top" align="center" style="border: 1px solid #f4f4f4;">
                                        <b>&nbsp; ::&nbsp;Search By ::</b>
                                    </td>
                                </tr>
                                <tr>

                                    <td valign="top" align="right" width="100%">
                                        <table width="100%">


                                            <tr>
                                                <td valign="top" align="left">
                                                    <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                        RepeatDirection="Horizontal">
                                                        <asp:ListItem Selected="True" Value="0">Club Name</asp:ListItem>
                                                        <asp:ListItem Value="1">Club No.</asp:ListItem>
                                                        <asp:ListItem Value="1">Sponserd By</asp:ListItem>

                                                    </asp:RadioButtonList>

                                                </td>
                                            </tr>



                                            <tr>
                                                <td valign="top" align="left">
                                                    <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                        BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                                        OnClick="btnSearch_Click" Text="Search" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>

                <tr>
                    <td colspan="3"></td>
                </tr>
                <!-- search and sort end -->

                <tr>
                    <td colspan="3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" CssClass="treeView"
                            AllowSorting="True" DataSourceID="DSRotaract" GridLines="None"
                            Skin="Default" PageSize="100" OnItemCommand="RadGrid1_ItemCommand"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand"
                            OnItemDataBound="RadGrid1_ItemDataBound">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataSourceID="DSRotaract" DataKeyNames="rotaract_id">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                                <Columns>




                                    <%--  <telerik:GridBoundColumn DataField="rotaract_id" HeaderText="rotaract_id"  ItemStyle-Width="20px"
            SortExpression="rotaract_id" UniqueName="rotaract_id" 
            DataType="System.Int32" ReadOnly="True">
        </telerik:GridBoundColumn>--%>

                                    <%--<telerik:GridBoundColumn DataField="RowNumber" HeaderText="Sr."  ItemStyle-Width="20px"
            SortExpression="RowNumber" UniqueName="RowNumber">
        <ItemStyle Width="20px" VerticalAlign="Top" > </ItemStyle>
        </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridBoundColumn DataField="club_name" HeaderText="Rotaract Club of"
                                        SortExpression="club_name" UniqueName="club_name">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <%--  <telerik:GridBoundColumn DataField="club_no" HeaderText="Club No."            
            SortExpression="club_no" UniqueName="club_no" DataType="System.Int32">
            <HeaderStyle Width="65px" HorizontalAlign="Left" />
            <ItemStyle Width="65px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>      --%>



                                    <%--  <telerik:GridBoundColumn DataField="no_of_members" DataType="System.Int32" 
            HeaderText="No. of Members" SortExpression="no_of_members" 
            UniqueName="no_of_members">
             <HeaderStyle Width="55px" HorizontalAlign="Left" />
            <ItemStyle Width="55px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>--%>

                                    <telerik:GridBoundColumn DataField="sponserd" HeaderText="Sponserd By RC of"
                                        SortExpression="sponserd" UniqueName="sponserd">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="PName" HeaderText="President"
                                        SortExpression="PName" UniqueName="PName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="SName" HeaderText="Secretary"
                                        SortExpression="SName" UniqueName="SName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>


                                    <%-- 
        <telerik:GridTemplateColumn HeaderText="Charter Date" HeaderStyle-Width="140px" ItemStyle-Width="140px" SortExpression="charter_date" ItemStyle-VerticalAlign="Top">
       <ItemTemplate>
       <asp:Label ID="lblCdate" runat="server" Text='<%# Eval("charter_date") %>'></asp:Label>
       </ItemTemplate>
       </telerik:GridTemplateColumn>--%>


                                    <%--  <telerik:GridBoundColumn DataField="charter_date" HeaderText="Charter Date" 
            SortExpression="charter_date" UniqueName="charter_date">
             <HeaderStyle Width="100px" HorizontalAlign="Left" />
            <ItemStyle Width="100px" HorizontalAlign="Left" />
        </telerik:GridBoundColumn>--%>


                                    <%--       <telerik:GridBoundColumn DataField="pf_name" HeaderText="pf_name" 
            SortExpression="pf_name" UniqueName="pf_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pm_name" HeaderText="pm_name" 
            SortExpression="pm_name" UniqueName="pm_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pl_name" HeaderText="pl_name" 
            SortExpression="pl_name" UniqueName="pl_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pemailid1" HeaderText="pemailid1" 
            SortExpression="pemailid1" UniqueName="pemailid1">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pemailid2" HeaderText="pemailid2" 
            SortExpression="pemailid2" UniqueName="pemailid2">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pmobile1" HeaderText="pmobile1" 
            SortExpression="pmobile1" UniqueName="pmobile1">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pmobile2" HeaderText="pmobile2" 
            SortExpression="pmobile2" UniqueName="pmobile2">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pblackberry" HeaderText="pblackberry" 
            SortExpression="pblackberry" UniqueName="pblackberry">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pphone" HeaderText="pphone" 
            SortExpression="pphone" UniqueName="pphone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="pdob" HeaderText="pdob" 
            SortExpression="pdob" UniqueName="pdob">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sf_name" HeaderText="sf_name" 
            SortExpression="sf_name" UniqueName="sf_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sm_name" HeaderText="sm_name" 
            SortExpression="sm_name" UniqueName="sm_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sl_name" HeaderText="sl_name" 
            SortExpression="sl_name" UniqueName="sl_name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="semailid1" HeaderText="semailid1" 
            SortExpression="semailid1" UniqueName="semailid1">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="semailid2" HeaderText="semailid2" 
            SortExpression="semailid2" UniqueName="semailid2">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="smobile1" HeaderText="smobile1" 
            SortExpression="smobile1" UniqueName="smobile1">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="smobile2" HeaderText="smobile2" 
            SortExpression="smobile2" UniqueName="smobile2">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sblackberry" HeaderText="sblackberry" 
            SortExpression="sblackberry" UniqueName="sblackberry">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sphone" HeaderText="sphone" 
            SortExpression="sphone" UniqueName="sphone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="sdob" HeaderText="sdob" 
            SortExpression="sdob" UniqueName="sdob">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" 
            HeaderText="added_date" SortExpression="added_date" UniqueName="added_date">
        </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False">
                                        <ItemTemplate>
                                            <a href='add_rotaract_club.aspx?id=<%# Eval("rotaract_id") %>'>
                                                <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>

                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                        <ItemTemplate>
                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                            </cc1:ConfirmButtonExtender>
                                            <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                CommandArgument='<%# Eval("rotaract_id") %>' runat="Server"
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
                        <asp:SqlDataSource ID="DSRotaract" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT ROW_NUMBER () OVER (ORDER BY club_name asc) AS RowNumber,pf_name+' '+isnull(pm_name,null)+' '+isnull(pl_name,null) as PName,sf_name+' '+isnull(sm_name,null)+' '+isnull(sl_name,null) as SName, * FROM [rotaract_club_tbl]"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display."
                            Style="font-weight: 700"></asp:Label></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_ri_president.aspx.cs" Inherits="admin_view_ri_president" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View RI Presidents
                    </td>
                </tr>
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
                                    <table width="100%">


                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:RadioButtonList ID="rbtnSearch" runat="server" AutoPostBack="true"
                                                    RepeatDirection="Horizontal"
                                                    OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="0">Name</asp:ListItem>
                                                    <asp:ListItem Value="1">Country</asp:ListItem>

                                                </asp:RadioButtonList>

                                            </td>
                                        </tr>



                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                    BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                <asp:DropDownList ID="DDLRICountry" runat="server" AppendDataBoundItems="True"
                                                    AutoPostBack="True" CssClass="txt1" DataSourceID="DSRICountry"
                                                    DataTextField="country" DataValueField="country"
                                                    OnSelectedIndexChanged="DDLRICountry_SelectedIndexChanged">
                                                    <asp:ListItem>Select RC Name</asp:ListItem>
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
                            Skin="Default" PageSize="25" OnItemCommand="RadGrid1_ItemCommand"
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
                                <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                                <Columns>


                                    <%--  <telerik:GridBoundColumn DataField="id" HeaderText="id"  ItemStyle-Width="20px"
            SortExpression="id" UniqueName="id" DataType="System.Int32" 
            ReadOnly="True">
        </telerik:GridBoundColumn> --%>

                                    <%--  <telerik:GridBoundColumn DataField="RowNumber" HeaderText="Sr."  ItemStyle-Width="20px"
            SortExpression="RowNumber" UniqueName="RowNumber">
        <ItemStyle Width="20px" VerticalAlign="Top" ></ItemStyle>
        </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="year" HeaderText="Year"
                                        SortExpression="year" UniqueName="year">
                                        <HeaderStyle Width="70px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="70px" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="name" HeaderText="Name"
                                        SortExpression="name" UniqueName="name">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <%-- <telerik:GridTemplateColumn>
        <ItemTemplate>
        <%# Eval("name") %>
        </ItemTemplate>
        </telerik:GridTemplateColumn>     --%>

                                    <%--        <telerik:GridBoundColumn DataField="fname" HeaderText="fname" 
            ItemStyle-Width="350px" HeaderStyle-Width="350px"
            SortExpression="fname" UniqueName="fname">
        </telerik:GridBoundColumn>        
        
        <telerik:GridBoundColumn DataField="mname" HeaderText="mname" 
            ItemStyle-Width="110px" HeaderStyle-Width="110px"
            SortExpression="mname" UniqueName="mname">
        </telerik:GridBoundColumn>
        
        <telerik:GridBoundColumn DataField="lname" HeaderText="lname" 
            ItemStyle-Width="100px" HeaderStyle-Width="100px"
            SortExpression="lname" UniqueName="lname">
        </telerik:GridBoundColumn>--%>



                                    <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"
                                        SortExpression="club_name" UniqueName="club_name">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="district" HeaderText="Location"
                                        SortExpression="district" UniqueName="district">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="country" HeaderText="Country"
                                        SortExpression="country" UniqueName="country">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="theme" HeaderText="Theme"
                                        SortExpression="theme" UniqueName="theme">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="convention" HeaderText="Convention"
                                        SortExpression="convention" UniqueName="convention">
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>
                                    <%--        <telerik:GridBoundColumn DataField="president_image" 
            HeaderText="president_image" SortExpression="president_image" 
            UniqueName="president_image">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="theme_logo" HeaderText="theme_logo" 
            SortExpression="theme_logo" UniqueName="theme_logo">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="convention_image" 
            HeaderText="convention_image" SortExpression="convention_image" 
            UniqueName="convention_image">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" 
            HeaderText="added_date" SortExpression="added_date" UniqueName="added_date">
        </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False">
                                        <ItemTemplate>
                                            <a href='add_ri_president.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>

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
                            <AlternatingItemStyle />
                            <ItemStyle />
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DSRICountry" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT distinct country FROM [ri_president_tbl] where country  !='' order by country"></asp:SqlDataSource>

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


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_rotary_projects.aspx.cs" Inherits="admin_view_rotary_projects" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
          <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Projects
                    </td>
                </tr>
                <!-- search and sort start -->

                <tr>
                    <td valign="top" class="style5" align="left">
                        <table width="200">
                            <tr>
                                <td valign="top" align="center" style="width: 195px; BORDER-RIGHT: #f4f4f4 1px solid; BORDER-TOP: #f4f4f4 1px solid; BORDER-LEFT: #f4f4f4 1px solid; BORDER-BOTTOM: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                                    <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="BORDER-COLLAPSE: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
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
                                                    <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                        RepeatDirection="Horizontal">
                                                        <asp:ListItem Selected="True" Value="0">Club Name</asp:ListItem>
                                                        <asp:ListItem Value="1">Date</asp:ListItem>


                                                    </asp:RadioButtonList>

                                                </td>
                                            </tr>



                                            <tr>
                                                <td valign="top" bordercolor="#ffffff" align="left">
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
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" Skin="Default" PageSize="100" OnItemCommand="RadGrid1_ItemCommand"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand" GridLines="None" CellSpacing="0" OnItemDataBound="RadGrid1_ItemDataBound">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                     



<%--                                    <telerik:GridBoundColumn DataField="project_title" HeaderText="Project Title"
                                        SortExpression="project_title" UniqueName="project_title" FilterControlAltText="Filter project_title column">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>

                                      <telerik:GridTemplateColumn HeaderText="Project Title" SortExpression="project_title">
                                        <ItemTemplate>                                           
                                            <a href="javascript:void(0)" onclick="MM_openBrWindow('view_project_details.aspx?id=<%# Eval("id") %>','01111','width=850, height=850')"><%# Eval("project_title") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>


                                      <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"
                                        SortExpression="club_name" UniqueName="club_name" FilterControlAltText="Filter club_name column">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="project_type" FilterControlAltText="Filter project_type column" HeaderText="Type of Project" SortExpression="project_type" UniqueName="project_type">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="avenue_of_covered" FilterControlAltText="Filter avenue_of_covered column" HeaderText="Avenue Covered" SortExpression="avenue_of_covered" UniqueName="avenue_of_covered">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="project_chairperson" FilterControlAltText="Filter project_chairperson column" HeaderText="Chairperson" SortExpression="project_chairperson" UniqueName="project_chairperson">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="project_year" HeaderText="Project Year"
                                        SortExpression="project_year" UniqueName="project_year" FilterControlAltText="Filter project_year column">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>


                                    <telerik:GridBoundColumn DataField="start_date" HeaderText="Start Date"
                                        SortExpression="start_date" UniqueName="start_date" DataType="System.DateTime" FilterControlAltText="Filter start_date column" DataFormatString="{0:dd/MM/yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="project_cost" DataType="System.Decimal" FilterControlAltText="Filter project_cost column" HeaderText="Project Cost" SortExpression="project_cost" UniqueName="project_cost" DataFormatString="{0:n0}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridTemplateColumn HeaderText="Status" SortExpression="status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>                                           
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>                                           

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txtBox" OnSelectedIndexChanged="chkActive_SelectedIndexChanged">                                               
                                                <asp:ListItem>Approved</asp:ListItem>                                               
                                                <asp:ListItem>Not Approved</asp:ListItem>                                                         
                                            </asp:DropDownList>                                         

                                        </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" ></ItemStyle>
                                    </telerik:GridTemplateColumn>



                                    <%--    <telerik:GridBoundColumn DataField="end_date" DataType="System.DateTime" FilterControlAltText="Filter end_date column" HeaderText="end_date" SortExpression="end_date" UniqueName="end_date">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="club_id" DataType="System.Int32" FilterControlAltText="Filter club_id column" HeaderText="club_id" SortExpression="club_id" UniqueName="club_id">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>


                                    <%-- <telerik:GridBoundColumn DataField="project_location" FilterControlAltText="Filter project_location column" HeaderText="project_location" SortExpression="project_location" UniqueName="project_location">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="project_description" FilterControlAltText="Filter project_description column" HeaderText="project_description" SortExpression="project_description" UniqueName="project_description">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>

                                    <%-- <telerik:GridBoundColumn DataField="committee_members" FilterControlAltText="Filter committee_members column" HeaderText="committee_members" SortExpression="committee_members" UniqueName="committee_members">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="beneficiaries" FilterControlAltText="Filter beneficiaries column" HeaderText="beneficiaries" SortExpression="beneficiaries" UniqueName="beneficiaries">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="project_images" FilterControlAltText="Filter project_images column" HeaderText="project_images" SortExpression="project_images" UniqueName="project_images">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="partner_club_district_no" FilterControlAltText="Filter partner_club_district_no column" HeaderText="partner_club_district_no" SortExpression="partner_club_district_no" UniqueName="partner_club_district_no">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="partner_club_name" FilterControlAltText="Filter partner_club_name column" HeaderText="Partner Club Name" SortExpression="partner_club_name" UniqueName="partner_club_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="district_grant_no" FilterControlAltText="Filter district_grant_no column" HeaderText="district_grant_no" SortExpression="district_grant_no" UniqueName="district_grant_no">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="district_global_no" FilterControlAltText="Filter district_global_no column" HeaderText="district_global_no" SortExpression="district_global_no" UniqueName="district_global_no">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="add1" FilterControlAltText="Filter add1 column" HeaderText="add1" SortExpression="add1" UniqueName="add1">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="add2" FilterControlAltText="Filter add2 column" HeaderText="add2" SortExpression="add2" UniqueName="add2">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="city" FilterControlAltText="Filter city column" HeaderText="city" SortExpression="city" UniqueName="city">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="pin" FilterControlAltText="Filter pin column" HeaderText="pin" SortExpression="pin" UniqueName="pin">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="state" FilterControlAltText="Filter state column" HeaderText="state" SortExpression="state" UniqueName="state">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="country" FilterControlAltText="Filter country column" HeaderText="country" SortExpression="country" UniqueName="country">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ph1_cc" FilterControlAltText="Filter ph1_cc column" HeaderText="ph1_cc" SortExpression="ph1_cc" UniqueName="ph1_cc">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ph1_ac" FilterControlAltText="Filter ph1_ac column" HeaderText="ph1_ac" SortExpression="ph1_ac" UniqueName="ph1_ac">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="phone1" FilterControlAltText="Filter phone1 column" HeaderText="phone1" SortExpression="phone1" UniqueName="phone1">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ph2_cc" FilterControlAltText="Filter ph2_cc column" HeaderText="ph2_cc" SortExpression="ph2_cc" UniqueName="ph2_cc">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ph2_ac" FilterControlAltText="Filter ph2_ac column" HeaderText="ph2_ac" SortExpression="ph2_ac" UniqueName="ph2_ac">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="phone2" FilterControlAltText="Filter phone2 column" HeaderText="phone2" SortExpression="phone2" UniqueName="phone2">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fax_cc" FilterControlAltText="Filter fax_cc column" HeaderText="fax_cc" SortExpression="fax_cc" UniqueName="fax_cc">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fax_ac" FilterControlAltText="Filter fax_ac column" HeaderText="fax_ac" SortExpression="fax_ac" UniqueName="fax_ac">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fax" FilterControlAltText="Filter fax column" HeaderText="fax" SortExpression="fax" UniqueName="fax">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="website" FilterControlAltText="Filter website column" HeaderText="website" SortExpression="website" UniqueName="website">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="geo_latitude" FilterControlAltText="Filter geo_latitude column" HeaderText="geo_latitude" SortExpression="geo_latitude" UniqueName="geo_latitude">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="geo_longitude" FilterControlAltText="Filter geo_longitude column" HeaderText="geo_longitude" SortExpression="geo_longitude" UniqueName="geo_longitude">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="direction_project_site" FilterControlAltText="Filter direction_project_site column" HeaderText="direction_project_site" SortExpression="direction_project_site" UniqueName="direction_project_site">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataField="status" DataType="System.Boolean" FilterControlAltText="Filter status column" HeaderText="status" SortExpression="status" UniqueName="status">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" FilterControlAltText="Filter added_date column" HeaderText="added_date" SortExpression="added_date" UniqueName="added_date">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ipaddress" FilterControlAltText="Filter ipaddress column" HeaderText="ipaddress" SortExpression="ipaddress" UniqueName="ipaddress">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn AllowFiltering="False" HeaderText="Edit">
                                        <ItemTemplate>
                                            <a href='add_projects.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false"
                                        HeaderStyle-Font-Underline="false" HeaderText="Action">
                                        <ItemTemplate>
                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"
                                                ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                            </cc1:ConfirmButtonExtender>
                                            <asp:ImageButton ID="imgDeleteP" runat="Server" AlternateText="Delete"
                                                CommandArgument='<%# Eval("id") %>' CommandName="Delete"
                                                ImageUrl="~/admin_icons/delete.gif" ToolTip="Delete" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                    </telerik:GridTemplateColumn>

                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>

                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


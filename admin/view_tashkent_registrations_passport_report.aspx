<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_tashkent_registrations_passport_report.aspx.cs" Inherits="admin_view_tashkent_registrations_passport_report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <table style="width: 100%;" class="txt">

        <tr>
            <td colspan="3" class="header_title">View Tashkent Registrations Passport Report
            </td>
        </tr>

        <!-- search and sort start -->

        <tr>
            <td colspan="3">

                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" ShowFooter="true" Culture="as-IN"
                    AllowSorting="True" Skin="Default" PageSize="100"
                    GridLines="None" CellSpacing="0" OnItemDataBound="RadGrid1_ItemDataBound" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated">
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
                                <ItemStyle Width="20px" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="registration_no" HeaderText="Reg."
                                SortExpression="registration_no" UniqueName="registration_no" FilterControlAltText="Filter registration_no column">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="added_date" HeaderText="Reg. Date"
                                SortExpression="added_date" UniqueName="added_date" DataType="System.DateTime" FilterControlAltText="Filter added_date column" DataFormatString="{0:dd/MM/yyyy}">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name">
                                <ItemTemplate>
                                    <%# Eval("Name") %>
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="registration_for" FilterControlAltText="Filter registration_for column" HeaderText="For" SortExpression="registration_for" UniqueName="registration_for">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"
                                SortExpression="club_name" UniqueName="club_name" FilterControlAltText="Filter club_name column">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="mobile" FilterControlAltText="Filter mobile column" HeaderText="Mobile" SortExpression="mobile" UniqueName="mobile">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <%-- <telerik:GridBoundColumn DataField="emailid" FilterControlAltText="Filter emailid column" HeaderText="Email Id" SortExpression="emailid" UniqueName="emailid">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn> --%>


                            <telerik:GridBoundColumn DataField="mem_dob" FilterControlAltText="Filter mem_dob column" HeaderText="DOB" SortExpression="mem_dob" UniqueName="mem_dob" DataFormatString="{0:dd/MM/yyyy}">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="mem_passport_no" FilterControlAltText="Filter mem_passport_no column" HeaderText="Passport No." SortExpression="mem_passport_no" UniqueName="mem_passport_no">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="mem_place_of_issue" FilterControlAltText="Filter mem_place_of_issue column" HeaderText="POI" SortExpression="mem_place_of_issue" UniqueName="mem_place_of_issue">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="mem_date_of_issue" HeaderText="DOI"
                                SortExpression="mem_date_of_issue" UniqueName="mem_date_of_issue" DataType="System.DateTime" FilterControlAltText="Filter mem_date_of_issue column" DataFormatString="{0:dd/MM/yyyy}">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="mem_date_of_expiry" HeaderText="DOE"
                                SortExpression="mem_date_of_expiry" UniqueName="mem_date_of_expiry" DataType="System.DateTime" FilterControlAltText="Filter mem_date_of_expiry column" DataFormatString="{0:dd/MM/yyyy}">
                                <ColumnValidationSettings>
                                    <ModelErrorMessage Text="" />
                                </ColumnValidationSettings>
                            </telerik:GridBoundColumn>

                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                        <PagerStyle PageSizeControlType="RadComboBox" />
                    </MasterTableView>
                    <HeaderStyle Font-Bold="True" />
                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                    <AlternatingItemStyle CssClass="treeView" />
                    <ItemStyle CssClass="treeView" />
                    <PagerStyle PageSizeControlType="RadComboBox" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>

            </td>
        </tr>

        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            </td>
        </tr>


        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                    Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>


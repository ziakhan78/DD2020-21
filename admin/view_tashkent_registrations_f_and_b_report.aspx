<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_tashkent_registrations_f_and_b_report.aspx.cs" Inherits="admin_view_tashkent_registrations_f_and_b_report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Tashkent Registrations F & B Report
                    </td>
                </tr>
                <!-- search and sort start -->

                

                <tr>
                    <td colspan="3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" ShowFooter="true" Culture="as-IN"
                            AllowSorting="True" Skin="Default" PageSize="100" 
                            GridLines="None" CellSpacing="0" OnItemDataBound="RadGrid1_ItemDataBound" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated" >
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
                                        <ItemStyle HorizontalAlign="Left"  />
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
                                    
                                    <telerik:GridBoundColumn DataField="emailid" FilterControlAltText="Filter emailid column" HeaderText="Email Id" SortExpression="emailid" UniqueName="emailid">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>                                     

                                   <%--  <telerik:GridBoundColumn DataField="actual_amt" DataType="System.Decimal" FilterControlAltText="Filter actual_amt column" HeaderText="Amount" SortExpression="actual_amt" UniqueName="actual_amt" DataFormatString="{0:n0}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                         <HeaderStyle HorizontalAlign="Right" />
                                         <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>                                   

                                    <telerik:GridBoundColumn DataField="amount" DataType="System.Decimal" FilterControlAltText="Filter amount column" HeaderText="Advance" SortExpression="amount" UniqueName="amount" DataFormatString="{0:n0}" >
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Right" />
                                         <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="balance_amt" DataType="System.Decimal" FilterControlAltText="Filter balance_amt column" HeaderText="Balance" SortExpression="balance_amt" UniqueName="balance_amt" DataFormatString="{0:n0}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                         <HeaderStyle HorizontalAlign="Right" />
                                          <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>--%>

                                      <telerik:GridBoundColumn DataField="food_pref" DataType="System.Decimal" FilterControlAltText="Filter food_pref column" HeaderText="Food Pref." SortExpression="food_pref" UniqueName="food_pref" >
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                         <HeaderStyle HorizontalAlign="Right" />
                                          <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>


                                     <telerik:GridBoundColumn DataField="spouse_first_name" DataType="System.Decimal" FilterControlAltText="Filter spouse_first_name column" HeaderText="Spouse Name" SortExpression="spouse_first_name" UniqueName="spouse_first_name" >
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                         <HeaderStyle HorizontalAlign="Right" />
                                          <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>


                                      <telerik:GridBoundColumn DataField="spouse_food_pref" DataType="System.Decimal" FilterControlAltText="Filter spouse_food_pref column" HeaderText="Spouse Food Pref." SortExpression="spouse_food_pref" UniqueName="spouse_food_pref" >
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                         <HeaderStyle HorizontalAlign="Right" />
                                          <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>

                                    

                                  <%--  <telerik:GridTemplateColumn HeaderText="Status" SortExpression="status">
                                        <ItemTemplate>
                                            <%# Eval("payment_status") %>
                                        </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" ></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                   
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

                                 
                                 <%--   <telerik:GridTemplateColumn AllowFiltering="false"
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
                                    </telerik:GridTemplateColumn>--%>

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


<%@ Page Title="" Language="C#" MasterPageFile="~/DistrictDirectory/AdminDistrictDirectory.master" AutoEventWireup="true" CodeFile="ReportAvenueWise.aspx.cs" Inherits="DistrictDirectory_ReportAvenueWise" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">--%>
    <table width="100%" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
         
            <tr>
               <td colspan="2" class="header_title">Avenue Wise Report
               </td>
            </tr>

          <tr>
                    <td colspan="2">
                        <asp:Panel ID="PanelSort" runat="server" Width="100%" GroupingText="Sort By">
                            <asp:RadioButtonList ID="rbtnAvenue" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnAvenue_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                <asp:ListItem Value="1">Avenue</asp:ListItem>
                            </asp:RadioButtonList>
                          
                                        <asp:DropDownList ID="ddlAvenue" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlAvenue_SelectedIndexChanged">
                                        </asp:DropDownList>
                                   
                        </asp:Panel>

                    </td>
                </tr>

        <tr>
            <td>

                 <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" AllowSorting="false" Skin="Default" PageSize="100" CssClass="treeView" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated" OnItemDataBound="RadGrid1_ItemDataBound" >
                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                    <MasterTableView AutoGenerateColumns="False">
                        <Columns>
                               <telerik:GridTemplateColumn HeaderText="Sr.">
                                <ItemTemplate>
                                    <%# Container.DataSetIndex +1 %> 
                                </ItemTemplate>
                                <ItemStyle Width="30px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                <HeaderStyle Width="30px" />                                
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" ReadOnly="True" SortExpression="Name" UniqueName="Name" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                           
                             <telerik:GridBoundColumn DataField="avenue" FilterControlAltText="Filter avenue column" HeaderText="Avenue" SortExpression="avenue" UniqueName="avenue" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="position" FilterControlAltText="Filter position column" HeaderText="Position" SortExpression="position" UniqueName="position" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Mobile1" FilterControlAltText="Filter Mobile1 column" HeaderText="Mobile" SortExpression="Mobile1" UniqueName="Mobile1" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EmailId" FilterControlAltText="Filter EmailId column" HeaderText="Email Id" SortExpression="EmailId" UniqueName="EmailId" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="club_name" FilterControlAltText="Filter club_name column" HeaderText="Club Name" SortExpression="club_name" UniqueName="club_name" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>

                           <%-- <telerik:GridBoundColumn DataField="years" FilterControlAltText="Filter years column" HeaderText="years" SortExpression="years" UniqueName="years">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="position_held_on" FilterControlAltText="Filter position_held_on column" HeaderText="position_held_on" SortExpression="position_held_on" UniqueName="position_held_on">
                            </telerik:GridBoundColumn>--%>
                            
                            
                            <%--<telerik:GridBoundColumn DataField="club_id" DataType="System.Int32" FilterControlAltText="Filter club_id column" HeaderText="club_id" SortExpression="club_id" UniqueName="club_id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MemberId" DataType="System.Int32" FilterControlAltText="Filter MemberId column" HeaderText="MemberId" SortExpression="MemberId" UniqueName="MemberId">
                            </telerik:GridBoundColumn>--%>
                           
                           
                           <%-- <telerik:GridBoundColumn DataField="mail_status" FilterControlAltText="Filter mail_status column" HeaderText="mail_status" SortExpression="mail_status" UniqueName="mail_status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" SortExpression="id" UniqueName="id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="district_no" DataType="System.Int32" FilterControlAltText="Filter district_no column" HeaderText="district_no" SortExpression="district_no" UniqueName="district_no">
                            </telerik:GridBoundColumn>--%>
                        </Columns>
                    </MasterTableView>
                     <HeaderStyle Font-Bold="true" />
                     <ItemStyle HorizontalAlign="Left" />
                </telerik:RadGrid>
               <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [View_DistPositionHeldMembers] WHERE ([district_no] = @district_no)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3141" Name="district_no" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>--%>

            </td>
        </tr>
          <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
                &nbsp;</td>
        </tr>

        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                    Style="font-weight: bold; font-size: 14px; color: #FF0000;"></asp:Label>

                  </td>
        </tr>

</table>

</asp:Content>


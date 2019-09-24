<%@ Page Title="" Language="C#" MasterPageFile="~/DistrictDirectory/AdminDistrictDirectory.master" AutoEventWireup="true" CodeFile="ViewAvenues.aspx.cs" Inherits="DistrictDirectory_ViewAvenues" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <table style="width:100%;" class="txt" >
               
            <tr>              
               <td colspan="3" class="header_title">View District Avenue
               </td>
            </tr>
             <!-- search and sort start -->
			
			<tr>
						<td valign="top" class="style5" align="left">
						<table width="200">						
						<tr>
						<td valign="top" align="center" style=" width:195px; BORDER-RIGHT: #f4f4f4 1px solid; BORDER-TOP: #f4f4f4 1px solid; BORDER-LEFT: #f4f4f4 1px solid; BORDER-BOTTOM: #f4f4f4 1px solid" bgColor="#f4f4f4" height="4" >
						<b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
						</td>
						</tr>
						<tr>
							<td >
								<table style="BORDER-COLLAPSE: collapse;" borderColor="#f4f4f4" cellSpacing="0" cellPadding="0" bgColor="#ffffff" border="1" class="txt">
									<tr>
										<td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'" 
                                            onmouseout="this.style.backgroundColor='#f9f9f9'" align="center" >
											<asp:LinkButton id="LnkA" Runat="server"  onclick="LnkA_Click" CssClass="txtSearch" >A</asp:LinkButton></td>
										<td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
											align="center" >
											<asp:LinkButton id="LnkB" Runat="server" 
                                                onclick="LnkB_Click" CssClass="txtSearch" >B</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkC" Runat="server" 
                                                onclick="LnkC_Click" CssClass="txtSearch" >C</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkD" Runat="server" 
                                                onclick="LnkD_Click" CssClass="txtSearch" >D</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkE" Runat="server" 
                                                onclick="LnkE_Click" CssClass="txtSearch" >E</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkF" Runat="server" 
                                                onclick="LnkF_Click" CssClass="txtSearch" >F</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkG" Runat="server" 
                                                onclick="LnkG_Click" CssClass="txtSearch" >G</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkH" Runat="server" 
                                                onclick="LnkH_Click" CssClass="txtSearch" >H</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkI" Runat="server" 
                                                onclick="LnkI_Click" CssClass="txtSearch" >I</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkJ" Runat="server" 
                                                onclick="LnkJ_Click" CssClass="txtSearch" >J</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkK" Runat="server" 
                                                onclick="LnkK_Click" CssClass="txtSearch" >K</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkL" Runat="server" 
                                                onclick="LnkL_Click" CssClass="txtSearch" >L</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkM" Runat="server" 
                                                onclick="LnkM_Click" CssClass="txtSearch" >M</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
									      <asp:LinkButton id="LnkN" Runat="server" onclick="LnkN_Click" CssClass="txtSearch" >N</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkO" Runat="server" 
                                                onclick="LnkO_Click" CssClass="txtSearch" >O</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkP" Runat="server" 
                                                onclick="LnkP_Click" CssClass="txtSearch" >P</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkQ" Runat="server" 
                                                onclick="LnkQ_Click" CssClass="txtSearch" >Q</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkR" Runat="server" 
                                                onclick="LnkR_Click" CssClass="txtSearch" >R</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkS" Runat="server" 
                                                onclick="LnkS_Click" CssClass="txtSearch" >S</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkT" Runat="server" 
                                                onclick="LnkT_Click" CssClass="txtSearch" >T</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkU" Runat="server" 
                                                onclick="LnkU_Click" CssClass="txtSearch" >U</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkV" Runat="server" 
                                                onclick="LnkV_Click" CssClass="txtSearch" >V</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkW" Runat="server" 
                                                onclick="LnkW_Click" CssClass="txtSearch" >W</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkX" Runat="server" 
                                                onclick="LnkX_Click" CssClass="txtSearch" >X</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkY" Runat="server" 
                                                onclick="LnkY_Click" CssClass="txtSearch" >Y</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkZ" Runat="server" 
                                                onclick="LnkZ_Click" CssClass="txtSearch" >Z</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="Linkbutton1" Runat="server" 
                                                onclick="Linkbutton1_Click" CssClass="txtSearch" >ALL</asp:LinkButton>
                                                </td>
										
									</tr>
								</table>
							</td>
						</tr>						
						</table>
						</td>
						
						
						
						
						<td valign="top" width="300px" align="right">
						<asp:Panel ID="SearchPanel" runat="server" DefaultButton="btnSearch">
						<table style="text-align:right;" width="300px">
						
						<tr>
						<td valign="top" align="center" style=" border: 1px solid #f4f4f4;" 
                                bgColor="#f4f4f4" class="style1" >
						<b>&nbsp; ::&nbsp;Search By ::</b>
						</td>
						</tr>
						<tr>
							
							<td valign="top" align="right" width="100%">
								<table width="100%">
								
								
								<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left"  >
                                           <asp:RadioButtonList ID="rbtnSearch" runat="server" 
                                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">Designation</asp:ListItem>
                                                <asp:ListItem Value="1">Year Wise</asp:ListItem>
                                                
                                            </asp:RadioButtonList>
                                           
                                        </td>
									</tr>
									
									
									
									<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left"  >
                                            <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged" AppendDataBoundItems="true">
                                                <asp:ListItem>Select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>
                                        </td>
									</tr>
									<tr>
										<td align="left" >
                                            <asp:Button ID="btnSearch" runat="server" CssClass="btn" 
                                                onclick="btnSearch_Click" Text="Search" />
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
			<td colspan="3">
               
                </td>
			</tr>			
			<!-- search and sort end -->
       
        <tr>
       <td colspan="3">
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"  AllowSorting="True"  GridLines="None" 
               Skin="Default"  PageSize="100" onitemcommand="RadGrid1_ItemCommand" 
               onpageindexchanged="RadGrid1_PageIndexChanged" 
               onpagesizechanged="RadGrid1_PageSizeChanged" 
               onsortcommand="RadGrid1_SortCommand">
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" DataKeyNames="id">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
<CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
    <Columns>
      
<%-- <telerik:GridBoundColumn DataField="RowNumber" HeaderText="Sr."  ItemStyle-Width="20px"
            SortExpression="RowNumber" UniqueName="RowNumber">
<ItemStyle Width="20px"></ItemStyle>
        </telerik:GridBoundColumn>--%>
    <%--    
        <telerik:GridBoundColumn DataField="id" HeaderText="id"  ItemStyle-Width="20px"
            SortExpression="id" UniqueName="id" DataType="System.Int32" 
            ReadOnly="True">
        </telerik:GridBoundColumn>--%>
        
         <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="30px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
              <HeaderStyle  Width="30px" VerticalAlign="Top" HorizontalAlign="Left" />
        </telerik:GridTemplateColumn>
        
         <telerik:GridBoundColumn DataField="years" HeaderText="Years"             
            SortExpression="years" UniqueName="years">
              <ItemStyle Width="90px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
             <HeaderStyle  Width="90px" VerticalAlign="Top" HorizontalAlign="Left" />
        </telerik:GridBoundColumn>

        <telerik:GridBoundColumn DataField="designation" HeaderText="Avenue"             
            SortExpression="designation" UniqueName="designation">
             <ItemStyle  VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
             <HeaderStyle   VerticalAlign="Top" HorizontalAlign="Left" />
        </telerik:GridBoundColumn>
   <%--     
        <telerik:GridBoundColumn DataField="added_date" HeaderText="added_date" 
            ItemStyle-Width="610px" HeaderStyle-Width="610px"
            SortExpression="added_date" UniqueName="added_date" 
            DataType="System.DateTime">
        </telerik:GridBoundColumn>--%>
        
         <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                     <ItemTemplate>
                             <a href='district_designations.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
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
         <%--  <asp:SqlDataSource ID="DSDistDesig" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
               SelectCommand="SELECT ROW_NUMBER () OVER (ORDER BY designation asc) AS RowNumber, * FROM [distt_designation_tbl]"></asp:SqlDataSource>--%>
          
          
       </td></tr>
       <tr><td align="center" colspan="3"><asp:Label ID="lblMsg" runat="server" Text="No records to display."  style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;" ></asp:Label>
           </td>
       </tr>
      </table>
     </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>




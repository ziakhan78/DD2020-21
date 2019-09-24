<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_trf_seminar.aspx.cs" Inherits="admin_view_trf_seminar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
   <table style="width:100%;" class="txt" >
               
            <tr>              
               <td class="header_title" colspan="3" >View 3rd TRF Seminar Registration
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
                                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                                onselectedindexchanged="rbtnSearch_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Name</asp:ListItem>
                                                <asp:ListItem Value="1">Rotary Club of</asp:ListItem>                                               
                                              <%--  <asp:ListItem Value="2">Mobile</asp:ListItem>--%>                                               
                                            </asp:RadioButtonList>
                                           
                                        </td>
									</tr>
									
									
									
									<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left"  >
                                            <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0" 
                                                BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                          <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" AutoPostBack="True" 
               onselectedindexchanged="DDLClubName_SelectedIndexChanged" >
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
                                           <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                      
                      
               SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
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
			<td colspan="3"></td>
			</tr>			
			<!-- search and sort end -->
    
       
        <tr>
       <td colspan="3">
           <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" GridLines="None" 
               Skin="WebBlue"  PageSize="100" 
               onpageindexchanged="RadGrid1_PageIndexChanged" 
               onpagesizechanged="RadGrid1_PageSizeChanged" 
               onsortcommand="RadGrid1_SortCommand" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" 
                   DataKeyNames="id">
    <CommandItemSettings ExportToPdfText="Export to PDF" />
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
    
        
          <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridTemplateColumn>
             
        
         <telerik:GridBoundColumn DataField="Name" HeaderText="Name"  SortExpression="Name" UniqueName="Name">
         </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"  SortExpression="club_name" UniqueName="club_name" >
          </telerik:GridBoundColumn>

          <telerik:GridBoundColumn DataField="regis_no" HeaderText="Reg. No."  SortExpression="regis_no" UniqueName="regis_no" >
          
        </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="mobile" HeaderText="Mobile" SortExpression="mobile" UniqueName="mobile">
         </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="emailId" HeaderText="Email-Id" SortExpression="emailId" UniqueName="emailId">
         </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="added_date" HeaderText="Reg. Date Time" SortExpression="added_date" UniqueName="added_date" DataFormatString="{0:dd MMM, yyyy hh:mm:ss tt}" >
         </telerik:GridBoundColumn>          


        <telerik:GridBoundColumn DataField="payment_type"  HeaderText="Payment Mode" SortExpression="payment_type" UniqueName="payment_type">
         </telerik:GridBoundColumn>

         <telerik:GridBoundColumn DataField="amount" DataType="System.Decimal"  HeaderText="Amount" SortExpression="amount" UniqueName="amount" DataFormatString="{0:n}">
         </telerik:GridBoundColumn>

        <%-- <telerik:GridBoundColumn DataField="payment_status" FilterControlAltText="Filter payment_status column" HeaderText="Status" SortExpression="payment_status" UniqueName="payment_status">
         </telerik:GridBoundColumn>--%>

         <telerik:GridTemplateColumn HeaderText="Status" SortExpression="payment_status">
        <ItemTemplate>
        <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("payment_status") %>' Visible="false"></asp:Label>            
             <asp:DropDownList ID="DDLStatus" runat="server" CssClass="txt" > 
                 <asp:ListItem Value="0">Pending</asp:ListItem>
                <asp:ListItem Value="1">Received</asp:ListItem> 
                  <asp:ListItem Value="2">Invitee</asp:ListItem> 
                  <asp:ListItem Value="3">Co-Host</asp:ListItem>              
            </asp:DropDownList>
            <asp:LinkButton ID="btnUpdate" runat="server"  CommandName="Update" CommandArgument='<%# Eval("id") %>' Text="Update" Font-Underline="false" ></asp:LinkButton>
        </ItemTemplate>        
        </telerik:GridTemplateColumn>

      

       
        
      
    </Columns>
   
   
   
</MasterTableView>
               <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" />
               <ItemStyle CssClass="treeView" />
              
            
           </telerik:RadGrid>
        <%--   <asp:SqlDataSource ID="DsRegis" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" SelectCommand="SELECT * FROM [View_Peace_Leadership_Seminar] ORDER BY [Name]"></asp:SqlDataSource>--%>
                  
       </td></tr>
       
       <tr><td align="center" colspan="3">
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>
            </table>
       </ContentTemplate>
       </asp:UpdatePanel>
</asp:Content>






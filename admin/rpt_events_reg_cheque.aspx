<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="rpt_events_reg_cheque.aspx.cs" Inherits="admin_rpt_events_reg_cheque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Events Registration Cheque Report
               </td>
        </tr>

           <tr>
			<td colspan="3">
                Select Event :
                <asp:DropDownList ID="DDLEventName" runat="server" DataSourceID="DSEventsReg" DataTextField="event_title" DataValueField="id" AppendDataBoundItems="true" CssClass="txt" AutoPostBack="True" OnSelectedIndexChanged="DDLEventName_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                </td>
			</tr>
        
         <tr>           
               <td align="center" >
            
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  >
                       <Columns>                          

                           <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="25px" ItemStyle-Width="25px">
                               <ItemTemplate >
                               <%# Eval("Sr") %>
                               </ItemTemplate>                               
                           </asp:TemplateField>                                                  
                           
                          
                             <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                            <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />
                             <asp:BoundField DataField="regis_no" HeaderText="Reg. No." HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="regis_no" />
                            <asp:BoundField DataField="mobile" HeaderText="Mobile" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="mobile" />
                            <asp:BoundField DataField="emailId" HeaderText="Email-Id" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="emailId" />
                                                   
                            <asp:BoundField DataField="amount" HeaderText="Amount"  HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="amount" DataFormatString="{0:n}" />
                            <asp:BoundField DataField="bank_name" HeaderText="Bank Name" HeaderStyle-Width="300px" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="bank_name" />                                          
                            <asp:BoundField DataField="branch_name" HeaderText="Branch Name" HeaderStyle-Width="300px" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="branch_name" />                                          
                            <asp:BoundField DataField="cheque_no" HeaderText="Cheq.No." HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="cheque_no" />                                          
                            <asp:BoundField DataField="cheque_date" HeaderText="Cheq. Date" DataFormatString="{0:dd, MMM}" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="cheque_date" />
                           <asp:BoundField DataField="payment_status" HeaderText="Status"  HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_status" />                                                                                   
                                
                       </Columns>
                   </asp:GridView>
                
          
               </td>
        </tr>
         <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" 
                    onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            &nbsp;</td>
        </tr>

         <tr><td align="center" colspan="3">
             <asp:SqlDataSource ID="DSEventsReg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [event_title] FROM [Dist_Event_Reg_Master_tbl] ORDER BY [event_title]"></asp:SqlDataSource>
             <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label>
            </td></tr>
        </table>
</asp:Content>



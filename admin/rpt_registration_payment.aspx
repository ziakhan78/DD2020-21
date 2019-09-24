<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="rpt_registration_payment.aspx.cs" Inherits="admin_rpt_registration_payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">District Peace Leadership Registration Payment Status Report
               </td>
        </tr>
        

        <tr>
        <td>

            <asp:RadioButtonList ID="rbtnType" runat="server" 
                RepeatDirection="Horizontal" AutoPostBack="True" 
                onselectedindexchanged="pe_SelectedIndexChanged">
                <asp:ListItem Selected="True">All</asp:ListItem>
                <asp:ListItem>Received</asp:ListItem>
                <asp:ListItem>Pending</asp:ListItem>
                <asp:ListItem>Invitee</asp:ListItem>
                <asp:ListItem>Co-Host</asp:ListItem>
            </asp:RadioButtonList>

        </td>
        </tr>
         <tr>           
               <td >
            
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" width="100%" >
                       <Columns>
                           

                           <asp:TemplateField HeaderText="Sr." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                               <ItemTemplate >
                               <%# Eval("Sr") %>
                               </ItemTemplate>
                               
                           </asp:TemplateField>
                                                  
                            <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                            <asp:BoundField DataField="club_name" HeaderText="Rotary Club of" HeaderStyle-Width="350px" ItemStyle-Width="350px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="club_name" />
                             <asp:BoundField DataField="regis_no" HeaderText="Registration No." HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="regis_no" />
                            <asp:BoundField DataField="mobile" HeaderText="Mobile" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="mobile" />
                            <asp:BoundField DataField="emailId" HeaderText="Email-Id" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="emailId" />
                             <asp:BoundField DataField="payment_type" HeaderText="Payment Mode"  HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_type" />
                             <asp:BoundField DataField="amount" HeaderText="Amount"  HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="amount" DataFormatString="{0:n}" />
                            <asp:BoundField DataField="payment_status" HeaderText="Status"  HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="payment_status" /> 
                           <asp:BoundField DataField="added_date" HeaderText="Regis. Date Time"  HeaderStyle-Width="500px" ItemStyle-Width="500px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="added_date" DataFormatString="{0:dd MMM, yyyy hh:mm:ss}" />                          
                           
                          
                                
                       </Columns>
                   </asp:GridView>
                 <%--  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                       SelectCommand="Select ROW_NUMBER () OVER (ORDER BY Name asc) AS Sr, * from View_MUNAForm" >
                   </asp:SqlDataSource>--%>
          
               </td>
        </tr>
         <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" 
                    onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            &nbsp;</td>
        </tr>
        </table>
</asp:Content>


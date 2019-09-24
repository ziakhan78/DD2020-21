<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="rpt_registration_in_order.aspx.cs" Inherits="admin_rpt_registration_in_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table  width="100%" class="txt">
        <tr>           
               <td class="header_title">District Peace Leadership Registration Report As Per Sequence Of Regsitering 
               </td>
        </tr>
        

          <tr>
        <td>

            <asp:RadioButtonList ID="rbtnType" runat="server" 
                RepeatDirection="Horizontal" AutoPostBack="True" 
                onselectedindexchanged="rbtnType_SelectedIndexChanged" >
                <asp:ListItem Selected="True">All</asp:ListItem>
                <asp:ListItem>Boys</asp:ListItem>
                <asp:ListItem>Girls</asp:ListItem>
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
                           
                            <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                            <asp:BoundField DataField="rotaractor_club" HeaderText="Rotary Club of" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" HeaderStyle-Width="60px" ItemStyle-Width="60px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                            
                           <asp:BoundField DataField="email" HeaderText="Email" HeaderStyle-Width="210px" ItemStyle-Width="210px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" SortExpression="Name" />
                                <asp:BoundField DataField="mobile" HeaderText="Mobile" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="Name" />

                                <asp:BoundField DataField="added_date" HeaderText="Date" DataFormatString="{0:dd MMM}" HeaderStyle-Width="60px" ItemStyle-Width="60px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="added_date" />
                                <asp:BoundField DataField="added_date" HeaderText="Time" DataFormatString="{0:hh:mm:ss}" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="added_date" />
                       </Columns>
                   </asp:GridView>
                  <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                       SelectCommand="Select ROW_NUMBER () OVER (ORDER BY id asc) AS Sr, * from View_RegistrationForm" >
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


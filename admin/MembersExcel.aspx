<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="MembersExcel.aspx.cs" Inherits="Admin_MembersExcel" Title="RCBP | Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Export Members Contacts
               </td>
        </tr>
        
         <tr>           
               <td >
             <div style="overflow-y: scroll; width:766px;">
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView"
                       DataSourceID="SqlDataSource1" Width="900px" 
                       onrowdatabound="GridView1_RowDataBound">
                       <Columns>
                           <asp:BoundField DataField="Sr" HeaderText="Sr." HeaderStyle-Width="30px" ItemStyle-Width="30px" 
                               ReadOnly="True" SortExpression="Sr" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                                                  
                           
                           <asp:TemplateField HeaderText="Members Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                               <ItemTemplate >
                               <%# Eval("FName")%>&nbsp;<%# Eval("MName")%>&nbsp;<%# Eval("LName")%>
                                      
                                  
                               </ItemTemplate>
                           </asp:TemplateField>
                           
                           <asp:BoundField DataField="Mobile1" HeaderText="Mobile No." HeaderStyle-Width="110px" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                               SortExpression="Mobile1" /> 
                                                     
                           <asp:BoundField DataField="PMail" HeaderText="Members Email Id" SortExpression="PMail" HeaderStyle-Width="230px" ItemStyle-Width="230px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               <%--<asp:BoundField DataField="DOB" HeaderText="Members D.O.B." SortExpression="DOB" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               --%>
                               
                                <asp:TemplateField HeaderText="Members D.O.B." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                               <ItemTemplate >                               
                                      <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB")%>'></asp:Label>
                                  
                               </ItemTemplate>
                           </asp:TemplateField>
                           
                           
                               <asp:BoundField DataField="RPhone1" HeaderText="Resi. Phone" SortExpression="RPhone1" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               <asp:BoundField DataField="BPhone1" HeaderText="Busi. Phone" SortExpression="BPhone1" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               <asp:BoundField DataField="BFax" HeaderText="Busi. Fax" SortExpression="BFax" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               
                               
                               <%-- <asp:BoundField DataField="SName" HeaderText="Spouse Name" SortExpression="SName" HeaderStyle-Width="120px" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        
                           <asp:BoundField DataField="spmobile" HeaderText="Spouse Mobile No." HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                               SortExpression="spmobile" />
                                <asp:BoundField DataField="SMail" HeaderText="Spouse Email Id" SortExpression="SMail" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               
                                <asp:BoundField DataField="SDOB" HeaderText="Spouse D.O.B." SortExpression="SDOB" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                           <asp:BoundField DataField="SAnniv" HeaderText="Anniversary" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"
                               SortExpression="SAnniv" />--%>
                               
                                
                       </Columns>
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                       SelectCommand="Sp_GetAllMembers" SelectCommandType="StoredProcedure">
                   </asp:SqlDataSource>
             </div>
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


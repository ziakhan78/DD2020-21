<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="Member_Spouse_Report.aspx.cs" Inherits="admin_Member_Spouse_Report" Title="RCBP | Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Export Members Spouse Data
               </td>
        </tr>
        
         <tr>           
               <td >
             <div style="overflow-y: scroll; width:766px;">
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView"
                       DataSourceID="SqlDataSource1" Width="1030px">
                       <Columns>
                           <asp:BoundField DataField="Sr" HeaderText="Sr." HeaderStyle-Width="30px" ItemStyle-Width="30px" 
                               ReadOnly="True" SortExpression="Sr" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                                                  
                           
                           <asp:TemplateField HeaderText="Members Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                               <ItemTemplate >
                               <%# Eval("FName")%>&nbsp;<%# Eval("LName")%>
                               </ItemTemplate>
                           </asp:TemplateField>
                           
                           <asp:BoundField DataField="Mobile1" HeaderText="Mobile No." HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                               SortExpression="Mobile1" /> 
                                                     
                           <asp:BoundField DataField="PMail" HeaderText="Members Email Id" SortExpression="PMail" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                              
                                <asp:BoundField DataField="SName" HeaderText="Spouse Name" SortExpression="SName" HeaderStyle-Width="120px" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        
                           <asp:BoundField DataField="spmobile" HeaderText="Spouse Mobile No." HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                               SortExpression="spmobile" />
                                <asp:BoundField DataField="SMail" HeaderText="Spouse Email Id" SortExpression="SMail" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               
                               <%--  <asp:BoundField DataField="DOB" HeaderText="Members D.O.B." SortExpression="DOB" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                               <asp:BoundField DataField="SDOB" HeaderText="Spouse D.O.B." SortExpression="SDOB" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                           <asp:BoundField DataField="SAnniv" HeaderText="Anniversary" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"
                               SortExpression="SAnniv" />
                               
                                <asp:BoundField DataField="MId" HeaderText="Membership Number" SortExpression="MId"  />
                               
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                           <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                           <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                           
                           
                          <asp:BoundField DataField="Classification" HeaderText="Classification" 
                               SortExpression="Classification" />
                           <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                               SortExpression="Qualification" />
                          
                                                 
                           <asp:BoundField DataField="Mobile2" HeaderText="Mobile Number 2" 
                               SortExpression="Mobile2" />
                               
                               
                           <asp:BoundField DataField="BlackBerryPin" HeaderText="BlackBerry PIN" HeaderStyle-Width="120px" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"
                               SortExpression="BlackBerryPin" />
                         <asp:BoundField DataField="DOB" HeaderText="D.O.B." SortExpression="DOB" />
                           <asp:BoundField DataField="BG" HeaderText="Blood Group" SortExpression="BG" />
                           <asp:BoundField DataField="RHF" HeaderText="RH Factor" SortExpression="RHF" />
                           <asp:BoundField DataField="Hobbies1" HeaderText="Hobbies1" 
                               SortExpression="Hobbies1" />
                           <asp:BoundField DataField="Hobbies2" HeaderText="Hobbies2" 
                               SortExpression="Hobbies2" />
                           <asp:BoundField DataField="Hobbies3" HeaderText="Hobbies3" 
                               SortExpression="Hobbies3" />
                           <asp:BoundField DataField="TRF" HeaderText="TRF" SortExpression="TRF" />
                           <asp:BoundField DataField="PreferFoodP" HeaderText="Food Preference" 
                               SortExpression="PreferFoodP" />                          
                           <asp:BoundField DataField="proposedBy" HeaderText="Proposed By" 
                               SortExpression="proposedBy" />
                                                 
                           
                             <asp:TemplateField HeaderText="Residence Address">
                               <ItemTemplate >
                               <%# Eval("RAdd1")%> <%# Eval("RAdd2")%>
                               </ItemTemplate>
                               </asp:TemplateField>
                           
                           
                           
                           <asp:BoundField DataField="RCity" HeaderText="City" SortExpression="RCity" />
                           <asp:BoundField DataField="RPin" HeaderText="Pin" SortExpression="RPin" />                         
                         
                           <asp:BoundField DataField="RPhone1" HeaderText="Res. Phone" HeaderStyle-Width="150px" ItemStyle-Width="150px" 
                              HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  
                               SortExpression="RPhone1" >                       

                           </asp:BoundField>
                          <asp:BoundField DataField="RPhone2" HeaderText="Residence Phone 2" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  
                               SortExpression="RPhone2" />                 
                           <asp:BoundField DataField="RFax" HeaderText="Res. Fax" SortExpression="RFax" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                             HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
                                                    

                           </asp:BoundField>
                          
                           <asp:BoundField DataField="BCompany" HeaderText="Company Name" 
                               SortExpression="BCompany" />
                           <asp:BoundField DataField="Designation" HeaderText="Designation" 
                               SortExpression="Designation" />
                          
                           
                             <asp:TemplateField HeaderText="Company Address">
                               <ItemTemplate >
                               <%# Eval("BAdd1")%> <%# Eval("BAdd2")%>
                               </ItemTemplate>
                               </asp:TemplateField>
                           
                           <asp:BoundField DataField="BCity" HeaderText="City" SortExpression="BCity" />
                           <asp:BoundField DataField="BPin" HeaderText="Pin" SortExpression="BPin" />                          
                           
                    
                           <asp:BoundField DataField="BPhone1" HeaderText="Business Phone 1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  
                               SortExpression="BPhone1" />                       
                           <asp:BoundField DataField="BPhone2" HeaderText="Business Phone 1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  
                               SortExpression="BPhone2" />                     
                           <asp:BoundField DataField="BFax" HeaderText="Business Fax" SortExpression="BFax" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"   />
                          
                           <asp:BoundField DataField="BMail" HeaderText="Business E-Mail" SortExpression="BMail" />
                           <asp:BoundField DataField="BWeb" HeaderText="Business Website" SortExpression="BWeb" />
                           <asp:BoundField DataField="SName" HeaderText="Spouse Name" SortExpression="SName" />
                        
                           <asp:BoundField DataField="spmobile" HeaderText="Mobile" 
                               SortExpression="spmobile" />
                           <asp:BoundField DataField="BlackBerryPinSpouce" 
                               HeaderText="BlackBerryPinSpouce" SortExpression="BlackBerryPin" />
                           <asp:BoundField DataField="SDOB" HeaderText="D.O.B." SortExpression="SDOB" />
                           <asp:BoundField DataField="SAnniv" HeaderText="Spouse Anniversary" 
                               SortExpression="SAnniv" />
                           <asp:BoundField DataField="SBG" HeaderText="Blood Group" SortExpression="SBG" />
                           <asp:BoundField DataField="SRHF" HeaderText="RH Factor" SortExpression="SRHF" />
                           <asp:BoundField DataField="SMail" HeaderText="Mail" SortExpression="SMail" />
                           <asp:BoundField DataField="SHobbies1" HeaderText="Hobbies1" 
                               SortExpression="SHobbies1" />
                           <asp:BoundField DataField="SHobbies2" HeaderText="Hobbies2" 
                               SortExpression="SHobbies2" />
                           <asp:BoundField DataField="SHobbies3" HeaderText="Hobbies3" 
                               SortExpression="SHobbies3" />
                           <asp:BoundField DataField="PreferFoodS" HeaderText="Food Preference" 
                               SortExpression="PreferFoodS" />
                         
                           <asp:BoundField DataField="C1Name" HeaderText="Child 1 Name" 
                               SortExpression="C1Name" />
                           <asp:BoundField DataField="C1DOB" HeaderText="Child 1 DOB" SortExpression="C1DOB" />
                           <asp:BoundField DataField="C2Name" HeaderText="Child 2 Name" 
                               SortExpression="C2Name" />
                           <asp:BoundField DataField="C2DOB" HeaderText="Child 2 DOB" SortExpression="C2DOB" />
                           <asp:BoundField DataField="C3Name" HeaderText="Child 3 Name" 
                               SortExpression="C3Name" />
                           <asp:BoundField DataField="C3DOB" HeaderText="Child 3 DOB" SortExpression="C3DOB" />
                           <asp:BoundField DataField="PreferMail" HeaderText="Prefered Mail" 
                               SortExpression="PreferMail" />
                           <asp:BoundField DataField="PreferFax" HeaderText="Prefered Fax" 
                               SortExpression="PreferFax" />
                           <asp:BoundField DataField="PreferEMail" HeaderText="Prefered EMail" 
                               SortExpression="PreferEMail" />                      --%>  
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


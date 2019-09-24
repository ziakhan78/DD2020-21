<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="update_past_district_gove.aspx.cs" Inherits="admin_update_past_district_gove" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    --%>
   
       <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>              
               <td colspan="3" class="header_title">Update Past District Governers</td>
            </tr>
          
            <tr>
              <td ><div align="right" >Select Year</div></td>
                
                <td  ><div align="center">:</div></td>
              <td valign="top" >
                
                  <div align="left">
                      <asp:DropDownList ID="DDLYears" runat="server" CssClass="txt">
                      </asp:DropDownList> 
                  </div></td>
            </tr>
         
            <tr>
              <td><div align="right">Name of the Rotarian</div></td>
              <td><div align="center">:</div></td>
              <td><div align="left"><asp:TextBox ID="txtRotarian" runat="server" Width="400px" 
                      CssClass="txt1"></asp:TextBox></div>
              </td>
            </tr>
            
             <tr>
              <td><div align="right">Rotary Club of</div></td>
              <td><div align="center">:</div></td>
              <td><div align="left"><asp:TextBox ID="txtClubName" runat="server" Width="400px" 
                      CssClass="txt1"></asp:TextBox></div>
              </td>
            </tr>
          
            
             
            <tr>
              <td ><div align="right"></div></td>
              <td><div align="center"></div></td>
              <td><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="d" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  </div></td>
            </tr>
            
           
          </table>
     
     <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>


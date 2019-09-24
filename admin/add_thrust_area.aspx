<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="add_thrust_area.aspx.cs" Inherits="admin_add_thrust_area" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   
    
    
    <style type="text/css">
        .style3
        {
            text-align: right;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
    <ContentTemplate>--%>
    
   
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add Thrust Area
               </td>
            </tr> 
                 
                 <tr>
               <td colspan="3" >
               </td>
            </tr>    
            
            <tr>
                <td class="style3" valign="top">Thrust Area</td>
                <td class="style1" valign="top">:</td>
                <td>
                    <telerik:RadEditor ID="txtThrustarea" Runat="server">
                    </telerik:RadEditor>
                </td>
            </tr>
            
                  
            
             
            <tr>
              <td class="style3" >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit"  
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"     />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" />
                 
                  <asp:RequiredFieldValidator ID="RFVThArea" runat="server" 
                      ControlToValidate="txtThrustarea" Display="None" 
                      ErrorMessage="Please Enter the Text" ValidationGroup="A" CssClass="txt_validation"></asp:RequiredFieldValidator>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                      ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />
                 
                  </div></td>
            </tr>
            
           
          </table>
     
<%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

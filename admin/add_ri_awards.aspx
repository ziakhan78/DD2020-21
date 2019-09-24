<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_ri_awards.aspx.cs" Inherits="admin_add_ri_awards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
             vertical-align:top;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            text-align: right;
            width: 100px;
            vertical-align: top;
        }
        .style4
        {
            text-align: right;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    --%>
   
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add RI Awards
               </td>
            </tr>
           <tr>
              <td colspan="3"  class="style4"><span class="style2">*</span> Denotes Mandatory field.
                  </td>
            </tr> 
            
            <tr>
              <td class="style3"><span class="style2">*</span> Nomenclature</td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:TextBox ID="txtNomenclature" runat="server" Width="400px"></asp:TextBox>
                 
                  <asp:RequiredFieldValidator ID="RFVNomen" runat="server" 
                      ControlToValidate="txtNomenclature" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="RI"></asp:RequiredFieldValidator>
                 
              </td>
            </tr>
            
            <tr>
              <td valign="top" class="style3" ><span class="style2">*</span> To Whom</td>
              <td class="style1" valign="top"  >:</td>
              <td class="style1" >
                
                  <asp:TextBox ID="txtWhom" runat="server" Width="400px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVNomen0" runat="server" 
                      ControlToValidate="txtWhom" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="RI"></asp:RequiredFieldValidator>
                </td>
            </tr>
         
         
            
          <tr>
              <td class="style3">Purpose</td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:TextBox ID="txtPurpose" runat="server" Width="600px" Height="50px" 
                      TextMode="MultiLine"></asp:TextBox>
                 
              </td>
            </tr>
            
             <tr >
              <td class="style3">Eligibility</td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:TextBox ID="txtEligibility" runat="server" Width="600px" Height="50px" 
                      TextMode="MultiLine"></asp:TextBox>
                 
              </td>
            </tr>
            
             <tr >
              <td class="style3">Selection</td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:TextBox ID="txtSelection" runat="server" Width="600px" Height="50px" 
                      TextMode="MultiLine"></asp:TextBox>
                 
              </td>
            </tr>
            
             <tr >
              <td class="style3">Dead-Line</td>
              <td class="style1">:</td>
              <td class="style1">
                  <asp:TextBox ID="txtDeadLine" runat="server" Width="400px"></asp:TextBox>
              </td>
            </tr>
            
          <tr>
              <td class="style3">Remarks</td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:TextBox ID="txtRemarks" runat="server" Width="600px" Height="50px" 
                      TextMode="MultiLine"></asp:TextBox>
                 
              </td>
            </tr>
            
            
             
            <tr>
              <td class="style3" >&nbsp;</td>
              <td class="style1">&nbsp;</td>
               <td class="style1">
                   <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="RI" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                 </td>
            </tr>
            
           
          </table>
     
   <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>





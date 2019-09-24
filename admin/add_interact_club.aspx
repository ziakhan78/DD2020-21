<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_interact_club.aspx.cs" Inherits="admin_add_interact_club" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
     <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
   
     <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add Interact Club
               </td>
            </tr>
           <tr>
              <td align="right" colspan="3" ><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>
            <tr>
              <td ><div align="right" ><span class="style2">*</span> Name of Club</div></td>
              <td class="style1"  >:</td>
              <td class="style1" >
                
                  <asp:TextBox ID="txtClubName" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVClubName" runat="server" 
                          ControlToValidate="txtClubName" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
             <tr>
              <td ><div align="right" ><span class="style2">*</span> Interact Club No.</div></td>
              <td class="style1"  >:</td>
              <td class="style1" >
                
                  <asp:TextBox ID="txtClubNo" runat="server" Width="100px" MaxLength="8" CssClass="txtBox"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVClubNo" runat="server" 
                          ControlToValidate="txtClubNo" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                </td>
            </tr>
         
         
          <tr>
              <td ><div align="right">Charter Date</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td align="left" valign="middle"><div align="left">
                  <asp:DropDownList ID="DDLDays" runat="server" CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLMonth" runat="server" CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLYear" runat="server" CssClass="txtBox">
                  </asp:DropDownList>
                  </div></td>
            </tr>
            
          <tr>
              <td><div align="right"><span class="style2">* </span>Sponserd By RC of</div></td>
              <td class="style1">:</td>
              <td class="style1">
                 
                  <asp:DropDownList ID="DDLSponser" runat="server" DataSourceID="DSSponser"  AppendDataBoundItems="true" CssClass="txtBox"
                      DataTextField="club_name" DataValueField="id">
                      <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                  </asp:DropDownList>
                 
                  <asp:SqlDataSource ID="DSSponser" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                 
              </td>
            </tr>
            
              <tr>
              <td ><div align="right">No. of Members</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td align="left" valign="middle">
                  <asp:TextBox ID="txtNoOfMembers" runat="server" CssClass="txtBox" MaxLength="3" 
                      Width="60px"></asp:TextBox>
                  </td>
            </tr>
             
            <tr>
              <td >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
           
          
            
            <tr>
              <td colspan="3" class="header_subtitle" >President</td>
            </tr>
            <tr>
              <td width="195"><div align="right" ><span class="style2">* </span>First Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtPFName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                      <asp:RequiredFieldValidator ID="RFVPFname" runat="server" 
                          ControlToValidate="txtPFName" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                 
                  </div></td>
            </tr>
            
            <tr>
              <td width="195"><div align="right" >Middle Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtPMName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                  </div></td>
            </tr>
            
            <tr>
              <td width="195"><div align="right" ><span class="style2">* </span>Last Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtPLName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                      <asp:RequiredFieldValidator ID="RFVPLname" runat="server" 
                          ControlToValidate="txtPLName" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                 
                  </div></td>
            </tr>
            
            
            
             <tr>
              <td ><div align="right"><span class="style2">* </span>Email-Id 1</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="txtpemail" runat="server" TabIndex="26" Width="375px" CssClass="txtBox"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RFVPemail" runat="server" 
                          ControlToValidate="txtpemail" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                          runat="server" ControlToValidate="txtpemail" ErrorMessage="Invalid email-id" 
                          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                          ValidationGroup="RC" CssClass="txt_validation" Display="Dynamic"></asp:RegularExpressionValidator></div></td>
            </tr>
            
              <tr>
              <td ><div align="right">Email-Id 2</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="txtPemail2" runat="server" TabIndex="26" Width="375px" 
                          CssClass="txtBox"></asp:TextBox>
                      &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                          runat="server" ControlToValidate="txtPemail2" ErrorMessage="Invalid email-id" 
                          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                          ValidationGroup="RC" CssClass="txt_validation" Display="Dynamic"></asp:RegularExpressionValidator></div></td>
            </tr>
            
            
             <tr>
              <td ><div align="right"><span class="style2">* </span>Mobile No.1 </div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="txtmobcc" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                      <asp:TextBox ID="txtPmob1" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                     
                      &nbsp;<asp:RequiredFieldValidator ID="RFVPMob1" runat="server" 
                          ControlToValidate="txtPmob1" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                      </div></td>
            </tr>
            <tr>
              <td ><div align="right">Mobile No.2 </div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
               <asp:TextBox ID="txtmob2cc" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                      <asp:TextBox ID="txtPMob2" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                      &nbsp;</div></td>
            </tr>
            
            <tr>
              <td ><div align="right">BlackBerry PIN</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td><div align="left">
                  <asp:TextBox ID="txtPBlackberry" runat="server" TabIndex="9" Width="188px" 
                      CssClass="txtBox"></asp:TextBox>
                  &nbsp;</div></td>
            </tr>
             <tr>
              <td  ><div align="right">Residence Phone No.</div></td>
              <td ><div align="center">:</div></td>
              <td ><div align="left">
                  <asp:TextBox ID="txtRPhCC1" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtRPhAC1" runat="server"  Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtRPhone" runat="server" Width="113px" CssClass="txtBox"></asp:TextBox>
                  </div></td>
            </tr>
           
           
            <tr>
              <td ><div align="right"><span class="style2">* </span>Date of Birth</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td align="left" valign="middle"><div align="left">
                  <asp:DropDownList ID="DDLpbDay" runat="server" TabIndex="10" CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLpbMonth" runat="server" TabIndex="11" 
                      CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLpbYear" runat="server" TabIndex="11" 
                      CssClass="txtBox">
                  </asp:DropDownList>
                  </div></td>
            </tr>
            
              <tr>
              <td >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          
            
             
            
          
          
          <tr>
              <td colspan="3" class="header_subtitle" >Secretary</td>
            </tr>
            <tr>
              <td width="195"><div align="right" ><span class="style2">* </span>First Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtSFName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                      <asp:RequiredFieldValidator ID="RFVSFname" runat="server" 
                          ControlToValidate="txtSFName" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                 
                  </div></td>
            </tr>
            
            <tr>
              <td width="195"><div align="right" >Middle Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtSMName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                  </div></td>
            </tr>
            
            <tr>
              <td width="195"><div align="right" ><span class="style2">* </span>Last Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtSLName" runat="server"  Width="200px" 
                          CssClass="txtBox"></asp:TextBox>
                 
                      <asp:RequiredFieldValidator ID="RFVSLname" runat="server" 
                          ControlToValidate="txtSLName" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                 
                  </div></td>
            </tr>
            
            
            
             <tr>
              <td ><div align="right"><span class="style2">* </span>Email-Id 1</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="txtSEmail1" runat="server" TabIndex="26" Width="375px" 
                          CssClass="txtBox"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RFVSEmail1" runat="server" 
                          ControlToValidate="txtSEmail1" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="REVSEmail2" 
                          runat="server" ControlToValidate="txtSEmail1" ErrorMessage="Invalid email-id" 
                          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                          ValidationGroup="RC" CssClass="txt_validation" Display="Dynamic"></asp:RegularExpressionValidator></div></td>
            </tr>
            
              <tr>
              <td ><div align="right">Email-Id 2</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="txtSEmail2" runat="server" TabIndex="26" Width="375px" 
                          CssClass="txtBox"></asp:TextBox>
                      &nbsp;<asp:RegularExpressionValidator ID="RFVSEmail2" 
                          runat="server" ControlToValidate="txtSEmail2" ErrorMessage="Invalid email-id" 
                          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                          ValidationGroup="RC" CssClass="txt_validation" Display="Dynamic"></asp:RegularExpressionValidator></div></td>
            </tr>
            
            
             <tr>
              <td ><div align="right"><span class="style2">* </span>Mobile No.1 </div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
                      <asp:TextBox ID="TextBox5" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                      <asp:TextBox ID="txtSMob1" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                     
                      &nbsp;<asp:RequiredFieldValidator ID="RFVSMob1" runat="server" 
                          ControlToValidate="txtSMob1" ErrorMessage="Can't left blank !" 
                          CssClass="txt_validation" Display="Dynamic" ValidationGroup="RC"></asp:RequiredFieldValidator>
                      </div></td>
            </tr>
            <tr>
              <td ><div align="right">Mobile No.2 </div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td>
                  <div align="left">
               <asp:TextBox ID="TextBox7" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                      <asp:TextBox ID="txtSMob2" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                      &nbsp;</div></td>
            </tr>
            
            <tr>
              <td ><div align="right">BlackBerry PIN</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td><div align="left">
                  <asp:TextBox ID="txtSBlackberry" runat="server" TabIndex="9" Width="188px" 
                      CssClass="txtBox"></asp:TextBox>
                  &nbsp;</div></td>
            </tr>
             <tr>
              <td  ><div align="right">Residence Phone No.</div></td>
              <td ><div align="center">:</div></td>
              <td ><div align="left">
                  <asp:TextBox ID="TextBox10" runat="server" Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="TextBox11" runat="server"  Width="25px" CssClass="txtBox"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtSPhone" runat="server" Width="113px" CssClass="txtBox"></asp:TextBox>
                  </div></td>
            </tr>
           
            <tr>
              <td ><div align="right"><span class="style2">* </span>Date of Birth</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td align="left" valign="middle"><div align="left">
                  <asp:DropDownList ID="DDLsbDay" runat="server" TabIndex="10" CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLsbMonth" runat="server" TabIndex="11" 
                      CssClass="txtBox">
                  </asp:DropDownList>
                  &nbsp;<asp:DropDownList ID="DDLsbYear" runat="server" TabIndex="11" 
                      CssClass="txtBox">
                  </asp:DropDownList>
                  </div></td>
            </tr>
            
             
            <tr>
              <td >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
           
            <tr>
              <td ><div align="right"></div></td>
              <td class="style1"><div align="center"></div></td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="RC" onclick="btnSubmit_Click"   />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" />
                  </div></td>
            </tr>
            
           
          </table>
     </asp:Panel>
   </ContentTemplate>
       <Triggers>
           <asp:PostBackTrigger ControlID="btnSubmit" />
       </Triggers>
    </asp:UpdatePanel>
</asp:Content>

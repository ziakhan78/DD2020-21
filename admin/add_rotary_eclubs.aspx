<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_rotary_eclubs.aspx.cs" Inherits="admin_add_rotary_eclubs" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
        .style3
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
       <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add Rotary E-Clubs
               </td>
            </tr>
           <tr>
              <td colspan="3"  align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
            
             <tr>
              <td valign="top" class="style3" ><span class="style2">* </span>Club Name RC of</td>
              <td class="style1" valign="top"  >:</td>
              <td >
                
                  <asp:TextBox ID="txtClubname" runat="server" Width="450px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVCname" runat="server" 
                      ControlToValidate="txtClubname" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't be left blank !" ValidationGroup="EC"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
              <td class="style3">Day</td>
              <td class="style1">:</td>
              <td>
                  <asp:DropDownList ID="DDLDay" runat="server" CssClass="txt">
                      <asp:ListItem>Day</asp:ListItem>
                      <asp:ListItem>Monday</asp:ListItem>
                      <asp:ListItem>Tuesday</asp:ListItem>
                      <asp:ListItem>Wednesday</asp:ListItem>
                      <asp:ListItem>Thursday</asp:ListItem>
                      <asp:ListItem>Friday</asp:ListItem>
                      <asp:ListItem>Saturday</asp:ListItem>
                      <asp:ListItem>Sunday</asp:ListItem>
                  </asp:DropDownList>
                </td>
            </tr>
            
           
         
         
            
          <tr>
              <td valign="top" class="style3">Time</td>
              <td class="style1" valign="top">:</td>
              <td> <asp:DropDownList ID="DDLTimeH" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeM" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeAMPM" runat="server" CssClass="txt">                        
                        <asp:ListItem>PM</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
            </tr>
            
                      
            
             
            <tr>
                <td class="style3" valign="top">
                    <span class="style2">* </span>District</td>
                <td class="style1" valign="top">
                    :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtDistrictNo" Runat="server" CssClass="txt" 
                        DataType="System.Int32" MaxLength="8" Width="80px">
                        <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" />
                    </telerik:RadNumericTextBox>
                    <asp:RequiredFieldValidator ID="RFVDistrict" runat="server" 
                        ControlToValidate="txtDistrictNo" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Can't be left blank !" ValidationGroup="EC"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    Country</td>
                <td class="style1" valign="top">
                    :</td>
                <td>
                    <asp:TextBox ID="txtCountry" runat="server" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    Website</td>
                <td class="style1" valign="top">
                    :</td>
                <td>
                    <asp:TextBox ID="txtWebsite" runat="server" MaxLength="200" Width="450px" 
                        CssClass="txt">http://www.</asp:TextBox>
                </td>
            </tr>
            
                      
            
             
            <tr>
              <td class="style3" >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" ValidationGroup="EC" onclick="btnSubmit_Click"  
                      Height="22px"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  </div></td>
            </tr>
            
           
          </table>
     
    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger  ControlID="btnSubmit" />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>





<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="admin_PasswordRecovery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Administration Password Recovery</title>
<link href="../css/admin.css" type="text/css" rel="Stylesheet" />
<link href="../css/small_984.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/medium_984_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1280px) and (min-width:984px)" />
<link href="../css/large_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1920px) and (min-width:1280px)" /> <!-- Width constraint for Tablet -->
</head>

<body >
   
<form id="frm" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

   <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
  <tr>
    <td  align="center" valign="top">
        <div id="header">
       <div><img src="../admin_icons/header_admin.gif" alt="" border="0" style="float:left;" /></div>
       <div style="width:200px; height:87px; float:right;">
<img src="../admin_icons/control_panel_80.png" alt="" border="0" style="float:left;" />
<img src="../admin_icons/text.png" alt="" border="0" style="margin-top:32px;"/>
</div></div>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top"><br />
        
      <table width="451" border="0" cellpadding="0" cellspacing="0" bgcolor="#053968" class="page_title_main">
      <tr>
        <td colspan="3"><img src="../images/space.gif" width="1" height="1" /></td>
      </tr>
      <tr>
        <td width="1" rowspan="2"><img src="../images/space.gif" width="1" height="1" /></td>
        <td height="230" align="center" valign="top" bgcolor="#FFFFFF"><table width="451" border="0" cellpadding="0" cellspacing="0">
           <tr>
            <td  colspan="2" class="header_title">Password Recovery</td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
            </tr>
          <tr>
            <td width="450" align="right" valign="top"><table width="450" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top" class="pro_details">
                
                
                <table align="center" class="pro_details" >
               
                <tr>
                    <td align="center" colspan="3" valign="top">
                        <asp:Label ID="lblmsg" runat="server" BorderColor="#666666" BorderStyle="Solid" 
                            BorderWidth="1px" Visible="False" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                       <b>Username</b> </td>
                    <td align="left" valign="top" style="font-weight: bold;">
                        :</td>
                    <td align="left" valign="top"   >
                        <asp:TextBox ID="txtuname" runat="server" TabIndex="1" Width="205px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvuname" runat="server" 
                            ControlToValidate="txtuname" CssClass="txt_validation" 
                            ErrorMessage="* Enter your first name" Font-Bold="False" ValidationGroup="fp"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" >
                       
                        <b>Email-Id</b> </td>
                    <td align="left" valign="top" style="font-weight: bold;">
                        <b>:</b></td>
                    <td  colspan="0" align="left" valign="top"  >
                        <asp:TextBox ID="txtemail" runat="server" TabIndex="2" 
                Width="205px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvpsw" runat="server" 
                            ControlToValidate="txtemail" CssClass="txt_validation" 
                            ErrorMessage="* Enter your email id" Font-Bold="False" ValidationGroup="fp"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style6" valign="top">
                        &nbsp;</td>
                    <td align="left" valign="top">
                        &nbsp;</td>
                    <td align="left" colspan="0" valign="top">
                        <asp:CustomValidator ID="cvisvaliduser" runat="server" Display="Dynamic" 
                            ErrorMessage="Username or email id does not match " 
                            onservervalidate="cvisvaliduser_ServerValidate" ValidationGroup="fp" 
                            CssClass="txt_validation"></asp:CustomValidator>
                       
                        <%--<cc1:ValidatorCalloutExtender ID="cvisvaliduser_ValidatorCalloutExtender0" 
                            runat="server" Enabled="True" TargetControlID="cvisvaliduser">
                        </cc1:ValidatorCalloutExtender>--%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Invalid Email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="fp" CssClass="txt_validation"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td >
                        &nbsp;</td>
                    <td align="left"   >
                    
                            
                            <asp:Button ID="btnok"  runat="server" Text="Submit" ValidationGroup="fp" 
                                onclick="btnok_Click" CssClass="btn" Width="100px" />
                            &nbsp;<asp:Button ID="btnreset"  runat="server" Text="Reset" 
                                 CausesValidation="False" onclick="btnreset_Click" CssClass="btn" 
                                Width="100px"  />
                   
                    </td>
                </tr>
            </table>
                
                
                
                </td>
              </tr>
            </table></td>
                </tr>
            </table></td>
          <td rowspan="2" width="1">
              <img height="1" src="../images/space.gif" width="1" /></td>
          </tr>
          <tr>
              <td>
                  <img height="1" src="../images/space.gif" width="1" /></td>
          </tr>
        </table>
       
        <br />
       
       </td>
      </tr>
       <tr>
    <td align="center" class="footer">Copyright © RI District-3140 2012. All Rights 
        Reserved &#9474; Site Designed &amp; Maintained by <a  class="footer" target='_blank' href="http://www.goradiainfotech.com/">
        Goradia Infotech</a>                                             
    </td>
  </tr>
    </table>
            </td>
  </tr>
</table>
</ContentTemplate>
        </asp:UpdatePanel>
</form>
</body>
</html>

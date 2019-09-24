<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_Old.aspx.cs" Inherits="Default_Old" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: Welcome to RI District-3140 Administration ::</title>
<link href="../css/admin.css" type="text/css" rel="Stylesheet" />
<link href="../css/small_984.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/medium_984_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1280px) and (min-width:984px)" />
<link href="../css/large_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1920px) and (min-width:1280px)" /> <!-- Width constraint for Tablet -->
<style type="text/css">

.username {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
}

</style>

</head>

<body  style="background-color:White;">
   
<form id="frm" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" height="500px" style="background-color:White;">
   <tr>   
   <td><div id="header">
       <div><img src="../admin_icons/header_admin.gif" alt="" border="0" style="float:left;" /></div>
       <div style="width:200px; height:87px; float:right;">
<img src="../admin_icons/control_panel_80.png" alt="" border="0" style="float:left;" />
<img src="../admin_icons/text.png" alt="" border="0" style="margin-top:32px;"/>
</div></div>
   </td>
  </tr>
  <tr>
    <td align="center" valign="middle" >
        
       
        
     
       
   <table width="383" border="0" cellpadding="0" cellspacing="0" bgcolor="#c5dbe0" style="margin-top:50px; margin-bottom:100px;">
  <tr>
    <td width="17" height="18" align="left" valign="top"><img src="../admin_icons/corner-tl.jpg" width="17" height="18" alt="" /></td>
    <td width="350" align="left" valign="top" background="../admin_icons/top-bg.jpg" 
          style="background-repeat:repeat-x" colspan="2"><img src="../admin_icons/top-bg.jpg" width="8" height="18" /><img src="../admin_icons/top-bg.jpg" width="8" height="18" alt="" /></td>
    <td width="16" height="18" align="right" valign="top"><img src="../admin_icons/corner-tr.jpg" width="16" height="18" /></td>
  </tr>
  <tr>
    <td colspan="4" align="left" valign="top"><img src="../admin_icons/welcome.jpg" /></td>
  </tr>
  <tr>
    <td rowspan="4" align="left" valign="top" background="../admin_icons/left-bg.jpg" style="background-repeat:repeat-y"><img src="../admin_icons/left-bg.jpg" width="17" height="21" /></td>
    <td class="username" align="left"  style="padding-left:7px;" colspan="2"><p style="margin-bottom:5px">
        Username:</p>
        <asp:TextBox ID="txtUsername" runat="server" Width="336px"></asp:TextBox></td>
    <td rowspan="4" align="right" valign="top" background="../admin_icons/right-bg.jpg" style="background-repeat:repeat-y"><img src="../admin_icons/right-bg.jpg" width="16" height="26" /></td>
  </tr>
  <tr>
    <td align="left" valign="top" class="username" style="padding-left:7px;" 
          width="336" colspan="2"><p style="margin-bottom:5px">
            Password:</p>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="336px"></asp:TextBox></td>
  </tr>
  <tr>
    <td height="32" align="left" valign="middle"  class="username" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height="50px">
    <td align="left" valign="middle" style="padding-left:4px;"><asp:CheckBox ID="ckremember" runat="server" Text="Remember Login " Width="173px" />
        <br />
        &nbsp;DO NOT check this on public systems (e.g., libraries, internet cafes)</td>
  </tr>
  
       <tr height="30px">
            <td style="padding-left:7px;"><a href="PasswordRecovery.aspx" target="_blank">Forgot your password?</a></td>
        </tr>
</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
        <asp:Label ID="LblInvalid" runat="server" CssClass="txt_validation" 
            ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RFVUname" runat="server" 
            ControlToValidate="txtUsername" CssClass="txt_validation" Display="None" 
            ErrorMessage="Please Enter Username" ValidationGroup="L"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RFVPass" runat="server" 
            ControlToValidate="txtPassword" CssClass="txt_validation" Display="None" 
            ErrorMessage="Please Enter Password" ValidationGroup="L"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False" 
            ValidationGroup="L" />
    </td>
      <td align="right" valign="top">
          <asp:ImageButton ID="btnSign" runat="server" height="34" 
              ImageUrl="../admin_icons/navigariton.jpg" onclick="btnSign_Click1" 
              width="74" ValidationGroup="L" />
      </td>
  </tr>
  <tr>
    <td width="17" height="19" align="left" valign="bottom"><img src="../admin_icons/corner-br.jpg" width="17" height="19" /></td>
    <td align="left" valign="bottom" background="../admin_icons/bottom-bg.jpg" 
          style="background-repeat:repeat-x" colspan="2"><img src="../admin_icons/bottom-bg.jpg" width="21" height="19" /></td>
    <td width="16" align="right" valign="bottom"><img src="../admin_icons/corner-bl.jpg" width="16" height="19" /></td>
  </tr>
</table>
       
       </td>
        <td width="1" rowspan="2"><img src="../admin_icons/space.gif" width="1" height="1" /></td>
      </tr>
      <tr>
        <td><img src="../admin_icons/space.gif" width="1" height="1" alt="" /></td>
      </tr>
   
 
      
       <tr><td align="center"  valign="middle">
              <table align="center" width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td align="center" class="footer">Copyright © RI District-3140 2012. All Rights 
        Reserved &#9474; Site Designed &amp; Maintained by <a  class="footer" target='_blank' href="http://www.goradiainfotech.com/">
        Goradia Infotech</a>                                             
    </td>
  </tr>
  
</table>
</td></tr>

</table>
<%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
</form>









</body>
</html>
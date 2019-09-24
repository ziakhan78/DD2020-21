<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/adminpanel.css" rel="stylesheet" type="text/css" />
</head>
<body >
    <form id="form1" runat="server">
        <div class="top_header">
            <div class="holder">
                <div class="admin_panel ">
                    <img src="../admin_icons/setting.png" width="33" height="31" alt="" style="vertical-align: middle" /><span class="admin_panel_text">Admin Panel 3.4.1</span></div>


                <div class="logo">
                    <img src="../admin_icons/logo.png"  alt="" /></div>
            </div>
        </div>


        <div class="holder">

             <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSign">
            <div class="admin_sbg">

                <div class="admin_div">
                    <div class="admin_textdhy style1">
                        Admin Login
                        <div class="style2">Use a valid username and password to gain access</div>
                    </div>
                    <div class="admin_icon">
                        <img src="../admin_icons/lock_img.jpg" width="79" height="91" alt="" /></div>
                </div>

                <form action="#" id="login-form-1">
                    <div class="user_details">
                        <div style="margin: 30px 0px 0 20px;" class="style3">User Name</div>
                        <div style="margin: 5px 50px 15px 20px;">                            
                            <asp:TextBox ID="txtUsername" runat="server" class="txtBox"></asp:TextBox>
                        </div>
                        <div style="margin: 10px 0px 0 20px;" class="style3">Password:</div>
                        <div style="margin: 5px 50px 5px 20px;">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="txtBox"></asp:TextBox>
                        </div>
                    </div>
                </form>

                <div class="button_div">
                    <div>
                       <asp:LinkButton ID="btnSign" runat="server" CssClass="btn_red"  ValidationGroup="L" OnClick="btnSign_Click">Login<img src="../admin_icons/arrow.png" alt="" style="vertical-align: middle" /></asp:LinkButton>
                        
                         &nbsp;<a href="PasswordRecovery.aspx"><strong>Forgot your password?</strong></a></div>
                    <div>
                        <br>
                        <br>                        
                        <span for="option_1"><strong><asp:CheckBox ID="ckremember" runat="server" Text="Remember Login" /></strong></span>
                    </div>
                </div>

            </div>
                 </asp:Panel>
        </div>

        <footer style="margin-top: 50px;">


            <div align="center" style="border-top: 1px solid #aeaeae; padding-top: 10px;">Copyright © 2015 RI District 3141. All Rights Reserved. | Site Designed & Maintained By <a href="http://www.goradiainfotech.com/" target="_blank">Goradia Infotech</a></div>

        </footer>
    </form>
</body>
</html>

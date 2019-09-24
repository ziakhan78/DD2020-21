<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_members.aspx.cs" Inherits="admin_add_members" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function reloadPage() {
            window.location.reload()
        }
    </script>

    <%-- <script language="javascript" type="text/javascript">
        function ChkDDLVal() {
            var barHead = document.getElementById('<%=DDLClubName.ClientID%>');
            if (barHead.value == 'Select Club Name') {
                alert('Please select club name');
                barHead.focus();
                return false;
            }          
            return true;
        }
    </script>--%>

    <style type="text/css">
        .style1 {
            text-align: left;
        }

        .style2 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td colspan="5" class="header_title">Add Members</td>
                    </tr>
                    <tr>
                        <td align="right" colspan="5"><span class="style2">*</span> Denotes Mandatory field.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="header_subtitle">Club Details</td>
                    </tr>
                    <tr>
                        <td align="right" width="150px">Rotary Club of</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:DropDownList ID="DDLClubName" runat="server" CssClass="txtBox" AppendDataBoundItems="True"
                                AutoPostBack="True" DataSourceID="dsClubName" DataTextField="club_name" DataValueField="id" OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                                <asp:ListItem>Select Club Name</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFClubname" runat="server"
                                ControlToValidate="DDLClubName" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage=" Please select club name" InitialValue="Select Club Name"
                                ValidationGroup="M"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">RI Club No.</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:Label ID="lblClubNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Charter Date</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:Label ID="lblCharterDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Day</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:Label ID="lblMeetingDay" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Time</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">

                            <asp:Label ID="lblMeetingTime" runat="server"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td align="right">Meeting Venue</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:Label ID="lblVenue" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">GPS Coordinates</td>
                        <td class="style1">:</td>
                        <td class="style1" colspan="3">
                            <asp:Label ID="lblGPS" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="style1" colspan="3">
                            <asp:SqlDataSource ID="dsClubName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5" class="header_subtitle">Member Details</td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right"><span class="style2">* </span>RI Membership No.</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <telerik:RadNumericTextBox ID="txtmno" runat="server"
                                    MaxLength="8"
                                    DataType="System.Int32" Skin="Silk" Width="120px" MinValue="0" CssClass="txtBox">
                                    <NumberFormat DecimalDigits="0" AllowRounding="False" GroupSeparator="" />
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="RFFname0" runat="server" ControlToValidate="txtmno" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="M"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CVRImemNo" runat="server" ControlToValidate="txtmno"
                                    CssClass="txt_validation" Display="Dynamic" ErrorMessage="RI membership no. already exist"
                                    OnServerValidate="CVRImemNo_ServerValidate" ValidationGroup="M"></asp:CustomValidator>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Membership Type </div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:RadioButtonList ID="rbtnMtype" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">Active</asp:ListItem>
                                    <asp:ListItem Value="1">Honorary</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right"><span class="style2">*</span> Title / Prefix</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="drtitle" runat="server" CssClass="txtBox" AppendDataBoundItems="true" >
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>                             
                                <asp:RequiredFieldValidator ID="RFTitle" runat="server" ControlToValidate="drtitle" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Title" InitialValue="Select" ValidationGroup="M"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right"><span class="style2">*</span> First Name</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtfname" runat="server" Width="200px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RFFname" runat="server"
                                    ControlToValidate="txtfname" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Can't be left blank!" ValidationGroup="M"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Middle Name</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtmname" runat="server" Width="200px"
                                    CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right"><span class="style2">* </span>Last Name</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtlname" runat="server" Width="200px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RFLname" runat="server"
                                    ControlToValidate="txtlname" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Can't be left blank!" ValidationGroup="M"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Call name (Nickname)</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtCallname" runat="server" Width="200px"
                                    CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Suffix</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="DDLSuffix" runat="server" CssClass="txtBox">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>I</asp:ListItem>
                                    <asp:ListItem>II</asp:ListItem>
                                    <asp:ListItem>III</asp:ListItem>
                                    <asp:ListItem>Jr.</asp:ListItem>
                                    <asp:ListItem>Sr.</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Gender</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">

                                <asp:RadioButtonList ID="rbtnGender" runat="server"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                                    <asp:ListItem Value="1">Female</asp:ListItem>
                                </asp:RadioButtonList>

                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Charter Member</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">

                                <asp:RadioButtonList ID="rbtnCharterMem" runat="server"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                </asp:RadioButtonList>

                            </div>
                        </td>
                    </tr>


                   <%-- <tr>
                        <td>
                            <div align="right"><span class="style2">* </span>Club Designation</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="DDLDisttDesig" runat="server" CssClass="txtBox">
                                    <asp:ListItem Text="None">Select</asp:ListItem>
                                    <asp:ListItem Text="Member">Member</asp:ListItem>
                                    <asp:ListItem Text="Honorary Member">Honorary Member</asp:ListItem>
                                    <asp:ListItem Text="President">President</asp:ListItem>
                                    <asp:ListItem Text="Secretary">Secretary</asp:ListItem>


                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RFVdob1" runat="server" ControlToValidate="DDLDisttDesig" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select club designation" InitialValue="Select" ValidationGroup="M"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>--%>

                    <tr>
                        <td>
                            <div align="right">Classification</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtclasi" runat="server" Width="300px"
                                    CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Qualification</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtquali" runat="server" Width="300px"
                                    CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>



                    <tr>
                        <td>
                            <div align="right"><span class="style2">* </span>Personal Email-Id</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtpemail" runat="server" Width="300px"
                                    CssClass="txtBox"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="REEmail" runat="server"
                                    ControlToValidate="txtpemail" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Invalid email-id"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="M"></asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CVEmailid" runat="server" ControlToValidate="txtpemail"
                                    CssClass="txt_validation" Display="Dynamic" ErrorMessage="Email-Id already exist."
                                    OnServerValidate="CVEmailid_ServerValidate" ValidationGroup="M"></asp:CustomValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Alternate Email-Id</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtpemail2" runat="server" Width="300px"
                                    CssClass="txtBox"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="txtpemail2" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Invalid email-id"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="M"></asp:RegularExpressionValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right"><span class="style2">* </span>Mobile No.1 </div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtmob1cc" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <telerik:RadTextBox ID="txtmob1" runat="server" LabelWidth="64px" Width="120px" MaxLength="12" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                             <%--   <telerik:RadNumericTextBox ID="txtmob1" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                </telerik:RadNumericTextBox>--%>
                                <asp:RequiredFieldValidator ID="RFVMobile" runat="server"
                                    ControlToValidate="txtmob1" Display="Dynamic" ErrorMessage="Can't be left blank!"
                                    ValidationGroup="M" CssClass="txt_validation"></asp:RequiredFieldValidator>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Mobile No.2 </div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtmob2cc" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                 <telerik:RadTextBox ID="txtmob2" runat="server" LabelWidth="64px" Width="120px" MaxLength="10" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                               <%-- <telerik:RadNumericTextBox ID="txtmob2" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                </telerik:RadNumericTextBox>--%>


                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3" align="left" valign="middle">
                            <div align="left">
                                <asp:DropDownList ID="drpbday" runat="server" CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpbmonth" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                               <%-- &nbsp;<asp:DropDownList ID="drpbyear" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>--%>
                                
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Blood Group</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="drpbg" runat="server" CssClass="txtBox">
                                    <asp:ListItem Selected="True">Select</asp:ListItem>
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>AB</asp:ListItem>
                                    <asp:ListItem>O</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<span>&nbsp;RH</span> <span>Factor</span>&nbsp;
                      <asp:DropDownList ID="drprhf" runat="server" CssClass="txtBox">
                          <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>+</asp:ListItem>
                          <asp:ListItem>-</asp:ListItem>
                      </asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                     <tr>
                                    <td>
                                        <div align="right">Donate Blood</div>
                                    </td>
                                    <td class="style1">
                                        <div align="center">:</div>
                                    </td>
                                    <td colspan="3">
                                        <div align="left">

                                            <asp:RadioButtonList ID="rbtnDonateBlood" runat="server"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                            </asp:RadioButtonList>

                                        </div>
                                    </td>
                                </tr>


                    <tr>
                        <td>
                            <div align="right">Hobbies</div>
                        </td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">
                            <asp:TextBox ID="txtMemHobbies" runat="server" Width="300px"
                                CssClass="txtBox" MaxLength="100"></asp:TextBox></td>
                    </tr>


                    <tr>
                        <td align="right">TRF Amount US $</td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td align="left" colspan="3">

                            <telerik:RadNumericTextBox ID="txtTRFAmt" runat="server" MaxLength="8" Skin="Silk"
                                CssClass="txtBox" AutoPostBack="True" OnTextChanged="txtTRFAmt_TextChanged">
                                <NumberFormat DecimalDigits="2" AllowRounding="False"
                                    KeepTrailingZerosOnFocus="True" />
                            </telerik:RadNumericTextBox>
                            </tr>

                    <tr>
                        <td>
                            <div align="right">TRF Status </div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:Label ID="lblTRFStatus" runat="server"></asp:Label>
                            </div>



                        </td>
                    </tr>



                    <tr>
                        <td align="right">Date of Joining</td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td align="left" colspan="3">

                            <telerik:RadDatePicker ID="DOJ" runat="server" Skin="Silk"
                                Culture="(Default)" MinDate="1900-01-01" >
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

                                <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" AutoPostBack="True"></DateInput>
                            </telerik:RadDatePicker>

                        </td>
                    </tr>

                    <tr>
                        <td class="style3">
                            <div align="right">Food Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3" align="left">
                            <asp:RadioButtonList ID="rdpreferfoodp" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Vegetarian</asp:ListItem>
                                <asp:ListItem>Jain</asp:ListItem>
                                <asp:ListItem>Non-Vegetarian</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                   <%-- <tr>
                        <td class="style3">
                            <div align="right">Drink Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3" align="left">
                            <asp:RadioButtonList ID="rdpreferdrink" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Teetotaler</asp:ListItem>
                                <asp:ListItem>Prefer Alcohol</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>--%>

                     <tr>
                                    <td class="style3">
                                        <div align="right">Drink Preference</div>
                                    </td>
                                    <td>:</td>
                                    <td colspan="3" align="left">
                                        <asp:RadioButtonList ID="rdpreferdrink" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rdpreferdrink_SelectedIndexChanged" CssClass="rbl">
                                            <asp:ListItem Selected="True" Text="Teetotaler"></asp:ListItem>
                                            <asp:ListItem Text="Prefer Alcohol"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RadioButtonList ID="rbtnPrefAlcohol" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="True" CssClass="rbl">
                                            <asp:ListItem Selected="True" Value="0" Text="Whisky"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Vodka"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Rum"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Red Wine"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="White Wine"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>


                    <tr>
                        <td align="right">Introduced By</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">

                            <asp:DropDownList ID="DDLproposed" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>

                            &nbsp;
                  <asp:CheckBox ID="chkIfOther" runat="server" AutoPostBack="True"
                      OnCheckedChanged="chkIfOther_CheckedChanged" Text="If other" TextAlign="Left" />

                        </td>
                    </tr>
                    <tr id="TrProposed" runat="server">
                        <td align="right">If Other</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">
                            <asp:TextBox ID="txtProposedOther" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style3" valign="top" align="right">Best Time to Call</td>
                        <td class="style1" valign="top">:</td>
                        <td colspan="3">
                            <table class="style4">
                                <tr>
                                    <td width="90px" valign="top">In Morning :</td>
                                    <td valign="top" width="350px">From :&nbsp;
                            <asp:DropDownList ID="DDLh1" runat="server" CssClass="txtBox">
                            </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm1" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf1" runat="server" CssClass="txtBox">
                                        <asp:ListItem>AM</asp:ListItem>
                                        <asp:ListItem>PM</asp:ListItem>
                                    </asp:DropDownList>
                                        &nbsp;</td>
                                    <td valign="top" width="400px">To :&nbsp;
                                    <asp:DropDownList ID="DDLh2" runat="server"
                                        CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm2" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf2" runat="server" CssClass="txtBox">
                                        <asp:ListItem>AM</asp:ListItem>
                                        <asp:ListItem>PM</asp:ListItem>

                                    </asp:DropDownList>
                                        &nbsp;</td>
                                </tr>

                                <tr>
                                    <td width="90px" valign="top">In Afternoon :</td>
                                    <td valign="top" width="350px">From :&nbsp;
                            <asp:DropDownList ID="DDLh3" runat="server" CssClass="txtBox">
                            </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm3" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf3" runat="server" CssClass="txtBox">
                                        <asp:ListItem>PM</asp:ListItem>
                                        <asp:ListItem>AM</asp:ListItem>
                                    </asp:DropDownList>
                                        &nbsp;</td>
                                    <td colspan="3" valign="top">To :&nbsp;
                                    <asp:DropDownList ID="DDLh4" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm4" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf4" runat="server" CssClass="txtBox">
                                        <asp:ListItem>PM</asp:ListItem>
                                        <asp:ListItem>AM</asp:ListItem>
                                    </asp:DropDownList>

                                    </td>
                                </tr>

                                <tr>
                                    <td valign="top">In Evening :</td>
                                    <td valign="top">From :&nbsp;
                            <asp:DropDownList ID="DDLh5" runat="server" CssClass="txtBox">
                            </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm5" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf5" runat="server" CssClass="txtBox">
                                        <asp:ListItem>PM</asp:ListItem>
                                        <asp:ListItem>AM</asp:ListItem>
                                    </asp:DropDownList>
                                        &nbsp;</td>
                                    <td colspan="3" valign="top" width="400px">To :&nbsp; 
                                <asp:DropDownList ID="DDLh6" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLm6" runat="server" CssClass="txtBox">
                                    </asp:DropDownList>
                                        -
                                    <asp:DropDownList ID="DDLf6" runat="server" CssClass="txtBox">
                                        <asp:ListItem>PM</asp:ListItem>
                                        <asp:ListItem>AM</asp:ListItem>
                                    </asp:DropDownList></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td valign="top" align="right">Image</td>
                        <td valign="top" class="style1">:</td>
                        <td align="left" colspan="3">
                            <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png,gif" ChunkSize="0" EnableInlineProgress="true" InputSize="56" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                            </telerik:RadAsyncUpload>
                            <br />
                            <span class="style2"><strong>(Upload only .jpg, .jpeg, .gif, .png, .pdf format and 
                  maximum file size is 400 KB )</strong><br />
                                <br />
                                <asp:Image ID="MemImage" runat="server" AlternateText="Member Image"
                                    Height="110px" Width="100px" />
                            </span>
                            <br />
                        </td>
                    </tr>

              <tr>
                        <td colspan="5" class="header_subtitle">Positions</td>

                    </tr>

                   

                    <tr>
                        <td align="right">Position(s) Held</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">
                            <asp:DropDownList ID="DDLPHeld" runat="server" CssClass="txtBox"
                                AutoPostBack="True" OnSelectedIndexChanged="DDLPHeld_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Club</asp:ListItem>
                                <asp:ListItem>District</asp:ListItem>
                                <asp:ListItem>RI</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeld" runat="server" ControlToValidate="DDLPHeld" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Position Held" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td width="195px" align="right" valign="top">Year</td>
                        <td width="5px" valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLPHYear" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DDLPHYear_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeldYear" runat="server" ControlToValidate="DDLPHYear" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Year" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">Avenue</td>
                        <td valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLAvenue" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DDLAvenue_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeldPost" runat="server" ControlToValidate="DDLAvenue" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Avenue" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                     <tr>
                        <td align="right" valign="top">Post</td>
                        <td valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLPosition" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPo" runat="server" ControlToValidate="DDLPosition" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Post" InitialValue="Select" ValidationGroup="P"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr>
                        <td></td>
                        <td></td>
                        <td align="left" colspan="3" valign="top">
                            <asp:Button ID="btnPHAdd" runat="server" CssClass="btn" Text="Add" Width="65px"
                                OnClick="btnPHAdd_Click" ValidationGroup="P" />
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td align="left" colspan="3" valign="top">

                            <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%"
                                OnItemCommand="RadGrid1_ItemCommand" >
                                <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"
                                    EnableImageSprites="True">
                                </HeaderContextMenu>
                                <MasterTableView AutoGenerateColumns="False">
                                    <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px" />
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px" />
                                    </ExpandCollapseColumn>
                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" Width="20px"></HeaderStyle>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridBoundColumn DataField="years" HeaderText="Year" HeaderStyle-Font-Bold="true"
                                            SortExpression="years" UniqueName="years">

                                            <ItemStyle Width="100px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" Width="100px"></HeaderStyle>

                                        </telerik:GridBoundColumn>

                                           <telerik:GridBoundColumn DataField="avenue" HeaderText="Avenue" HeaderStyle-Font-Bold="true"
                                            SortExpression="avenue" UniqueName="avenue">
                                            <ItemStyle Width="200px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" Width="200px"></HeaderStyle>

                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="position" HeaderText="Position Held" HeaderStyle-Font-Bold="true"
                                            SortExpression="position" UniqueName="position">
                                            <ItemStyle Width="200px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" Width="200px"></HeaderStyle>

                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="position_held_on" HeaderText="Position In" HeaderStyle-Font-Bold="true"
                                            SortExpression="position_held_on" UniqueName="position_held_on">
                                            <ItemStyle Width="80px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Bold="True" Width="80px"></HeaderStyle>
                                        </telerik:GridBoundColumn>




                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                            <ItemTemplate>
                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                </cc1:ConfirmButtonExtender>
                                                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                    CommandArgument='<%# Eval("id") %>' runat="Server"
                                                    AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="30px" Font-Bold="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </td>
                    </tr>
                   

                    <tr>
                        <td colspan="5" class="header_subtitle">Awards</td>

                    </tr>

                    <tr>
                        <td align="right">Award(s) Won</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">
                            <asp:DropDownList ID="DDLAwardWon" runat="server" CssClass="txtBox"
                                AutoPostBack="True" OnSelectedIndexChanged="DDLAwardWon_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Club</asp:ListItem>
                                <asp:ListItem>District</asp:ListItem>
                                <asp:ListItem>RI</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAwards" runat="server" ControlToValidate="DDLAwardWon" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Awards Won" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td width="195px" align="right" valign="top">Year</td>
                        <td width="5px" valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLAwardYear" runat="server" CssClass="txtBox" AppendDataBoundItems="true" >
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAwardYear" runat="server" ControlToValidate="DDLAwardYear" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Award Year" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">Name of Award</td>
                        <td valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLAwardName" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="rfvAwardsName" runat="server" ControlToValidate="DDLAwardName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Award Name" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>

                        </td>

                    </tr>

                    <tr>
                        <td class="style3"></td>
                        <td></td>
                        <td align="left" colspan="3" valign="top">
                            <asp:Button ID="btnAward" runat="server" CssClass="btn" Text="Add" Width="65px" OnClick="btnAward_Click" ValidationGroup="A" />
                        </td>
                    </tr>

                    <tr>
                        <td class="style3"></td>
                        <td></td>
                        <td align="left" colspan="3" valign="top">
                            <telerik:RadGrid ID="RadGrid2" runat="server" Width="100%"
                                OnItemCommand="RadGrid2_ItemCommand">
                                <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"
                                    EnableImageSprites="True">
                                </HeaderContextMenu>
                                <MasterTableView AutoGenerateColumns="False">
                                    <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px" />
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px" />
                                    </ExpandCollapseColumn>
                                    <Columns>

                                        <telerik:GridBoundColumn DataField="years" HeaderText="Year" HeaderStyle-Font-Bold="true"
                                            SortExpression="years" UniqueName="years">
                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="award_name" HeaderText="Award Name" HeaderStyle-Font-Bold="true"
                                            SortExpression="award_name" UniqueName="award_name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="award_won" HeaderText="Type" HeaderStyle-Font-Bold="true"
                                            SortExpression="award_won" UniqueName="award_won">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                            <ItemTemplate>
                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                </cc1:ConfirmButtonExtender>
                                                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                    CommandArgument='<%# Eval("id") %>' runat="Server"
                                                    AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="30px" Font-Bold="True" />
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>




                    <tr>
                        <td colspan="5" class="header_subtitle">Spouse Details</td>

                    </tr>

                    <tr>
                        <td>
                            <div align="right">Spouse Name </div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtsname" runat="server" Width="200px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Spouse Date of Birth</td>
                         <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td align="left" colspan="3">
                            <asp:DropDownList ID="DDLSpDOBDay" runat="server" CssClass="txtBox">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="DDLSpDOBMonth" runat="server"
                                CssClass="txtBox">
                            </asp:DropDownList>
                            <%--&nbsp;<asp:DropDownList ID="DDLSpDOBYear" runat="server"
                                CssClass="txtBox">
                            </asp:DropDownList>--%>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Spouse Blood Group</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="DDLsBG" runat="server" CssClass="txtBox">
                                    <asp:ListItem Selected="True">Select</asp:ListItem>
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>AB</asp:ListItem>
                                    <asp:ListItem>O</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<span>&nbsp;RH</span> <span>Factor</span>&nbsp;
                      <asp:DropDownList ID="DDLsRH" runat="server" CssClass="txtBox">
                          <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>+</asp:ListItem>
                          <asp:ListItem>-</asp:ListItem>
                      </asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                      <tr>
                                    <td>
                                        <div align="right">Donate Blood</div>
                                    </td>
                                    <td class="style1">
                                        <div align="center">:</div>
                                    </td>
                                    <td colspan="3">
                                        <div align="left">

                                            <asp:RadioButtonList ID="rbtnSpouseDonateBlood" runat="server"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                            </asp:RadioButtonList>

                                        </div>
                                    </td>
                                </tr>

                    <tr>
                        <td>
                            <div align="right">Anniversary</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td align="left" valign="middle" colspan="3">
                            <div align="left">
                                <asp:DropDownList ID="drannivday" runat="server" CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;&nbsp;<asp:DropDownList ID="drannivmonth" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                              <%--  &nbsp;&nbsp;<asp:DropDownList ID="drannivyear" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>--%>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Mobile No.</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtSmobileCc" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <telerik:RadNumericTextBox ID="txtSmobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                </telerik:RadNumericTextBox>

                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Email-Id</div>
                        </td>
                        <td class="style1">
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtSEmail" runat="server" Width="300px"
                                    CssClass="txtBox"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtSEmail" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="Invalid email-id"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="M"></asp:RegularExpressionValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">Hobbies </td>
                        <td class="style1">:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtShobbies" runat="server" Width="300px" CssClass="txtBox" MaxLength="100"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Food Preference</div>
                        </td>
                        <td class="style1">:</td>
                        <td colspan="3" align="left">
                            <asp:RadioButtonList ID="rdpreferfoods" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Vegetarian</asp:ListItem>
                                <asp:ListItem>Jain</asp:ListItem>
                                <asp:ListItem>Non-Vegetarian</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                   <tr>
                                   <td>
                            <div align="right">Drink Preference</div>
                        </td>
                                    <td class="style1">:</td>
                        <td colspan="3" align="left">
                                        <asp:RadioButtonList ID="rbtnDrinkPrefSpouse" runat="server"
                                            RepeatDirection="Horizontal" CssClass="rbl" AutoPostBack="True" OnSelectedIndexChanged="rbtnDrinkPrefSpouse_SelectedIndexChanged">
                                            <asp:ListItem Selected="True" Text="Teetotaler"></asp:ListItem>
                                            <asp:ListItem Text="Prefer Alcohol"></asp:ListItem>
                                        </asp:RadioButtonList>

                                        <asp:RadioButtonList ID="rbtnSpousePreferAlcohol" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="True" CssClass="rbl">
                                            <asp:ListItem Selected="True" Value="0" Text="Whisky"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Vodka"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Rum"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Red Wine"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="White Wine"></asp:ListItem>
                                        </asp:RadioButtonList>

                                    </td>
                                </tr>


                    <tr>
                        <td valign="top" align="right">&nbsp;Image</td>
                        <td valign="top" class="style1">:</td>
                        <td colspan="3" align="left">
                            <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" AllowedFileExtensions="jpg,jpeg,png,gif" ChunkSize="0" EnableInlineProgress="true" InputSize="56" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload2_FileUploaded">
                            </telerik:RadAsyncUpload>
                            <br />
                            <span class="style2"><strong>(Upload only .jpg, .jpeg, .gif, .png, .pdf format and 
                  maximum file size is 400 KB )</strong><br />
                                <br />
                                <asp:Image ID="SpouseImage" runat="server" AlternateText="Spouse Image"
                                    Height="110px" Width="100px" />
                            </span>
                            <br />
                        </td>
                    </tr>


                    <tr>
                        <td colspan="5" class="header_subtitle">Residence Address</td>

                    </tr>

                    <tr>
                        <td>
                            <div align="right">Address Line 1</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtradd1" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Address Line 2</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtradd2" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">City</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtrcity" runat="server" Width="250px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Pincode</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtrpin" runat="server" CssClass="txtBox"
                                    MaxLength="8"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">State</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtrstate" runat="server" Width="250px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Country</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtrcountry" runat="server" Width="250px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Residence Phone 1</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">

                                <span>
                                    <telerik:RadTextBox ID="txtRPhCC1" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>
                                    <telerik:RadNumericTextBox ID="txtRPhAC1" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtRPh1" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Residence Phone 2</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">

                                <span>
                                    <telerik:RadTextBox ID="txtRPhCC2" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>

                                    <telerik:RadNumericTextBox ID="txtRPhAC2" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtRPh2" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Residence Fax</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">

                                <span>
                                    <telerik:RadTextBox ID="txtRFaxCC1" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>
                                    <telerik:RadNumericTextBox ID="txtRFaxAC1" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtRFax1" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="3">
                            <div align="left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="header_subtitle">Company Address</td>

                    </tr>


                    <tr>
                        <td>
                            <div align="right">Company Name</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtcompany" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Designation</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtdesign" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Address Line 1</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtcadd1" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Address Line 2</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtcadd2" runat="server" Width="450px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">City</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtcompcity" runat="server" CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Pincode</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtcpin" runat="server" CssClass="txtBox"
                                    MaxLength="8"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">State</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtcstate" runat="server" Width="250px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Country</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">

                            <div align="left">
                                <asp:TextBox ID="txtccountry" runat="server" Width="250px"
                                    CssClass="txtBox"></asp:TextBox>
                                &nbsp;
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Business Phone 1</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtBPhCC1" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>
                                    <telerik:RadNumericTextBox ID="txtBPhAC1" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtBPh1" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business Phone 2</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtBPhCC2" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>
                                    <telerik:RadNumericTextBox ID="txtBPhAC2" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtBPh2" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business Fax  </div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <span>
                                    <telerik:RadTextBox ID="txtBFaxCC1" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                                    </telerik:RadTextBox>
                                    -</span>
                                <span>
                                    <telerik:RadNumericTextBox ID="txtBFaxAC1" runat="server" MaxLength="4" Width="60px" CssClass="txtBox" Skin="Silk" MinValue="0">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>

                                    &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtBFax1" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk" MinValue="0">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Business E-Mail</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtbemail" runat="server" Width="375px" CssClass="txtBox"></asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                    ControlToValidate="txtbemail" ErrorMessage="Invalid Email-Id"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="txt_validation" ValidationGroup="M"></asp:RegularExpressionValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Website</div>
                        </td>
                        <td>
                            <div align="center">:</div>
                        </td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtwebsite" runat="server" Width="375px"
                                    CssClass="txtBox" MaxLength="50">http://www.</asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5" class="header_subtitle">Children Details</td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Child 1 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtc1name" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <asp:DropDownList ID="drc1bday" runat="server" CssClass="txtBox">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="drc1bmonth" runat="server"
                                CssClass="txtBox">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="drc1byear" runat="server"
                                CssClass="txtBox">
                            </asp:DropDownList>
                        </td>
                        <td align="right" valign="middle">Gender :</td>
                        <td align="left" valign="middle" width="50%">
                            <asp:RadioButtonList ID="genderC1" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="1">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4"></td>
                        <td></td>
                        <td colspan="3">
                            <div align="left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <div align="right">Child 2 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtc2name" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <div align="left">
                                <asp:DropDownList ID="drc2bday" runat="server" CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drc2bmonth" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drc2byear" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                            </div>
                        </td>
                        <td align="right" valign="middle">Gender :</td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="genderC2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="1">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td colspan="3">
                            <div align="left"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Child 3 Name</div>
                        </td>
                        <td>:</td>
                        <td colspan="3">
                            <div align="left">
                                <asp:TextBox ID="txtc3name" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Date of Birth</div>
                        </td>
                        <td>:</td>
                        <td align="left" valign="middle">
                            <div align="left">
                                <asp:DropDownList ID="drc3bday" runat="server" CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drc3bmonth" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drc3bYear" runat="server"
                                    CssClass="txtBox">
                                </asp:DropDownList>
                            </div>
                        </td>
                        <td align="right" valign="middle">Gender :</td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="genderC3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="1">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="5" class="header_subtitle">Communication Preferences</td>
                    </tr>


                    <tr>
                        <td>
                            <div align="right">Mail (Post) Preference </div>
                        </td>
                        <td>:</td>
                        <td colspan="3" align="left">
                            <asp:RadioButtonList ID="rdprefermail" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Residence</asp:ListItem>
                                <asp:ListItem>Office</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Fax Preference </div>
                        </td>
                        <td>:</td>
                        <td colspan="3" align="left">
                            <asp:RadioButtonList ID="rdpreferfax" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Residence</asp:ListItem>
                                <asp:ListItem>Office</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div align="right">Email Preference  </div>
                        </td>
                        <td valign="top">:</td>
                        <td align="left" valign="top">
                            <asp:RadioButtonList ID="rdpreferemail" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Personal</asp:ListItem>
                                <asp:ListItem>Business</asp:ListItem>
                            </asp:RadioButtonList>
                            (This will be your login email-id.)
                        </td>
                        <td colspan="2"></td>
                    </tr>

                    <!-- Change Password Start -->

                    <tr id="TrPass" runat="server">
                        <td colspan="5">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>

                                    <table width="100%">
                                        <tr>
                                            <td colspan="8" class="header_subtitle">Change Password</td>                                           
                                        </tr>


                                        <tr style="text-align: right">
                                            <td width="150px">
                                                <div align="right">Current Password</div>
                                            </td>
                                            <td width="5px">
                                                <div align="center">:</div>
                                            </td>
                                            <td colspan="3">
                                                <div align="left">
                                                    <asp:TextBox ID="txtoldp" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td valign="top" align="right">New Password</td>
                                            <td valign="top">:</td>
                                            <td colspan="3">
                                                <div align="left">
                                                    <asp:TextBox ID="txtnewp" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
                                                    <cc1:PasswordStrength ID="PasswordTextBox_PasswordStrength" runat="server"
                                                        Enabled="True" TargetControlID="txtnewp"
                                                        PrefixText="Password Strength: " BarBorderCssClass=""
                                                        BarIndicatorCssClass="" TextCssClass="pwd_strength">
                                                    </cc1:PasswordStrength>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                        ControlToValidate="txtnewp" Display="Dynamic"
                                                        ErrorMessage="Enter new password" ValidationGroup="cp"
                                                        CssClass="txt_validation"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                        ControlToValidate="txtnewp" Display="Dynamic" ErrorMessage="Password has to be between 8 to 12 characters. It should be alphanumeric, case sensitive and should have one numeric field."
                                                        ValidationExpression="(?!^[0-9]*$)(?!^[A-Za-z]*$)^([A-Za-z0-9]{8,12})$"
                                                        ValidationGroup="cp" CssClass="txt_validation"></asp:RegularExpressionValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top"></td>
                                            <td valign="top"></td>
                                            <td colspan="3">
                                                <asp:Button ID="btnCreatePass" runat="server" CausesValidation="False"
                                                    OnClick="btnCreatePass_Click" Text="Create New Password" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="right">Confirm Password</td>
                                            <td valign="top">:</td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="txtcp" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                    ControlToValidate="txtcp" Display="Dynamic"
                                                    ErrorMessage="Confirm new password" ValidationGroup="cp"
                                                    CssClass="txt_validation"></asp:RequiredFieldValidator>
                                                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server"
                                                    ControlToCompare="txtnewp" ControlToValidate="txtcp" Display="Dynamic"
                                                    ErrorMessage="Password Mismatch" ValidationGroup="cp"
                                                    CssClass="txt_validation"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td colspan="3">
                                                <asp:Button ID="btnChangePass" runat="server" OnClick="btnChangePass_Click"
                                                    Text="Update Password" ValidationGroup="cp" />
                                            </td>
                                        </tr>

                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                    </tr>

                    <!-- Change Password End -->

                    <%-- <tr>
                    <td align="center" colspan="5">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="txt_validation" ValidationGroup="M" />
                    </td>
                </tr>--%>


                    <tr>
                        <td align="center" colspan="5">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="M" Width="80px" />
                            &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btncancel_Click" Text="Cancel" Width="80px" />
                        </td>
                    </tr>


                </table>

            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


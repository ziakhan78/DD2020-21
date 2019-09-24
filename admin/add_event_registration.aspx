<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_event_registration.aspx.cs" Inherits="admin_add_event_registration" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="3" class="header_title" align="center">Add Event Registration Form</td>
                </tr>

                <tr>
                    <td align="right" class="style6" valign="top">&nbsp;</td>
                    <td class="style2" valign="top">&nbsp;</td>
                    <td class="style2" align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
                <tr>
                    <td align="left" valign="top" colspan="3" class="header_subtitle">Event Details</td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1"><span class="auto-style1">*</span> </span>Event Title</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEventTitle" runat="server" Width="600px" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVtitle" runat="server"
                            ControlToValidate="txtEventTitle" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>





                <tr>
                    <td align="right" valign="top">
                        <span class="style1"><span class="auto-style1">*</span> </span>Event Date</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <telerik:RadDatePicker ID="event_date" runat="server" CssClass="txt" Culture="(Default)">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RFVSdate" runat="server"
                            ControlToValidate="event_date" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;</span>Event Time</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:DropDownList ID="DDLeh" runat="server" CssClass="txt"></asp:DropDownList>
                        <asp:DropDownList ID="DDLem" runat="server" CssClass="txt"></asp:DropDownList>
                        <asp:DropDownList ID="DDLeampm" runat="server" CssClass="txt">
                            <asp:ListItem Value="AM">AM</asp:ListItem>
                            <asp:ListItem Value="PM">PM</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>



                <tr>
                    <td align="right" valign="top">
                        <span class="style1"><span class="auto-style1">* </span></span>Veneue</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtVenu" runat="server" Width="600px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVvenue" runat="server"
                            ControlToValidate="txtVenu" Display="Dynamic" ErrorMessage="Can't left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>



                <tr>
                    <td align="right" valign="top">&nbsp;</td>
                    <td class="style3" valign="top">&nbsp;</td>
                    <td class="style5">
                        <asp:TextBox ID="txtVenu2" runat="server" CssClass="txt" TextMode="SingleLine" Width="600px"></asp:TextBox>
                    </td>
                </tr>



                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Lead Host Club</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" AutoPostBack="True" CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" DataValueField="id">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

               <%-- <tr>
                    <td align="right" valign="top">Orgnized By</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtOrgnizedBy" runat="server" Width="250px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>--%>

                <tr>
                    <td align="right" valign="top">
                        Registration Charges</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <telerik:RadNumericTextBox ID="txtEventCharge" runat="server" Culture="(Default)" DbValueFactor="1" LabelWidth="64px" MaxLength="5" Width="60px" CssClass="txt">
                            <NumberFormat ZeroPattern="n" />
                        </telerik:RadNumericTextBox>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1"><span class="auto-style1">*</span> </span>Event Closing Date</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <telerik:RadDatePicker ID="event_closing_date" runat="server" CssClass="txt" Culture="(Default)">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="event_closing_date" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;</span>Event Closing Time</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:DropDownList ID="DDLch" runat="server" CssClass="txt"></asp:DropDownList>
                        <asp:DropDownList ID="DDLcm" runat="server" CssClass="txt"></asp:DropDownList>
                        <asp:DropDownList ID="DDLcampm" runat="server" CssClass="txt">
                            <asp:ListItem Value="AM">AM</asp:ListItem>
                            <asp:ListItem Value="PM">PM</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>




                <tr>
                    <td align="left" valign="top" colspan="3" class="header_subtitle">Payment Details  </td>
                </tr>



                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Cheque to be Drawn on</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <asp:TextBox ID="txtDrawnOn" runat="server" Width="600px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVMobile0" runat="server" ControlToValidate="txtDrawnOn" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="C"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;</span>Cheque to be Send to</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <asp:TextBox ID="txtChequeRece" runat="server" Width="250px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Address Line 1</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <asp:TextBox ID="txtAdd" runat="server" Width="600px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVMobile2" runat="server" ControlToValidate="txtAdd" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="C"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">Address Line 2</td>
                    <td class="style3" valign="top">&nbsp;</td>
                    <td class="style5">
                        <asp:TextBox ID="txtAdd2" runat="server" CssClass="txt" TextMode="SingleLine" Width="600px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
                        Mobile No.</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <asp:TextBox ID="txtMobCC" runat="server" CssClass="txt" Width="30px">+91</asp:TextBox>
                        <span>-</span>&nbsp;<asp:TextBox ID="txtMobile" runat="server" CssClass="txt" MaxLength="10" Width="100px"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                  <tr>
              <td  ><div align="right">Phone 1</div></td>
              <td ><div align="center">:</div></td>
              <td><div align="left">
                  <asp:TextBox ID="txtPhCC1" runat="server" Width="25px" CssClass="txt" 
                      MaxLength="3">+91</asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtPhAC1" runat="server" Width="25px" CssClass="txt" 
                      MaxLength="4"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtPhone1" runat="server" Width="113px" CssClass="txt" 
                      MaxLength="10"></asp:TextBox>
              </div></td>
            </tr>
                  <tr>
              <td  ><div align="right">Phone 2</div></td>
              <td ><div align="center">:</div></td>
              <td><div align="left">
                  <asp:TextBox ID="txtPhCC2" runat="server" Width="25px" CssClass="txt" 
                      MaxLength="3">+91</asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtPhAC2" runat="server" Width="25px" CssClass="txt" 
                      MaxLength="4"></asp:TextBox><span >&nbsp;-</span>
                  <asp:TextBox ID="txtPhone2" runat="server" Width="113px" CssClass="txt" 
                      MaxLength="10"></asp:TextBox>
              </div></td>
            </tr>


                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Email-Id</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">

                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RFEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="C"></asp:RegularExpressionValidator>

                    </td>
                </tr>



                <tr>
                    <td align="left" valign="top" colspan="3" class="header_subtitle">Registration Mail Details  </td>
                </tr>

                 <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Email Subject</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEmailSubject" runat="server" Width="400px" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVEmailSubject" runat="server" ControlToValidate="txtEmailSubject" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                     </td>
                </tr>

             
                <tr>
                    <td align="right" valign="top">
                        <span class="style1">&nbsp;<span class="auto-style1">* </span></span>Email To</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEmailTo" runat="server" Width="400px" CssClass="txt"></asp:TextBox> &nbsp;<asp:Button ID="btnAddmoreTo" runat="server" CssClass="btn" 
                          Text="Add More..." 
                          Width="85px" onclick="btnAddmoreTo_Click" />
                        &nbsp;<asp:RequiredFieldValidator ID="RFVEmailto2" runat="server" ControlToValidate="txtEmailTo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REEmailTo" runat="server" ControlToValidate="txtEmailTo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="C"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                 <tr id="TRto" runat="server" valign="top">
                 <td class="style1">
                     &nbsp;</td>
                 <td align="center" valign="top">
                     &nbsp;</td>
                 <td valign="middle">
                     <asp:ListBox ID="listemailTo" runat="server" Height="100px" Width="410px" 
                         CssClass="txt">
                     </asp:ListBox>
                     <asp:Button ID="btnRemoveTo" runat="server" CssClass="btn" 
                         onclick="btnRemoveTo_Click" Text="Remove"  Width="85px" />
                 </td>
         </tr>

                <tr>
                    <td align="right" valign="top">
                        Email CC</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEmailCC" runat="server" Width="400px" CssClass="txt"></asp:TextBox> &nbsp;<asp:Button ID="btnAddmoreCC" runat="server" CssClass="btn" 
                          Text="Add More..." 
                          Width="85px" onclick="btnAddmoreCC_Click" />
                        &nbsp;<asp:RegularExpressionValidator ID="REEmailCC" runat="server" ControlToValidate="txtEmailCC" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="C"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                 <tr id="TRCC" runat="server" valign="top">
                 <td class="style1">
                     &nbsp;</td>
                 <td align="center" valign="top">
                     &nbsp;</td>
                 <td valign="middle">
                     <asp:ListBox ID="listemailCC" runat="server" Height="100px" Width="410px" 
                         CssClass="txt">
                     </asp:ListBox>
                     <asp:Button ID="btnRemoveCC" runat="server" CssClass="btn" 
                         onclick="btnRemoveCC_Click" Text="Remove"  Width="85px" />
                 </td>
         </tr>


                  <tr>
                    <td align="right" valign="top">
                        Email BCC</td>
                    <td valign="top" class="style3">:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEmailBCC" runat="server" Width="400px" CssClass="txt"></asp:TextBox> &nbsp;<asp:RegularExpressionValidator ID="REEmailBCC" runat="server" ControlToValidate="txtEmailBCC" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="C"></asp:RegularExpressionValidator>
                      </td>
                </tr>

                




                <tr>
                    <td class="style6">&nbsp;</td>
                    <td class="style9">&nbsp;</td>
                    <td class="style17">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset" OnClick="btnCancel_Click" />
                        <asp:SqlDataSource ID="DSDistClubNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


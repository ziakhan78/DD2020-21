<%@ Page Language="C#" MasterPageFile="../masterpages/AdminM.master" AutoEventWireup="true" CodeFile="Add_where_district_clubs_meet.aspx.cs" Inherits="Admin_Add_where_district_clubs_meet" Title="" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
        .style4 {
            color: #FF0000;
        }

        .style5 {
            text-align: left;
        }

        .style7 {
            text-align: right;
        }

        p.MsoNormal {
            margin-bottom: .0001pt;
            font-size: 11.0pt;
            font-family: "Calibri","sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
                <tr>

                    <td colspan="3" class="header_title">Add District Rotary Clubs</td>
                </tr>



                <tr>
                    <td valign="top" class="style7" width="140">&nbsp;</td>
                    <td width="5" valign="top" class="style5">&nbsp;</td>
                    <td align="right" valign="top">
                        <span class="style4">* </span>Denote Madatory Field.</td>
                </tr>


                <tr id="TRSpeaker" runat="server">
                    <td class="style7"><span class="style4">* </span>Name of Club</td>
                    <td class="style5">:</td>
                    <td>

                        <div align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="450px" CssClass="txt1"
                                MaxLength="300">Rotary Club of </asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Can't left blank"
                                ValidationGroup="Clubs" CssClass="txt_validation"
                                InitialValue="Rotary Club of"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server"
                                ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="* Already Exists."
                                 ValidationGroup="Clubs"></asp:CustomValidator>
                        </div>
                    </td>
                </tr>

                <tr id="TR11" runat="server">
                    <td class="style7"><span class="style4">&nbsp;</span>RI Club No.</td>
                    <td class="style5">:</td>
                    <td>

                        <div align="left">
                            <telerik:RadNumericTextBox ID="txtClubNo" runat="server" CssClass="txt"
                                DataType="System.Int32" MaxLength="5" Width="60px">
                                <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" />
                            </telerik:RadNumericTextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="style7">
                        <div align="right">Charter Date</div>
                    </td>
                    <td class="style5">:</td>
                    <td align="left" valign="middle">
                        <div align="left">
                            <asp:DropDownList ID="DDLDays" runat="server" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="DDLMonth" runat="server" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="DDLYear" runat="server" CssClass="txt">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>



                <tr>
                    <td class="style7"><span class="style4">* </span>Meeting Day</td>
                    <td class="style5">:</td>
                    <td>

                        <div align="left">
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
                            &nbsp;<asp:RequiredFieldValidator ID="RFVday" runat="server"
                                ControlToValidate="DDLDay" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Can't left blank" InitialValue="Day" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7"><span class="style4">* </span>
                        Meeting Time</td>
                    <td valign="top" class="style5">:</td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DDLTimeH" runat="server" CssClass="txt">
                        </asp:DropDownList>
                        -
                        <asp:DropDownList ID="DDLTimeM" runat="server" CssClass="txt">
                        </asp:DropDownList>
                        -
                        <asp:DropDownList ID="DDLTime2" runat="server" CssClass="txt">
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDLTimeH"
                            Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="Clubs"
                            CssClass="txt_validation"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDLTimeM"
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDLTime2"
                            Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="Clubs"
                            CssClass="txt_validation"></asp:RequiredFieldValidator></td>
                </tr>








                <tr id="TRTopics" runat="server">
                    <td valign="top" class="style7"><span class="style4">* </span>Meeting Venue</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtVenue1" runat="server" Width="450px" CssClass="txt1"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtVenue1" Display="Dynamic" ErrorMessage="Can't left blank"
                                ValidationGroup="Clubs" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7"></td>
                    <td valign="top" class="style5">&nbsp;</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtVenue2" runat="server" Width="450px" CssClass="txt1"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">Landmark</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtLandmark" runat="server" Width="450px" CssClass="txt1"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">City</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtCity" runat="server" Width="200px" CssClass="txt1"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">Pin</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtPin" runat="server" Width="100px" CssClass="txt1"
                                MaxLength="8"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVPin" runat="server"
                                ControlToValidate="txtPin" Display="Dynamic"
                                ErrorMessage="Pin code should be numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                                ValidationGroup="Clubs" CssClass="txt_validation"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">State</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtState" runat="server" Width="200px" CssClass="txt1">Maharashtra</asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">Country</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:TextBox ID="txtCountry" runat="server" Width="200px" CssClass="txt1">India</asp:TextBox>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td valign="top" class="style7">GPS Coordinates</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            Latitude:
                            <asp:TextBox ID="txtLatitude" runat="server" Width="100px"
                                CssClass="txt1"></asp:TextBox>
                            Longitude:
                            <asp:TextBox ID="txtLongitude" runat="server" Width="100px"
                                CssClass="txt1"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="style7">Website - 1</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <asp:TextBox ID="txtWebsite" runat="server" CssClass="txt1" MaxLength="50"
                            Width="400px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtWebsite" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Invalid Website"
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                            ValidationGroup="Clubs"></asp:RegularExpressionValidator>
                        Ex- http://www.rotarydist3140.com</td>
                </tr>

                <tr>
                    <td valign="top" class="style7">Website - 2</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <asp:TextBox ID="txtAltWebsite" runat="server" CssClass="txt1" MaxLength="50"
                            Width="450px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="txtAltWebsite" CssClass="txt_validation"
                            ErrorMessage="Invalid Website"
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                            ValidationGroup="Clubs"></asp:RegularExpressionValidator>
                    </td>
                </tr>




                <tr>
                    <td valign="top" class="style7">Upload Logo</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:FileUpload ID="FileUpload2" runat="server" Width="457px" />
                        </div>
                    </td>
                </tr>



                <tr>
                    <td valign="top" class="style7">Upload Location Map</td>
                    <td valign="top" class="style5">:</td>
                    <td valign="top">
                        <div align="left">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="457px" />
                        </div>
                    </td>
                </tr>


                <%--    
             <tr>
              <td valign="top" class="style7">District Secretary</td>
              <td valign="top" class="style5">:</td>
              <td valign="top" >
                  <asp:DropDownList ID="DDLMem" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td valign="top" width="500px" align="left">
                  Will be picked up from District Members.</td>
            </tr>             
             <tr>
              <td valign="top" class="style7">GC</td>
              <td valign="top" class="style5">:</td>
              <td valign="top">
                  <asp:DropDownList ID="DDLMem0" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td valign="top"> (Group Coordinator) Will be picked up from District Members.</td>
            </tr> 
             <tr>
              <td valign="top" class="style7">AG</td>
              <td valign="top" class="style5">:</td>
              <td valign="top">
                  <asp:DropDownList ID="DDLMem1" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td valign="top"> (Assistance Governor) Will be picked up from District Members.</td>
            </tr>
                --%>


                <tr>
                    <td class="style7" valign="top">&nbsp;</td>
                    <td class="style5" valign="top">&nbsp;</td>
                    <td valign="top">
                        <div align="left"
                            style="color: Maroon; border-color: #808080; border: solid thin; width: 450px;">
                            &nbsp; Image should be a .jpg / .jpeg and not more than 300 KB.
                        </div>
                    </td>
                </tr>



                <tr>
                    <td class="style7"></td>
                    <td class="style5"></td>
                    <td>
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                                CssClass="btn"
                                ValidationGroup="Clubs" />
                            &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                                CssClass="btn" CausesValidation="False" />
                            <asp:SqlDataSource ID="DSRotarctClub" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM [rotaract_club_tbl] order by club_name"></asp:SqlDataSource>
                        </div>
                    </td>
                </tr>


            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>


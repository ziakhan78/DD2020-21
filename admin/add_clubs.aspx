<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_clubs.aspx.cs" Inherits="admin_add_clubs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }

        .auto-style2 {
            text-align: right;
        }

        .style7 {
            text-align: right;
            width: 170px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td colspan="2" class="header_title">Add Clubs</td>
                    </tr>

                    <tr>
                        <td class="style7" width="140">&nbsp;</td>
                        <td align="right"><span class="auto-style1">* </span>Denote Madatory Field.</td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right"><span class="auto-style1">*</span>District No.: </div>
                        </td>
                        <td align="left" valign="top">
                            <%--<asp:RadioButtonList ID="rbtnDistNo" runat="server"
                            RepeatDirection="Horizontal" AutoPostBack="True">
                            <asp:ListItem Selected="True" Text="3141" Value="3141"></asp:ListItem>
                            <asp:ListItem Text="3142" Value="3142"></asp:ListItem>
                        </asp:RadioButtonList>--%>
                            <asp:DropDownList ID="ddlDistNo" runat="server" DataSourceID="dsDistNo" DataTextField="district_no" DataValueField="id" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDistNo" runat="server" ControlToValidate="ddlDistNo" CssClass="txt_validation" InitialValue="Select" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr id="TRSpeaker" runat="server">
                        <td class="auto-style2"><span class="auto-style1">*</span>Rotary Club of: </td>
                        <td>

                            <div align="left">
                                <asp:TextBox ID="txtTitle" runat="server" Width="450px" CssClass="txtBox"
                                    MaxLength="300"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Can't be left blank!"
                                    ValidationGroup="Clubs" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server"
                                    ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic"
                                    ErrorMessage="* Already Exists."
                                    ValidationGroup="Clubs" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </div>
                        </td>
                    </tr>





                    <tr id="TR11" runat="server">
                        <td class="auto-style2"><span class="style4">&nbsp;<span class="auto-style1">*</span></span>RI Club No.: </td>
                        <td>
                            <div align="left">
                                <telerik:RadNumericTextBox ID="txtClubNo" runat="server" CssClass="txtBox" MaxLength="8" Skin="Silk" Width="80px">
                                    <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="rfvClubNo" runat="server" ControlToValidate="txtClubNo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>


                     <tr>
                        <td class="auto-style2">Sponsored By: </td>
                        <td>
                            <div align="left">
                                 <asp:DropDownList ID="DDLClubName" runat="server" CssClass="txtBox" AppendDataBoundItems="True"
                                AutoPostBack="True" DataSourceID="dsClubName" DataTextField="club_name" DataValueField="id" >
                                <asp:ListItem Text="Select"></asp:ListItem>
                            </asp:DropDownList>
                            </div>
                             <asp:SqlDataSource ID="dsClubName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                       
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style2">
                            <div align="right"><span class="auto-style1">*</span>Charter Date: </div>
                        </td>
                        <td align="left" valign="middle">
                            <div align="left">
                                <telerik:RadDateInput ID="charterDate" runat="server" DateFormat="dd-MM-yyyy" Width="100px" EmptyMessage="dd-mm-yyyy" CssClass="txtBox" Skin="Silk" MinDate="01-01-1900"></telerik:RadDateInput>
                                <asp:RequiredFieldValidator
                                    ID="rfvCharterDate" runat="server" ControlToValidate="charterDate"
                                    Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="Clubs"
                                    CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style2"><span class="auto-style1">*</span>Meeting Day: </td>
                        <td>

                            <div align="left">
                                <asp:DropDownList ID="DDLDay" runat="server" CssClass="txtBox">
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
                                    ErrorMessage="Can't be left blank!" InitialValue="Day" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2"><span class="auto-style1">*</span>Meeting Time: </td>
                        <td>
                            <telerik:RadDateInput ID="meetingTime" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="hh:mm"></telerik:RadDateInput>

                            &nbsp;<asp:RequiredFieldValidator
                                ID="rfvMeetingTime" runat="server" ControlToValidate="meetingTime"
                                Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="Clubs"
                                CssClass="txt_validation"></asp:RequiredFieldValidator></td>
                    </tr>


                    <tr id="TRTopics" runat="server">
                        <td class="auto-style2"><span class="auto-style1">*</span>Meeting Venue: </td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtVenue1" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtVenue1" Display="Dynamic" ErrorMessage="Can't be left blank!"
                                    ValidationGroup="Clubs" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2"></td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtVenue2" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Landmark: </td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtLandmark" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2"><span class="auto-style1">*</span>City: </td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtCity" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="Clubs"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Pin: </td>
                        <td>
                            <div align="left">
                                <telerik:RadNumericTextBox ID="txtPin" runat="server" CssClass="txtBox" MaxLength="6" Skin="Silk" Width="100px">
                                    <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                                </telerik:RadNumericTextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">State: </td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtState" runat="server" Width="200px" CssClass="txtBox">Maharashtra</asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Country: </td>
                        <td>
                            <div align="left">
                                <asp:TextBox ID="txtCountry" runat="server" Width="200px" CssClass="txtBox">India</asp:TextBox>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td class="auto-style2">GPS Coordinates: </td>
                        <td>
                            <div align="left">
                                Latitude:
                            <asp:TextBox ID="txtLatitude" runat="server" Width="100px"
                                CssClass="txtBox"></asp:TextBox>
                                Longitude:
                            <asp:TextBox ID="txtLongitude" runat="server" Width="100px"
                                CssClass="txtBox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Website: </td>
                        <td>
                            <asp:TextBox ID="txtWebsite" runat="server" CssClass="txtBox" MaxLength="50"
                                Width="450px"></asp:TextBox>
                            Ex- http://www.rotarydist3140.com</td>
                    </tr>



                    <tr>
                        <td class="auto-style2">Facebook Link: </td>
                        <td>
                            <asp:TextBox ID="txtFacebookLink" runat="server" CssClass="txtBox" MaxLength="50"
                                Width="450px"></asp:TextBox>
                        </td>
                    </tr>




                    <tr>
                        <td class="auto-style2" valign="top">Upload Logo: </td>
                        <td>
                            <div align="left">
                                <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="60" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                                </telerik:RadAsyncUpload>
                                <br />
                                <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and 
                  maximum file size is 400 KB )</strong><br />
                                    <br />
                                    <asp:Image ID="imgLogo" runat="server" AlternateText="Logo"
                                        Height="110px" Width="100px" />
                                </span>
                            </div>
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style2" valign="top">Upload Location Map: </td>
                        <td>
                            <div align="left">
                                <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="60" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload2_FileUploaded">
                                </telerik:RadAsyncUpload>
                                <br />
                                <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and 
                  maximum file size is 400 KB )</strong><br />
                                    <br />
                                    <asp:Image ID="imgMap" runat="server" AlternateText="Map"
                                        Height="110px" Width="100px" />
                                </span>
                            </div>
                        </td>
                    </tr>





                    <%--    
             <tr>
              <td  class="style7">District Secretary</td>
              <td  class="style5">:</td>
              <td  >
                  <asp:DropDownList ID="DDLMem" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td  width="500px" align="left">
                  Will be picked up from District Members.</td>
            </tr>             
             <tr>
              <td  class="style7">GC</td>
              <td  class="style5">:</td>
              <td >
                  <asp:DropDownList ID="DDLMem0" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td > (Group Coordinator) Will be picked up from District Members.</td>
            </tr> 
             <tr>
              <td  class="style7">AG</td>
              <td  class="style5">:</td>
              <td >
                  <asp:DropDownList ID="DDLMem1" runat="server">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td > (Assistance Governor) Will be picked up from District Members.</td>
            </tr>
                    --%>











                    <tr>
                        <td colspan="2" class="header_subtitle">Parteners in Service</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <div align="right">Inner Wheel: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnIW" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnIW_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>

                        </td>
                    </tr>


                    <tr id="trIW" runat="server">
                        <td class="style7">
                            <div align="right"></div>
                        </td>

                        <td align="left" valign="middle">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" Width="60%"
                                DataKeyNames="iw_id">
                                <Columns>
                                    <asp:BoundField DataField="club_name" HeaderText="Club Name" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="50" HeaderText="Action" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                </Columns>
                                <HeaderStyle Font-Bold="true" />
                            </asp:GridView>
                            <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse;" width="60%" class="innertable">
                                <tr>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtIwClubname" runat="server" Width="413" MaxLength="60" CssClass="txtBox" placeholder="Enter club name" />
                                        <asp:RequiredFieldValidator ID="rfvCname" runat="server" ControlToValidate="txtIwClubname" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="iw"></asp:RequiredFieldValidator>
                                    </td>

                                    <td style="width: 100px">
                                        <br />
                                        <asp:Button ID="btnAddIw" runat="server" Text="Add" OnClick="Insert" CssClass="btn" ValidationGroup="iw" />
                                    </td>
                                </tr>
                            </table>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM distclub_iw_tbl where club_id=@club_id" InsertCommand="INSERT INTO distclub_iw_tbl VALUES (@club_id, 0, @club_name)"
                                UpdateCommand="UPDATE distclub_iw_tbl SET club_name = @club_name WHERE iw_id = @iw_id"
                                DeleteCommand="DELETE FROM distclub_iw_tbl WHERE iw_id = @iw_id">
                                <InsertParameters>
                                    <asp:ControlParameter Name="club_name" ControlID="txtIwClubname" Type="String" />
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="iw_id" Type="Int32" />
                                    <asp:Parameter Name="club_name" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="iw_id" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </td>
                    </tr>


                    <tr>
                        <td class="style7">
                            <div align="right">Rotary Community Corps: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnRCC" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnRCC_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Selected="True" Text="No" Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr id="trRCC" runat="server">
                        <td class="style7">
                            <div align="right"></div>
                        </td>

                        <td align="left" valign="middle">
                              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource2" Width="60%"
                                DataKeyNames="rcc_id">
                                <Columns>
                                     <asp:BoundField DataField="club_name" HeaderText="Club Name" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="50" HeaderText="Action" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                            </Columns>
                                <HeaderStyle Font-Bold="true" />
                            </asp:GridView>
                            <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse;" width="60%" class="innertable">
                                <tr>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtRccClubname" runat="server" Width="413" MaxLength="60" CssClass="txtBox" placeholder="Enter club name" />
                                        <asp:RequiredFieldValidator ID="rfvRcc" runat="server" ControlToValidate="txtRccClubname" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="rcc"></asp:RequiredFieldValidator>
                                    </td>

                                    <td style="width: 100px">
                                        <br />
                                        <asp:Button ID="btnAddRcc" runat="server" Text="Add" CssClass="btn" ValidationGroup="rcc" OnClick="btnAddRcc_Click" />
                                    </td>
                                </tr>
                            </table>

                             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM distclub_rcc_tbl where club_id=@club_id" InsertCommand="INSERT INTO distclub_rcc_tbl VALUES (@club_id, 0, @club_name)"
                                UpdateCommand="UPDATE distclub_rcc_tbl SET club_name = @club_name WHERE rcc_id = @rcc_id"
                                DeleteCommand="DELETE FROM distclub_rcc_tbl WHERE rcc_id = @rcc_id">
                                <InsertParameters>
                                    <asp:ControlParameter Name="club_name" ControlID="txtRccClubname" Type="String" />
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="rcc_id" Type="Int32" />
                                    <asp:Parameter Name="club_name" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="rcc_id" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">Sr. Citizen&#39;s Club: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnSrCi" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnSrCi_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Selected="True" Text="No" Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr id="trSrCi" runat="server">
                        <td class="style7">
                            <div align="right"></div>
                        </td>

                        <td align="left" valign="middle">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource3" Width="60%"
                                DataKeyNames="ctn_id">
                                <Columns>
                                    <asp:BoundField DataField="club_name" HeaderText="Club Name" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="50" HeaderText="Action" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                </Columns>
                                <HeaderStyle Font-Bold="true" />
                            </asp:GridView>
                            <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse;" width="60%" class="innertable">
                                <tr>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtCtnClubname" runat="server" Width="413" MaxLength="60" CssClass="txtBox" placeholder="Enter club name" />
                                        <asp:RequiredFieldValidator ID="rfvCtn" runat="server" ControlToValidate="txtCtnClubname" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="ctn"></asp:RequiredFieldValidator>
                                    </td>

                                    <td style="width: 100px">
                                        <br />
                                        <asp:Button ID="btnAddCtn" runat="server" Text="Add" CssClass="btn" ValidationGroup="ctn" OnClick="btnAddCtn_Click" />
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM distclub_sr_citizen_tbl where club_id=@club_id" InsertCommand="INSERT INTO distclub_sr_citizen_tbl VALUES (@club_id, 0, @club_name)"
                                UpdateCommand="UPDATE distclub_sr_citizen_tbl SET club_name = @club_name WHERE ctn_id = @ctn_id"
                                DeleteCommand="DELETE FROM distclub_sr_citizen_tbl WHERE ctn_id = @ctn_id">
                                <InsertParameters>
                                    <asp:ControlParameter Name="club_name" ControlID="txtCtnClubname" Type="String" />
                                     <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ctn_id" Type="Int32" />
                                    <asp:Parameter Name="club_name" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="ctn_id" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                           

                        </td>
                    </tr>



                    <tr>
                        <td class="style7">
                            <div align="right">Rotaract Club: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnRotaract" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnRotaract_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Selected="True" Text="No" Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr id="trRtr" runat="server">
                        <td class="style7">
                            <div align="right"></div>
                        </td>

                        <td align="left" valign="middle">
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource4" Width="60%"
                                DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="club_name" HeaderText="Club Name" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="50" HeaderText="Action" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                </Columns>
                                <HeaderStyle Font-Bold="true" />
                            </asp:GridView>
                            <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse;" width="60%" class="innertable">
                                <tr>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtRtrClub" runat="server" Width="413" MaxLength="60" CssClass="txtBox" placeholder="Enter club name" />
                                        <asp:RequiredFieldValidator ID="rfvRtrClub" runat="server" ControlToValidate="txtRtrClub" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="rtr"></asp:RequiredFieldValidator>
                                    </td>

                                    <td style="width: 100px">
                                        <br />
                                        <asp:Button ID="btnAddRtr" runat="server" Text="Add" CssClass="btn" ValidationGroup="rtr" OnClick="btnAddRtr_Click" />
                                    </td>
                                </tr>
                            </table>

                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM distclub_rotaract_tbl where club_id=@club_id" InsertCommand="INSERT INTO distclub_rotaract_tbl VALUES (@club_id, 0, @club_name)"
                                UpdateCommand="UPDATE distclub_rotaract_tbl SET club_name = @club_name WHERE id = @id"
                                DeleteCommand="DELETE FROM distclub_rotaract_tbl WHERE id = @id">
                                <InsertParameters>
                                    <asp:ControlParameter Name="club_name" ControlID="txtRtrClub" Type="String" />
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                    <asp:Parameter Name="club_name" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </td>
                    </tr>


                    <tr>
                        <td class="style7">
                            <div align="right">Interact Club: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnInteract" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnInteract_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Selected="True" Text="No" Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr id="trIntr" runat="server">
                        <td class="style7">
                            <div align="right"></div>
                        </td>

                        <td align="left" valign="middle">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource5" Width="60%"
                                DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="club_name" HeaderText="Club Name" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="50" HeaderText="Action" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                </Columns>
                                <HeaderStyle Font-Bold="true" />
                            </asp:GridView>
                            <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse;" width="60%" class="innertable">
                                <tr>
                                    <td align="left">
                                        <br />
                                        <asp:TextBox ID="txtIntrClub" runat="server" Width="413" MaxLength="60" CssClass="txtBox" placeholder="Enter club name" />
                                        <asp:RequiredFieldValidator ID="rfvIntrClub" runat="server" ControlToValidate="txtIntrClub" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="intr"></asp:RequiredFieldValidator>
                                    </td>

                                    <td style="width: 100px">
                                        <br />
                                        <asp:Button ID="btnAddIntr" runat="server" Text="Add" CssClass="btn" ValidationGroup="intr" OnClick="btnAddIntr_Click" />
                                    </td>
                                </tr>
                            </table>

                           <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM distclub_interact_tbl where club_id=@club_id" InsertCommand="INSERT INTO distclub_interact_tbl VALUES (@club_id, 0, @club_name)"
                                UpdateCommand="UPDATE distclub_interact_tbl SET club_name = @club_name WHERE id = @id"
                                DeleteCommand="DELETE FROM distclub_interact_tbl WHERE id = @id">
                                <InsertParameters>
                                    <asp:ControlParameter Name="club_name" ControlID="txtIntrClub" Type="String" />
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                    <asp:Parameter Name="club_name" Type="String" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="id" Name="club_id" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </td>
                    </tr>





                    <tr>
                        <td colspan="2" class="header_subtitle">Club Data</td>
                    </tr>




                    <tr>
                        <td class="style7">
                            <div align="right">PHF: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadNumericTextBox ID="txtPHF" runat="server" MaxLength="3" Width="60px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">TRFSM: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadNumericTextBox ID="txtTRFSM" runat="server" MaxLength="3" Width="60px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">MD: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadNumericTextBox ID="txtMD" runat="server" MaxLength="3" Width="60px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">PHSM: </div>
                        </td>
                        <td align="left" valign="middle">

                            <telerik:RadNumericTextBox ID="txtPHSM" runat="server" MaxLength="3" Width="60px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">Arch Klump: </div>
                        </td>
                        <td align="left" valign="middle">

                            <telerik:RadNumericTextBox ID="txtArchKlump" runat="server" MaxLength="3" Width="60px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div align="right">Benefactors: </div>
                        </td>
                        <td align="left" valign="middle">


                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rbtnBEN" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnBEN_SelectedIndexChanged">
                                            <asp:ListItem Text="Yes" Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Text="No" Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr id="trBEN" runat="server">
                        <td colspan="2">

                            <table width="100%">
                                <tr>
                                    <td width="140px" class="style7">Member&#39;s Name: </td>
                                    <td width="655px" align="left">
                                        <asp:DropDownList ID="DDLMemBen" runat="server"
                                            AppendDataBoundItems="true" CssClass="txtBox">
                                            <asp:ListItem>Select</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;<asp:Button ID="btnAddBen" runat="server" Text="Add" Width="60px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="140px" class="style7">&nbsp;</td>
                                    <td width="5px">&nbsp;</td>
                                    <td width="655px" align="left">&nbsp;</td>
                                </tr>
                            </table>

                        </td>
                    </tr>




                    <tr>
                        <td class="auto-style2">District Secretary: </td>
                        <td>
                            <asp:DropDownList ID="DDLMem1" runat="server" AppendDataBoundItems="true"
                                CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;Will be picked up from District Members.</td>
                    </tr>



                    <tr>
                        <td class="auto-style2">Assistant Governor: </td>
                        <td>
                            <asp:DropDownList ID="DDLMem2" runat="server" AppendDataBoundItems="true"
                                CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;Will be picked up from District Members.</td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Assistant Trainer: </td>
                        <td>
                            <asp:DropDownList ID="DDLMem3" runat="server" AppendDataBoundItems="true"
                                CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;Will be picked up from District Members.</td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Group Coordinator: </td>
                        <td>
                            <asp:DropDownList ID="DDLMem4" runat="server" AppendDataBoundItems="true"
                                CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;Will be picked up from District Members.</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="header_subtitle">Installation</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <div align="right">Installation Date: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadDateInput ID="installationDate" runat="server" DateFormat="dd-MM-yyyy" Width="100px" EmptyMessage="dd-mm-yyyy" CssClass="txtBox" Skin="Silk"></telerik:RadDateInput>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">Installation Time: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnTime" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Morning</asp:ListItem>
                                <asp:ListItem Value="1">Afternoon</asp:ListItem>
                                <asp:ListItem Value="2">Evening</asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<telerik:RadDateInput ID="installationTime" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="hh:mm"></telerik:RadDateInput>   --%>                                                            
                                                              
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <div align="right">Chief Guest: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox ID="txtChiefGuest" runat="server" Width="300px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">Venue: </div>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox ID="txtInstallationVenue" runat="server" Width="600px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="header_subtitle">OCV</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <div align="right">OCV Date: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadDateInput ID="ocvDate" runat="server" DateFormat="dd-MM-yyyy" Width="100px" EmptyMessage="dd-mm-yyyy" CssClass="txtBox" Skin="Silk"></telerik:RadDateInput>
                        </td>
                    </tr>

                    <tr>
                        <td class="style7">
                            <div align="right">OCV Time: </div>
                        </td>
                        <td align="left" valign="middle">
                            <telerik:RadDateInput ID="ocvTime" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="hh:mm"></telerik:RadDateInput>

                        </td>
                    </tr>


                    <tr>
                        <td colspan="2" class="header_subtitle">Club TRF Status</td>
                    </tr>

                    <tr>
                        <td class="style7">&nbsp;</td>
                        <td align="left" valign="middle">
                            <asp:RadioButtonList ID="rbtnClubTrfStatus" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="N/A" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="100% PHFSM Club" Value="1"></asp:ListItem>
                                <asp:ListItem Text="100% PHF Club" Value="2"></asp:ListItem>
                                <asp:ListItem Text="100% EREY Club" Value="3"></asp:ListItem>
                                <asp:ListItem Text="100% MD Club" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                      <tr>
                        <td colspan="2" class="header_subtitle">Flagship Project</td>
                    </tr>

                    
                    <tr>
                        <td class="style7" style="vertical-align:top;">
                            <div align="right" >Flagship Project: </div>
                        </td>
                        <td align="left" valign="middle">
                             <asp:TextBox ID="txtFlagshipProject" runat="server" Width="99%" TextMode="MultiLine" MaxLength="500"
                                Height="100px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>


                       <tr>
                        <td class="auto-style2" valign="top">Upload Flagship Project: </td>
                        <td>
                            <div align="left">
                                <telerik:RadAsyncUpload ID="RadAsyncUpload3" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="60" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload3_FileUploaded">
                                </telerik:RadAsyncUpload>
                                <br />
                                <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and 
                  maximum file size is 400 KB )</strong><br />
                                    <br />
                                    <asp:Image ID="imgFlagship" runat="server" AlternateText="Flagship"
                                        Height="110px" Width="100px" />
                                </span>
                            </div>
                        </td>
                    </tr>

                   



                    <tr>
                        <td class="style7"></td>
                        <td>
                            <div align="left">
                                <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                                    CssClass="btn"
                                    ValidationGroup="Clubs" OnClick="btnSubmit_Click" />
                                &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                                    CssClass="btn" CausesValidation="False" />

                                <span class="style2">
                                    <asp:SqlDataSource ID="dsDistNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [district_no_tbl] ORDER BY [district_no]"></asp:SqlDataSource>
                                </span>

                            </div>
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


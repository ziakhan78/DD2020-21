<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_speakers_directory.aspx.cs" Inherits="admin_add_speakers_directory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            text-align: right;
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
                    <td colspan="3" class="header_title">Add Speakers Directory</td>
                </tr>

                <tr>
                    <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right">Title</div>
                    </td>
                    <td class="style1" width="5">
                        <div align="center">:</div>
                    </td>

                    <td>
                        <div align="left">
                            <asp:DropDownList ID="drtitle" runat="server" CssClass="txtBox">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Mr.</asp:ListItem>
                                <asp:ListItem>Mrs.</asp:ListItem>
                                <asp:ListItem>Miss</asp:ListItem>
                                <asp:ListItem>Ms.</asp:ListItem>
                                <asp:ListItem>Dr.</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="195">
                        <div align="right"><span class="style2">*</span> First Name</div>
                    </td>
                    <td class="style1">
                        <div align="center">:</div>
                    </td>
                    <td width="600">

                        <div align="left">
                            <asp:TextBox ID="txtfname" runat="server" Width="200px"
                                CssClass="txtBox"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RFFname" runat="server"
                                ControlToValidate="txtfname" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Can't left blank" ValidationGroup="s"></asp:RequiredFieldValidator>
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
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txtmname" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
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
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txtlname" runat="server" Width="200px" CssClass="txtBox"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RFLname" runat="server"
                                ControlToValidate="txtlname" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Can't left blank" ValidationGroup="s"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="style1">
                        <div align="right">Type</div>
                    </td>
                    <td align="center">:</td>
                    <td>

                        <div align="left">
                            <asp:RadioButtonList ID="rbtnRtnType" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True"
                                OnSelectedIndexChanged="rbtnRtnType_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Rotarians</asp:ListItem>
                                <asp:ListItem>Non Rotarians</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>


                <tr id="TRClubname" runat="server">
                    <td width="200" class="style1"><span class="style2">*</span> Rotary Club of</td>
                    <td align="center">:</td>
                    <td width="680">
                        <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                            AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo"
                            DataTextField="club_name" DataValueField="id">
                            <asp:ListItem>Select Club Name</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        <div align="right">Topic Type</div>
                    </td>
                    <td align="center">:</td>
                    <td>

                        <div align="left">
                            <asp:RadioButtonList ID="rbtnTopicType" runat="server"
                                RepeatDirection="Horizontal" AutoPostBack="True">
                                <asp:ListItem Selected="True">Rotary</asp:ListItem>
                                <asp:ListItem>Non Rotary</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="style1">
                        <div align="right">Topdic(s)</div>
                    </td>
                    <td align="center">:</td>
                    <td>
                        <div align="left">
                            <asp:TextBox ID="txttopics" runat="server" Width="500px" CssClass="txtBox"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnAddmore" runat="server" CssClass="btn"
                                Text="Add More..."
                                Width="100px" OnClick="btnAddmore_Click" />
                        </div>
                    </td>
                </tr>

                <tr id="TRTopics" runat="server" valign="top">
                    <td class="style1">&nbsp;</td>
                    <td align="center" valign="top">&nbsp;</td>
                    <td valign="middle">
                        <asp:ListBox ID="listTopics" runat="server" Height="150px" Width="506px"
                            CssClass="txtBox"></asp:ListBox>
                        <asp:Button ID="btnRemove" runat="server" CssClass="btn"
                            OnClick="btnRemove_Click" Text="Remove" Width="100px" />
                    </td>
                </tr>

                <tr>
                    <td class="style1">Address</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtAdd1" runat="server" CssClass="txtBox"
                            Width="500px"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="style1">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="txtAdd2" runat="server" CssClass="txtBox" Width="500px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                    <td align="left">
                        <asp:TextBox ID="txtAdd3" runat="server" CssClass="txtBox" Width="500px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1">City</td>
                    <td align="center">:</td>
                    <td align="left">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="txtBox" Width="200px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1">Pin</td>
                    <td align="center">:</td>
                    <td align="left">
                        <asp:TextBox ID="txtPin" runat="server" CssClass="txtBox" Width="200px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style1">Phone No. (Resi.)</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtRPhCC1" runat="server" CssClass="txtBox" MaxLength="3"
                            Width="25px">+91</asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="txtRPhAC1" runat="server" CssClass="txtBox" MaxLength="4"
                            Width="25px">22</asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="txtRPh1" runat="server" CssClass="txtBox" MaxLength="10"
                            Width="108px"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="style1">Phone No. (Off.)</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtOPhCC1" runat="server" CssClass="txtBox" MaxLength="3"
                            Width="25px">+91</asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="txtOPhAC1" runat="server" CssClass="txtBox" MaxLength="4"
                            Width="25px">22</asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="txtOPh1" runat="server" CssClass="txtBox" MaxLength="10"
                            Width="108px"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        <span class="style2">*</span>
                        Mobile No.</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtmob1cc" runat="server" CssClass="txtBox" MaxLength="3"
                            Width="25px">+91</asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="txtmob1" runat="server" CssClass="txtBox" MaxLength="10"
                            Width="150px"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="rfvmobile" runat="server"
                            ControlToValidate="txtmob1" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Can't left blank" ValidationGroup="s"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td class="style1">Email-Id</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtEmailId" runat="server" CssClass="txtBox" Width="350px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmailId" CssClass="txt_validation" Display="Dynamic"
                            ErrorMessage="Invalid email-id"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="s"></asp:RegularExpressionValidator>

                    </td>
                </tr>


                <tr>
                    <td class="style1">Website</td>
                    <td align="center">:</td>
                    <td align="left">

                        <asp:TextBox ID="txtWebsite" runat="server" CssClass="txtBox" MaxLength="150"
                            Width="350px">http://www.</asp:TextBox>

                    </td>
                </tr>




                <tr>
                    <td class="style1"></td>
                    <td></td>
                    <td>
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                CssClass="btn"
                                ValidationGroup="s" Width="100px" OnClick="btnSubmit_Click" />
                            &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel"
                                CssClass="btn" CausesValidation="False"
                                Width="100px" />
                            <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False"
                                ValidationGroup="E" />
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


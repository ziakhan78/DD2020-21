<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_roll_of_honour.aspx.cs" Inherits="Admin_add_roll_of_honour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            text-align: left;
        }

        .style2 {
            color: #FF0000;
        }

        .style3 {
            text-align: right;
        }
    </style>

    <script type="text/javascript" language="javascript">

        function ChkDDLVal() {

            var cname = document.getElementById('<%=DDLClubName.ClientID%>');
            if (cname.value == 'Select') {
                alert('Please Select Club Name');
                cname.focus();
                return false;
            }

            var yr = document.getElementById('<%=DDLYear.ClientID%>');
            if (yr.value == 'Select') {
                alert('Please Select Year');
                yr.focus();
                return false;
            }

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">


                    <tr>
                        <td colspan="3" class="header_title">Add Roll of Honour
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="style3"><span class="style2">*</span> Denotes Mandatory field. </td>
                    </tr>

                    <tr>
                        <td width="170px">
                            <div align="right">
                                <span class="style2">*</span>
                                Select Club Name
                            </div>
                        </td>
                        <td width="5px">:</td>
                        <td width="625px">

                            <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                                CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name"
                                DataValueField="id" AutoPostBack="True"
                                OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td width="150px" class="style3">
                            <div align="right"><span class="style2">*</span> Year</div>
                        </td>
                        <td class="style1" width="5px">:</td>
                        <td class="style1" width="625px">

                            <asp:DropDownList ID="DDLYear" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>



                    <tr>
                        <td class="style3"><span class="style2">*</span> President</td>
                        <td class="style1">:</td>
                        <td class="style1">
                            <asp:DropDownList ID="DDLMember" runat="server" AutoPostBack="True" AppendDataBoundItems="true"
                                ValidationGroup="d" CssClass="txtBox">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                  <asp:CheckBox ID="chkIfOther" runat="server" AutoPostBack="True"
                      OnCheckedChanged="chkIfOther_CheckedChanged" Text="If other" TextAlign="Left" />
                        </td>
                    </tr>




                    <tr id="trPresi" runat="server">
                        <td class="style3">Enter President Name</td>
                        <td class="style1">:</td>
                        <td class="style1">
                            <asp:TextBox ID="txtPresidOther" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>




                    <tr>
                        <td class="style3"><span class="style2">*</span> Secretary</td>
                        <td class="style1">&nbsp;</td>
                        <td class="style1">
                            <asp:DropDownList ID="DDLMember0"
                                runat="server" AutoPostBack="True" AppendDataBoundItems="true"
                                ValidationGroup="d" CssClass="txtBox">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                  <asp:CheckBox ID="chkIfOtherSec" runat="server" AutoPostBack="True"
                      OnCheckedChanged="chkIfOtherSec_CheckedChanged" Text="If other"
                      TextAlign="Left" />
                        </td>
                    </tr>

                    <tr id="trSec" runat="server">
                        <td class="style3">Enter Secretary Name</td>
                        <td class="style1">:</td>
                        <td class="style1">
                            <asp:TextBox ID="txtOtherSec" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td class="style3">&nbsp;</td>
                        <td class="style1">&nbsp;</td>
                        <td>
                            <div align="left">
                                &nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" OnClientClick="return ChkDDLVal()"
                                    CssClass="btn"
                                    ValidationGroup="A" OnClick="btnSubmit_Click" />
                                &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                                    CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                                <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                    SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
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


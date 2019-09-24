<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_3140DG_data.aspx.cs" Inherits="admin_add_3140DG_data" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function ChkDDLVal() {

            var memName = document.getElementById('<%=DDLDGs.ClientID%>');
            if (memName.value == 'Select') {
                alert('Please Select.');
                memName.focus();
                return false;
            }


            return true;
        }
    </script>

    <style type="text/css">
        .style3 {
            text-align: right;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>

    <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

        <tr>
            <td colspan="3" class="header_title">Add DGs & RIPs
            </td>
        </tr>

        <tr>
            <td class="style3" valign="top">Select </td>
            <td class="style1" valign="top">:</td>
            <td>
                <asp:DropDownList ID="DDLDGs" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Rotary International President</asp:ListItem>
                    <asp:ListItem>Rotary International President Elect</asp:ListItem>
                    <asp:ListItem>Rotary International President Nominee</asp:ListItem>
                    <asp:ListItem>District Governor</asp:ListItem>
                    <asp:ListItem>District Governor Elect</asp:ListItem>
                    <asp:ListItem>District Governor Nominee</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td class="style3" valign="top">Add Data</td>
            <td class="style1" valign="top">:</td>
            <td align="left">
                <%--<asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" 
                             Width="750px" Height="500px"></asp:TextBox>--%>

                <telerik:RadEditor ID="txtData" runat="server">
                    <Tools>
                        <telerik:EditorToolGroup Tag="MainToolbar">
                            <telerik:EditorTool Name="FindAndReplace" />
                            <telerik:EditorSeparator />
                            <telerik:EditorSplitButton Name="Undo">
                            </telerik:EditorSplitButton>
                            <telerik:EditorSplitButton Name="Redo">
                            </telerik:EditorSplitButton>
                            <telerik:EditorSeparator />
                            <telerik:EditorTool Name="Cut" />
                            <telerik:EditorTool Name="Copy" />
                            <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                            <telerik:EditorTool Name="LinkManager" ShortCut="CTRL+K" />
                            <telerik:EditorTool Name="Unlink" ShortCut="CTRL+SHIFT+K" />
                        </telerik:EditorToolGroup>

                        <telerik:EditorToolGroup Tag="Formatting">
                            <telerik:EditorTool Name="Bold" />
                            <telerik:EditorTool Name="Italic" />
                            <telerik:EditorTool Name="Underline" />
                            <telerik:EditorSeparator />
                            <telerik:EditorSplitButton Name="ForeColor">
                            </telerik:EditorSplitButton>
                            <telerik:EditorSplitButton Name="BackColor">
                            </telerik:EditorSplitButton>
                            <telerik:EditorSeparator />
                            <telerik:EditorDropDown Name="FontName">
                            </telerik:EditorDropDown>
                            <telerik:EditorDropDown Name="RealFontSize">
                            </telerik:EditorDropDown>
                        </telerik:EditorToolGroup>
                    </Tools>
                    <Content>
                    </Content>
                    <TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
                </telerik:RadEditor>

            </td>
        </tr>

        <tr>
            <td class="style3">&nbsp;</td>
            <td class="style1">&nbsp;</td>
            <td>
                <div align="left">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="tinyMCE.triggerSave(false, true); return ChkDDLVal()"
                        CssClass="btn"
                        ValidationGroup="A" OnClick="btnSubmit_Click" />
                    &nbsp;
                    <asp:Button ID="btncancel" runat="server" Text="Cancel"
                        CssClass="btn" CausesValidation="False" />

                    <asp:RequiredFieldValidator ID="RFVdata" runat="server"
                        ControlToValidate="txtData" CssClass="txt_validation" Display="Dynamic"
                        ErrorMessage="Please Enter Text" ValidationGroup="A"></asp:RequiredFieldValidator>

                    <asp:CustomValidator ID="CV" runat="server" ControlToValidate="txtData"
                        CssClass="txt_validation" Display="Dynamic" ErrorMessage="Data Already Exist"
                        OnServerValidate="CV_ServerValidate" ValidationGroup="A"></asp:CustomValidator>

                </div>
            </td>
        </tr>
    </table>

    <%-- </ContentTemplate>
</asp:UpdatePanel>--%>
</asp:Content>


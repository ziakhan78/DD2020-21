<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_glossary.aspx.cs" Inherits="admin_add_glossary" %>

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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

    <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

        <tr>
            <td colspan="3" class="header_title">Add Glossary
            </td>
        </tr>
        <tr>
            <td colspan="3" class="style3"><span class="style2">*</span> Denotes Mandatory 
                  field.
            </td>
        </tr>
        <tr>
            <td class="style3">
                <div align="right"><span class="style2">*</span> Title</div>
            </td>
            <td class="style1">:</td>
            <td class="style1">

                <asp:TextBox ID="txtTitle" runat="server" Width="600px" CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVAwardName" runat="server"
                    ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>




        <tr>
            <td valign="top" class="style3">
                <span class="style2">*</span>
                Description</td>
            <td class="style1" valign="top">:</td>
            <td class="style1">
                <asp:TextBox ID="txtDescription" runat="server" Width="600px" TextMode="MultiLine"
                    Height="200px" CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVDesc" runat="server"
                    ControlToValidate="txtDescription" CssClass="txt_validation" Display="Dynamic"
                    ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>



        <tr>
            <td class="style3">
                <div align="right"></div>
            </td>
            <td class="style1">
                <div align="center"></div>
            </td>
            <td>
                <div align="left">
                    &nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit"
                        CssClass="btn"
                        ValidationGroup="A" OnClick="btnSubmit_Click" />
                    &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel"
                        CssClass="btn" CausesValidation="False" OnClick="btncancel_Click" />
                </div>
            </td>
        </tr>


    </table>

  
            
            </asp:Panel>

    </ContentTemplate>
      <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>




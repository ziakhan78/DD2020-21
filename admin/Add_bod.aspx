<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="Add_bod.aspx.cs" Inherits="user_Add_bod" Title="" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<%--<script type="text/javascript" >
        function ChkDDLVal() {


            var memName = document.getElementById('<%=DDLMember.ClientID%>');
            if (memName.value == 'Select') {
                alert('Please select member.');
                memName.focus();
                return false;
            }


            var memDesig = document.getElementById('<%=DDLDesignation.ClientID%>');
            if (memDesig.value == 'Select') {
                alert('Please select designation.');
                memDesig.focus();
                return false;
            }          
            
                      
            return true;
        }
</script>--%>

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <table width="100%" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
         
            <tr>
               <td colspan="2" class="header_title">Add Board Members
               </td>
            </tr>

         <tr>
                    <td align="right"><span class="auto-style1">*</span> Select Year: </td>
                    <td align="left"><asp:DropDownList ID="DDLYears" runat="server" AutoPostBack="True" CssClass="txtBox" >
                         <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFTitle" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Title!" InitialValue="Select" ValidationGroup="d"></asp:RequiredFieldValidator>
                    </td>
                </tr>

         <tr>
              <td width="170px" >
                  <div align="right">
                      <span class="auto-style1">*</span>
                      Select Club Name:</div>
                </td>
           
              <td>
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                      DataValueField="id" AutoPostBack="True" 
                      onselectedindexchanged="DDLClubName_SelectedIndexChanged">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="rfvClubname" runat="server" ControlToValidate="DDLClubName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Club Name!" InitialValue="Select" ValidationGroup="d"></asp:RequiredFieldValidator>
                </td>
            </tr>
          
            <tr>
              <td width="170px" ><div align="right" ><span class="auto-style1">*</span> Select BOD Member: </div></td>
              <td width="625px" >
                
                  <div align="left"><asp:DropDownList ID="DDLMember" runat="server" ValidationGroup="d" CssClass="txtBox" >
                  <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RFTitle0" runat="server" ControlToValidate="DDLMember" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Member!" InitialValue="Select" ValidationGroup="d"></asp:RequiredFieldValidator>
                  </div></td>
            </tr>
         
          <tr>
              <td><div align="right"><span class="auto-style1">*</span> Select Position: </div></td>
              <td><div align="left"><asp:DropDownList ID="DDLDesignation" runat="server" AppendDataBoundItems="true" 
                          ValidationGroup="d" CssClass="txtBox">
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="rfvDesignation" runat="server" ControlToValidate="DDLMember" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Designation!" InitialValue="Select" ValidationGroup="d"></asp:RequiredFieldValidator>
                  </div>
              </td>
            </tr>
          
            
             
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="DDLDesignation" CssClass="txt_validation" 
                        ErrorMessage="The Member &amp; their Designation is already exist" 
                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="d" 
                        Display="Dynamic"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" 
                        ControlToValidate="DDLDesignation" CssClass="txt_validation" 
                        ErrorMessage="Designation is already exist" 
                        onservervalidate="CustomValidator2_ServerValidate" ValidationGroup="d"></asp:CustomValidator>
                </td>
            </tr>
          
            
             
            <tr>
              <td ><div align="right"></div></td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="d" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                    <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT club_name,id from clubs_tbl where district_no='3141' order by club_name asc">
                  </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
          </table>

        </asp:Panel>
     
      </ContentTemplate>
      <Triggers>
      <asp:PostBackTrigger ControlID="btnSubmit" />
      </Triggers>
    </asp:UpdatePanel>
</asp:Content>


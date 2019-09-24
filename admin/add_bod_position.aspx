<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_bod_position.aspx.cs" Inherits="admin_add_bod_position" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
    <table width="100%" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">
         
            <tr>
               <td colspan="2" class="header_title">Add BOD Position
               </td>
            </tr>
          
          <tr>
              <td width="170px" >
                  <div align="right">
                      <span class="auto-style1">*</span>
                      Club Name</div>
                </td>
           
              <td>
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txtBox" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                      DataValueField="id">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator 
                          ID="rfvClubname" runat="server" ControlToValidate="DDLClubName" Display="Dynamic" InitialValue="Select" 
                          ErrorMessage="Select Club Name!" ValidationGroup="BODPO" 
                          CssClass="txt_validation"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
              <td ><div align="right" ><span class="auto-style1">*</span>Add BOD Position</div></td>
             
              <td >
                
                  <div align="left">&nbsp;<asp:TextBox ID="txtBODPosi" runat="server" Width="450px" CssClass="txtBox"></asp:TextBox><asp:RequiredFieldValidator 
                          ID="RFVBODPosi" runat="server" ControlToValidate="txtBODPosi" Display="Dynamic" 
                          ErrorMessage="Enter BOD Position!" ValidationGroup="BODPO" 
                          CssClass="txt_validation"></asp:RequiredFieldValidator>
                      <asp:CustomValidator ID="CVPosition" runat="server" 
                          ControlToValidate="txtBODPosi" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="*Already Exist" onservervalidate="CVRImemNo_ServerValidate" 
                          ValidationGroup="BODPO"></asp:CustomValidator>
                  </div></td>
            </tr>
         
         
            
             
            <tr>
              <td ><div align="right"></div></td>
            
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="BODPO" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                   <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT club_name,id from clubs_tbl where district_no='3141' order by club_name asc">
                  </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
          </table>
     
      </ContentTemplate>
      <Triggers>
      <asp:PostBackTrigger ControlID="btnSubmit" />
      </Triggers>
    </asp:UpdatePanel>
</asp:Content>


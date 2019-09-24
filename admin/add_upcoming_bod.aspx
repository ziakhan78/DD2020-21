<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_upcoming_bod.aspx.cs" Inherits="Admin_add_upcoming_bod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" >
    function ChkDDLVal() {


        var Clubname = document.getElementById('<%=DDLClubName.ClientID%>');
        if (Clubname.value == 'Select') {
            alert('Please Select Club Name.');
            Clubname.focus();
            return false;
        }


        var memName = document.getElementById('<%=DDLMember.ClientID%>');
        if (memName.value == 'Select') {
            alert('Please Select Member.');
            memName.focus();
            return false;
        }


        var memDesig = document.getElementById('<%=DDLDesignation.ClientID%>');
        if (memDesig.value == 'Select') {
            alert('Please Select Designation.');
            memDesig.focus();
            return false;
        }


        return true;
    }
</script>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
            <tr>
               <td colspan="3" class="header_title">Add Incoming BOD Members
               </td>
            </tr>

              <tr>
              <td colspan="3" align="right"><span class="style1">*</span> Denotes Mandatory field.
                  </td>
            </tr> 

             <tr>
              <td width="170px" >
                  <div align="right">
                      <span class="style1">*</span>
                      Select Club Name</div>
                </td>
              <td  width="5px" >:</td>
              <td width="625px" >
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                      DataValueField="id" AutoPostBack="True" 
                      onselectedindexchanged="DDLClubName_SelectedIndexChanged" 
                      CausesValidation="True">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
                </td>
            </tr>

          
            <tr>
              <td width="170px" ><div align="right" ><span class="style1">* </span>Select Member's Name</div></td>
              <td  width="5px" ><div align="left">:</div></td>
              <td width="625px" >
                
                  <div align="left"><asp:DropDownList ID="DDLMember" runat="server"  AppendDataBoundItems="true"
                          ValidationGroup="d" CssClass="txt1">
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                  </div></td>
            </tr>
         
          <tr>
              <td><div align="right"><span class="style1">* </span>Select Position</div></td>
              <td><div align="align">:</div></td>
              <td><div align="left"><asp:DropDownList ID="DDLDesignation" runat="server"  AppendDataBoundItems="true"
                          ValidationGroup="d" CssClass="txt1">
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                      &nbsp;</div>
              </td>
            </tr>
          
            
             
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="DDLDesignation" CssClass="txt_validation" 
                        ErrorMessage="The Member &amp; their Designation is already exist" 
                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="d"></asp:CustomValidator>
                </td>
            </tr>
          
            
             
            <tr>
              <td ><div align="right"></div></td>
              <td><div align="center"></div></td>
              <td><div align="left"><asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" OnClientClick="return ChkDDLVal()"
                      CssClass="btn" 
                      ValidationGroup="d" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
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

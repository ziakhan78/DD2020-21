<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_administrative_team.aspx.cs" Inherits="admin_add_administrative_team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            text-align: left;
            color: #FF0000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
    <ContentTemplate>
    
     <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            
            <tr>              
               <td colspan="3" class="header_title">Add Administrative Team</td>
            </tr>       
          
            <tr>
              <td align="right" colspan="3" ><span class="style3">*</span> Denotes Mandatory field.
                  </td>
            </tr>       
          
       
           <tr>
              <td class="style1" width="150"><span class="style3">*</span> Select Year</td>
              <td class="style1" width="5px" >:</td>
               <td class="style2">
                    <asp:DropDownList ID="DDLYears" runat="server" CssClass="txt1" >
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVyear" runat="server" 
                        ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Select Year" InitialValue="Year" ValidationGroup="A"></asp:RequiredFieldValidator>
                  </td>
            </tr>
            
             <tr>
                 <td class="style1">
                     <span class="style3">*</span> Members</td>
                 <td class="style1" width="5px">
                     :</td>
                 <td class="style2">
                     <asp:DropDownList ID="DDLMemName" runat="server" AppendDataBoundItems="True" 
                         AutoPostBack="True" CssClass="txt" DataSourceID="DSdistMembers" 
                         DataTextField="Name" DataValueField="MemberId" 
                         onselectedindexchanged="DDLMemName_SelectedIndexChanged">
                         <asp:ListItem>Select</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RFVMem" runat="server" 
                         ControlToValidate="DDLMemName" CssClass="txt_validation" Display="Dynamic" 
                         ErrorMessage="Select Member" InitialValue="Select" 
                         ValidationGroup="A"></asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="CVMember" runat="server" 
                         ControlToValidate="DDLMemName" CssClass="txt_validation" Display="Dynamic" 
                         ErrorMessage="Member Already Exist." onservervalidate="CVMember_ServerValidate" 
                         ValidationGroup="A"></asp:CustomValidator>
                 </td>
            </tr>
            
             <tr>
              <td class="style1">Club Name</td>
              <td class="style1" >:</td>
              <td class="style2">
                    <asp:Label ID="lblClubName" runat="server"></asp:Label>
                  </td>
            </tr>
           
           
           
                <tr >
              <td class="style1"><div align="right"><span class="style3">*</span> District Designdation</div></td>
              <td align="center">:</td>
              <td><div align="left">
                      <asp:DropDownList ID="DDLDesig" runat="server" AppendDataBoundItems="true" 
                          CssClass="txt" DataSourceID="DSDistDesignation" DataTextField="designation" 
                          DataValueField="id">
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="rfvDesig" runat="server" 
                          ControlToValidate="DDLDesig" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Select Designation" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                  </div>
              </td>
            </tr>

           
          
            
            <tr>
              <td class="style1" >                 
                      &nbsp;</td>
                <td align="center">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" 
                        onclick="btnSubmit_Click" Text="Submit" ValidationGroup="A" Width="80px" />
                    &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" 
                        CssClass="btn" Text="Cancel" Width="80px" />
                </td>
            </tr>            
           
           
          
            
            <tr>
              <td align="center" colspan="3" >                 
                      &nbsp;<asp:SqlDataSource ID="DSDistDesignation" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT * FROM [distt_designation_tbl] ORDER BY [designation]">
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="DSdistMembers" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT [MemberId], [Name] FROM [ViewMembers] ORDER BY [Name]">
                      </asp:SqlDataSource>
                </td>
            </tr>            
           
          </table>     
     </ContentTemplate>
 
    </asp:UpdatePanel>
</asp:Content>



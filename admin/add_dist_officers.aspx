<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_dist_officers.aspx.cs" Inherits="admin_add_dist_officers" %>

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
        .style4
        {
            width: 600px;
        }
        .auto-style1 {
            text-align: left;
            width: 600px;
        }
        .auto-style2 {
            width: 680px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
    
     <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            
            <tr>              
               <td colspan="3" class="header_title">Add District Officers</td>
            </tr>       
          
            <tr>
              <td align="right" colspan="3" ><span class="style3">*</span> Denotes Mandatory field.
                  </td>
            </tr>       
          
          <%--  <tr>
              <td colspan="3" class="header_subtitle" >Club Details</td>
            </tr>--%>
            
           <tr>
              <td class="style1" width="200px"><span class="style3">*</span> Select Year</td>
              <td class="style1" width="5px" >:</td>
               <td class="auto-style1">
                    <asp:DropDownList ID="DDLYears" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged" >
                         <asp:ListItem>Select</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVyear" runat="server" 
                        ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Select Year" InitialValue="Year" ValidationGroup="DO"></asp:RequiredFieldValidator>
                  </td>
            </tr>

          <tr>
              <td class="style1"><span class="style3">*</span> Designation In</td>
              <td class="style1" >:</td>
               <td class="auto-style1">
                   <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal">
                       <asp:ListItem Selected="True" Value="District">District</asp:ListItem>
                       <asp:ListItem>Club</asp:ListItem>
                       <asp:ListItem>RI</asp:ListItem>
                   </asp:RadioButtonList>
                  </td>
            </tr>


            
             <tr>
                 <td class="style1">
                     <span class="style3">*</span> District Officers</td>
                 <td class="style1">
                     :</td>
                 <td class="auto-style1">
                     <asp:DropDownList ID="DDLMemName" runat="server" AppendDataBoundItems="True" 
                         AutoPostBack="True" CssClass="txt"
                         onselectedindexchanged="DDLMemName_SelectedIndexChanged">
                         <asp:ListItem>Select</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RFVDistOfficers" runat="server" 
                         ControlToValidate="DDLMemName" CssClass="txt_validation" Display="Dynamic" 
                         ErrorMessage="Select District Officer" InitialValue="Select" 
                         ValidationGroup="DO"></asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="CVMember" runat="server" 
                         ControlToValidate="DDLMemName" CssClass="txt_validation" Display="Dynamic" 
                         ErrorMessage="Member Already Exist." onservervalidate="CVMember_ServerValidate" 
                         ValidationGroup="DO"></asp:CustomValidator>
                 </td>
            </tr>
            
             <tr>
              <td class="style1">Club Name</td>
              <td class="style1" >:</td>
              <td class="auto-style1">
                    <asp:Label ID="lblClubName" runat="server"></asp:Label>
                  </td>
            </tr>
           
             <tr>
              <td class="style1">Membership No.</td>
              <td class="style1" >:</td>
              <td class="auto-style1">
                 
                  <asp:Label ID="lblMemNo" runat="server"></asp:Label>
                 
                 </td>
            </tr>
            <tr>
              <td class="style1">Date of Joining</td>
              <td class="style1" >:</td>
              <td class="auto-style1">
                 
                  <asp:Label ID="lbldoj" runat="server"></asp:Label>
                 
                 </td>
            </tr>
            <tr>
              <td class="style1">Years in Rotary</td>
              <td class="style1" >:</td>
              <td class="auto-style1">
                 
                  <asp:Label ID="lblyrsInRotary" runat="server"></asp:Label>
                 
                 </td>
            </tr>           
            
          
                <tr >
              <td class="style1"><div align="right"><span class="style3">*</span> District 
                  Designation</div></td>
              <td align="center">:</td>
              <td class="auto-style2"><div align="left">
                      <asp:DropDownList ID="DDLDesig" runat="server" AppendDataBoundItems="true" CssClass="txt"   >
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RFVDesig" runat="server" ControlToValidate="DDLDesig" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select District Designation" InitialValue="Select" ValidationGroup="DO"></asp:RequiredFieldValidator>
                     <%-- <asp:RequiredFieldValidator ID="RFVDesigAdd" runat="server" ControlToValidate="DDLDesig" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select District Designation" InitialValue="Select" ValidationGroup="add"></asp:RequiredFieldValidator>
                      &nbsp;<asp:Button ID="btnAddmore" runat="server" CssClass="btn" 
                          Text="Add More..." 
                          Width="100px" onclick="btnAddmore_Click" ValidationGroup="add" />--%>
                  </div>
              </td>
            </tr>

        <%--   <tr >
              <td class="style1"><div align="right"><span class="style3">*</span> District 
                  Sub Designation</div></td>
              <td align="center">:</td>
              <td class="auto-style2"><div align="left">
                      <asp:DropDownList ID="DDLSubDesig" runat="server" AppendDataBoundItems="true" CssClass="txt"  >
                          <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList>                      
                     
                  </div>
              </td>
            </tr>--%>



             <%-- <tr id="TRTopics" runat="server" valign="top">
                 <td class="style1">
                     &nbsp;</td>
                 <td align="center" valign="top">
                     &nbsp;</td>
                 <td valign="middle" class="auto-style2">
                     <asp:ListBox ID="listTopics" runat="server" Height="150px" Width="506px" 
                         CssClass="txt1">
                     </asp:ListBox>
                     <br />
                     <asp:Button ID="btnRemove" runat="server" CssClass="btn" 
                         onclick="btnRemove_Click" Text="Remove"  Width="100px" />
                 </td>
         </tr>--%>
          
            
            <tr>
                <td class="style1" valign="top">
                    Best Time to Call</td>
                <td class="style1" valign="top">
                    :</td>
                <td class="auto-style1">
                    <table class="style4">
                        <tr>
                            <td width="80px" valign="top">
                                In Morning :</td>
                                <td valign="top" width="350px">
                                    From :&nbsp;
                            <asp:DropDownList ID="DDLh1" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLm1" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DropDownList3" runat="server" CssClass="txt">                       
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>PM</asp:ListItem>
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
                            <td valign="top" width="400px"> To :&nbsp; <asp:DropDownList ID="DDLh2" runat="server" 
                                    CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLm2" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DropDownList12" runat="server" CssClass="txt">                        
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>PM</asp:ListItem>
                        
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                In Evening :</td>
                                <td valign="top">
                                    From :&nbsp;
                            <asp:DropDownList ID="DDLh3" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLm3" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DropDownList6" runat="server" CssClass="txt">                        
                        <asp:ListItem>PM</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
                            <td valign="top"> To :&nbsp; <asp:DropDownList ID="DDLh4" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLm4" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DropDownList9" runat="server" CssClass="txt">                        
                        <asp:ListItem>PM</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
          
            
          

            <tr>
              <td class="style1"></td>
              <td class="style1" ></td>
              <td class="auto-style1">
                 
               <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" 
                          ValidationGroup="DO" Width="80px" onclick="btnSubmit_Click" />
                      &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" 
                          CssClass="btn"  Text="Cancel" 
                          Width="80px" />                 
                      <%--<asp:SqlDataSource ID="DSDistDesignation" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT * FROM [distt_designation_tbl] ORDER BY [designation]">
                      </asp:SqlDataSource>--%>
                      <asp:SqlDataSource ID="DSdistMembers" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT [MemberId], [Name] FROM [ViewMembers] ORDER BY [Name]">
                      </asp:SqlDataSource>
                 
                 </td>
            </tr>
            
           
          </table>
     
     </ContentTemplate>
   <Triggers><asp:PostBackTrigger ControlID="btnSubmit" />        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


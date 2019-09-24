<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_dist_appointment.aspx.cs" Inherits="admin_add_dist_appointment" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            text-align: right;
        }
    </style>
   
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
   <table class="txt" width="100%" border="0" cellpadding="0" cellspacing="5"  >
    
         
            <tr>
               <td colspan="3" class="header_title">Add District Appointment
               </td>
            </tr>
           <tr>
              <td colspan="3" style="width: 800px" class="style3"><span class="style2">*</span> Denotes Mandatory field. </td>
            </tr>


         <tr>
              <td width="170px" >
                  <div align="right">
                      <span class="style2">*</span>
                      Club Name </div>
                </td>
          <td class="style1">:</td>
              <td>
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txtBox" DataSourceID="DSDistClubName" DataTextField="club_name" 
                      DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                      <asp:ListItem>Select</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator 
                          ID="rfvClubname" runat="server" ControlToValidate="DDLClubName" Display="Dynamic" InitialValue="Select" 
                          ErrorMessage="Select Club Name!" ValidationGroup="A" 
                          CssClass="txt_validation"></asp:RequiredFieldValidator>
                </td>
            </tr>

        <tr>
              <td class="style3"><span class="style2">*</span> Name </td>
            <td class="style1">:</td>
              <td class="style1">
                  <asp:DropDownList ID="DDLMember" 
                          runat="server" 
                          ValidationGroup="A" CssClass="txtBox">
                      </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="DDLMember" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Member Name" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                       
                  </td>
            </tr>             
          
     

             <tr>
                        <td align="right"><span class="style2">*</span> Position Held On</td>
                        <td class="style1">:</td>
                        <td align="left" colspan="3">
                            <asp:DropDownList ID="DDLPHeld" runat="server" CssClass="txtBox" OnSelectedIndexChanged="DDLPHeld_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Club</asp:ListItem>
                                <asp:ListItem>District</asp:ListItem>
                                <asp:ListItem>RI</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeld" runat="server" ControlToValidate="DDLPHeld" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Position Held" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                    </tr>

           <tr>
                        <td width="195px" align="right" ><span class="style2">*</span> Year</td>
                        <td width="5px" >:</td>
                        <td align="left" colspan="3" valign="top">
                           <asp:DropDownList ID="DDLPHYear" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DDLPHYear_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeldYear" runat="server" ControlToValidate="DDLPHYear" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Year" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                         </td>
                    </tr>
                   
                  
                    <tr>
                        <td align="right" valign="top"><span class="style2">*</span> Avenue</td>
                        <td valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLAvenue" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DDLAvenue_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPHeldPost" runat="server" ControlToValidate="DDLAvenue" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Avenue" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                     
                        </td>

                    </tr>

         <tr>
                        <td align="right" valign="top"><span class="style2">*</span> Post</td>
                        <td valign="top">:</td>
                        <td align="left" colspan="3" valign="top">
                            <asp:DropDownList ID="DDLPosition" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPo" runat="server" ControlToValidate="DDLPosition" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Post" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                    
                        </td>

                    </tr>

                    <tr>
                        <td class="style3"></td>
                        <td></td>
                        <td align="left" colspan="3" valign="top">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DDLPosition" CssClass="txt_validation" Display="Dynamic" ErrorMessage="* Already Exists." OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="A"></asp:CustomValidator>
                            <br />
                            <asp:Button ID="btnAward" runat="server" CssClass="btn" Text="Add" Width="65px" OnClick="btnAward_Click" ValidationGroup="A" />
                             <asp:SqlDataSource ID="DSDistClubName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT club_name,id from clubs_tbl where district_no='3141' order by club_name asc"></asp:SqlDataSource>
               
                        </td>
                    </tr>

                   
           
          </table>
     
 </ContentTemplate>
 <Triggers>
 <asp:PostBackTrigger ControlID="btnAward" />
 </Triggers>
    </asp:UpdatePanel>
</asp:Content>




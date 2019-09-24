<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_award.aspx.cs" Inherits="admin_add_award" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
    
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add District Awards
               </td>
            </tr>
           <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
            
            <tr>
              <td class="style3">Category</td>
              <td class="style1">:</td>
              <td class="style1">
                  <asp:DropDownList ID="DDLCategory" runat="server" CssClass="txtBox">
                  <asp:ListItem>Select</asp:ListItem>
                      <asp:ListItem>All Round Activities</asp:ListItem>
                      <asp:ListItem>Club Service</asp:ListItem>
                      <asp:ListItem>Community Service</asp:ListItem>
                      <asp:ListItem>International Service</asp:ListItem>
                      <asp:ListItem>Vocational Service</asp:ListItem>
                       <asp:ListItem>Service to Youth</asp:ListItem>
                  </asp:DropDownList>
              </td>
            </tr>
            
            <tr>
              <td valign="top" class="style3" ><div align="right" ><span class="style2">*</span> Name of Award</div></td>
              <td class="style1" valign="top"  >:</td>
              <td class="style1" >
                
                  <asp:TextBox ID="txtAwardName" runat="server" Width="550px" Height="50px" 
                      TextMode="MultiLine" CssClass="txtBox"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVAwardName" runat="server" 
                      ControlToValidate="txtAwardName" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
         
         
            
          <tr>
              <td valign="top" class="style3">Donor</td>
              <td class="style1" valign="top">:</td>
              <td class="style1">
                 
                  <asp:DropDownList ID="DDLDonor" runat="server" DataSourceID="DSDonor"  
                      AppendDataBoundItems="true" CssClass="txtBox"
                      DataTextField="club_name" DataValueField="id">
                      <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                  </asp:DropDownList>&nbsp;&nbsp;
                  <asp:CheckBox ID="chkIfOther" runat="server" AutoPostBack="True" 
                      oncheckedchanged="chkIfOther_CheckedChanged" Text="If other" TextAlign="Left" />
                 
                  <asp:SqlDataSource ID="DSDonor" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                 
              </td>
            </tr>
            
             <tr id="trDonor" runat="server">
              <td class="style3">Enter Donor</td>
              <td class="style1">:</td>
              <td class="style1">
                  <asp:TextBox ID="txtOtherDonor" runat="server" Width="218px" CssClass="txtBox"></asp:TextBox>
              </td>
            </tr>
            
          <tr>
              <td class="style3"><div align="right">Constituted In</div></td>
              <td class="style1">:</td>
              <td class="style1">
                
                  <asp:DropDownList ID="DDLYear" runat="server" CssClass="txtBox">
                  </asp:DropDownList>
              </td>
            </tr>
            
                      
            
             
            <tr>
              <td class="style3" ><div align="right"></div></td>
              <td class="style1"><div align="center"></div></td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
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




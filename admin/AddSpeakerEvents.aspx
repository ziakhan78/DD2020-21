<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="AddSpeakerEvents.aspx.cs" Inherits="AddSpeakerEvents" Title="" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">

        function ChkDDLVal() {

            var barHead = document.getElementById('<%=DDLClubName.ClientID%>');
            if (barHead.value == 'Select Club Name') {
                alert('Please select club name');
                barHead.focus();
                return false;
            }          
            return true;
        }
</script>
    <style type="text/css">

        .style1
        {
            text-align: right;
        }
        
         .style2
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
            <td colspan="3" class="header_title">Add Upcoming Club Events</td>
         </tr>
         
          <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
                   
         <tr>
              <td width="200" class="style1"><span class="style2">*</span> Rotary Club of</td>
              <td width="5" align="center">:</td>    
              <td width="680">
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" 
                      onselectedindexchanged="DDLClubName_SelectedIndexChanged">
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
              </td>
         </tr>
            <tr>
                <td class="style1" width="200">
                    <div align="right">
                        <span class="style2">*</span>
                        Select Date</div>
                </td>
                <td align="center" width="5">
                    :</td>
                <td width="680">
                    <div align="left">
                        <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="(Default)" 
                            MinDate="2010-07-01" ShowPopupOnFocus="True" Skin="Silk">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                ViewSelectorText="x" Skin="Silk">
                            </Calendar>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
                            ControlToValidate="RadDatePicker1" CssClass="txt_validation" Display="None" 
                            ErrorMessage="Please Select Date" ValidationGroup="E"></asp:RequiredFieldValidator>
                    </div>
                </td>
         </tr>
            <tr>
              <td class="style1" ><div align="right" >Speaker or Event</div></td>
              <td align="center">:</td>
              <td >
                
                  <div align="left"><asp:RadioButtonList ID="rbtnSpeaEvents" runat="server" 
                          RepeatDirection="Horizontal" AutoPostBack="True" 
                          onselectedindexchanged="rbtnSpeaEvents_SelectedIndexChanged">
                          <asp:ListItem Selected="True">Speaker</asp:ListItem>
                          <asp:ListItem>Event</asp:ListItem>
                      </asp:RadioButtonList>
                                                                                                </div></td>
            </tr>

             <tr>
              <td class="style1" ><div align="right" >Type of Speaker / Event</div></td>
              <td align="center">:</td>
              <td >
                
                  <div align="left"><asp:RadioButtonList ID="rbtnEventType" runat="server" 
                          RepeatDirection="Horizontal" AutoPostBack="True" 
                          onselectedindexchanged="rbtnSpeaEvents_SelectedIndexChanged">
                          <asp:ListItem Selected="True">Club</asp:ListItem>
                          <asp:ListItem>District</asp:ListItem>
                      </asp:RadioButtonList>
                                                                                                </div></td>
            </tr>


            <tr id="TRSpeaker" runat="server">
              <td class="style1" ><div align="right">Speaker Name</div></td>
              <td align="center">:</td>
              <td >
                
                  <div align="left">
                      <asp:TextBox ID="txtspeaker" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                      &nbsp;</div></td>
            </tr>

                    
             
            <tr id="TRTopics" runat="server">
              <td class="style1"><div align="right">Topic</div></td>
              <td align="center">:</td>
              <td><div align="left">
                      <asp:TextBox ID="txttopics" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                      &nbsp;</div>
              </td>
            </tr>
          
            
             
            <tr id="TREvents" runat="server">
                <td class="style1">
                    Event Name</td>
                <td align="center">
                    :</td>
                <td align="left">
                      <asp:TextBox ID="txtevents" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
                </td>
         </tr>
          <tr>
                <td class="style1">
                    Avenue Covered</td>
                <td align="center">
                    :</td>
                <td align="left">
                      <asp:DropDownList ID="DDLAvenueCovered" runat="server" CssClass="txtBox">
                          <asp:ListItem>Select</asp:ListItem>
                          <asp:ListItem>Club service</asp:ListItem>
                          <asp:ListItem>Vocational Service</asp:ListItem>
                          <asp:ListItem>Community service</asp:ListItem>
                          <asp:ListItem>International Service</asp:ListItem>
                          <asp:ListItem>New Generations</asp:ListItem>
                      </asp:DropDownList>
                </td>
         </tr>
          
            
             
          <tr>
              <td class="style1">
                  Venue</td>
              <td align="center">
                  :</td>
              <td align="left">
                  <asp:RadioButtonList ID="rbtnvenue" runat="server" AutoPostBack="True" 
                      onselectedindexchanged="rbtnvenue_SelectedIndexChanged" 
                      RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True">Regular</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
         </tr>
          
            
             
          <tr>
              <td class="style1">
                  &nbsp;</td>
              <td align="center">
                  &nbsp;</td>
              <td align="left">
                  <asp:TextBox ID="txtvenue" runat="server" Width="350px" CssClass="txtBox"></asp:TextBox>
              </td>
         </tr>
          
            
             
          <tr>
                <td class="style1">
                    Select
                    Time</td>
                <td align="center">
                    :</td>
                <td align="left">
                    <asp:DropDownList ID="DDLTimeH" runat="server" CssClass="txtBox">
                    </asp:DropDownList>
                    -
                    <asp:DropDownList ID="DDLTimeM" runat="server" CssClass="txtBox">
                    </asp:DropDownList>
                    -&nbsp;<asp:DropDownList ID="DDLTime" runat="server" CssClass="txtBox">
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>PM</asp:ListItem>
                    </asp:DropDownList>
                    

                </td>
         </tr>
         
              
          <tr>
              <td class="style1">
                  Guest Allowed</td>
              <td align="center">
                  :</td>
              <td align="left">
                  
                  <asp:RadioButtonList ID="rbtnGuestAll" runat="server" AutoPostBack="True"  
                      RepeatDirection="Horizontal" 
                      onselectedindexchanged="rbtnGuestAll_SelectedIndexChanged">
                      <asp:ListItem Selected="True">No</asp:ListItem>
                      <asp:ListItem>Yes</asp:ListItem>
                  </asp:RadioButtonList>
                  
              </td>
         </tr>
         
          <tr id="TRGuestCharge" runat="server">
                <td class="style1">
                    Guest Charge (<asp:Image ID="Image4" runat="server" 
                        ImageUrl="~/admin_icons/rupee.gif" />
                    )</td>
                <td align="center">
                    :</td>
                <td align="left">
                      <telerik:RadNumericTextBox ID="txtCost" Runat="server" CssClass="txtBox" Skin="Silk"
                          MaxLength="5" Width="60px">
                          <NumberFormat AllowRounding="False" DecimalDigits="2" 
                              KeepTrailingZerosOnFocus="True" />
                      </telerik:RadNumericTextBox>
                      per person</td>
         </tr>
         
          <tr>
              <td class="style1">
                  Dress Code</td>
              <td align="center">
                  :</td>
              <td align="left">
                  
                  <asp:RadioButtonList ID="rbtnDress" runat="server" AutoPostBack="false"  
                      RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True">Formals</asp:ListItem>
                      <asp:ListItem>Smart Casuals</asp:ListItem>
                      <asp:ListItem>Ethnic</asp:ListItem>
                  </asp:RadioButtonList>
                  
              </td>
         </tr>

          <tr>
              <td class="style1" valign="top">
                  Description</td>
              <td align="center" valign="top">
                  :</td>
              <td align="left">
                  <asp:TextBox ID="txtdescription" runat="server" CssClass="txtBox" Height="80px" 
                      MaxLength="300" TextMode="MultiLine" Width="600px"></asp:TextBox>
                  <br />
                  <span class="style2"><strong>Maximum limit 300 characters</strong></span></td>
         </tr>
          
            
             
            <tr>
              <td class="style1" ></td>
              <td></td>
              <td><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="E" onclick="btnSubmit_Click" Width="100px" OnClientClick="ChkDDLVal();"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click" 
                      Width="100px"/>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc">
                  </asp:SqlDataSource>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                      CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False" 
                      ValidationGroup="E" />
                  </div></td>
            </tr>
            
           
          </table>
  
  </ContentTemplate>
  <Triggers>
  <asp:PostBackTrigger ControlID="btnSubmit" />
  </Triggers>
    </asp:UpdatePanel>
</asp:Content>


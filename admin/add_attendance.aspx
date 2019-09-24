<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_attendance.aspx.cs" Inherits="admin_add_attendance" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" >
    function ChkDDLVal() {

        var clubname = document.getElementById('<%=DDLClubName.ClientID%>');
        if (clubname.value == 'Select Club Name') {
            alert('Please Select Club Name');
            clubname.focus();
            return false;
        }

        var memName = document.getElementById('<%=DDLMonth.ClientID%>');
        if (memName.value == 'Month') {
            alert('Please Select Attendance Month.');
            memName.focus();
            return false;
        }

       

        var noOfMeet = document.getElementById('<%=txtMeetingHeld.ClientID%>');
        if (noOfMeet.value == "") {
            alert('Please Select No. of Meetings Held.');
            noOfMeet.focus();
            return false;
        }

        return true;
    }
</script>

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
    .RadPicker{vertical-align:middle}.RadPicker .rcTable{table-layout:auto}.RadPicker_WebBlue .rcCalPopup{background-position:0 0}.RadPicker_WebBlue .rcCalPopup{background-image:url('mvwres://Telerik.Web.UI.Skins, Version=2012.1.411.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.WebBlue.Calendar.sprite.gif')}.RadPicker .rcCalPopup{display:block;overflow:hidden;width:22px;height:22px;background-color:transparent;background-repeat:no-repeat;text-indent:-2222px;text-align:center}
        </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
   
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="5" class="header_title">Add Monthly Club Attendance
               </td>
            </tr>
           <tr>
              <td colspan="5" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
            
             <tr>
              <td valign="top" class="style3"  ><span class="style2">*</span> Rotary Club of</td>
              <td class="style1" valign="top"  >:</td>
              <td  colspan="3">
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" 
                      onselectedindexchanged="DDLClubName_SelectedIndexChanged" 
                      AutoPostBack="True" >
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
                </td>
            </tr>
            
             <tr>
              <td valign="top" class="style3"  ><span class="style2">*</span> For the Month of</td>
              <td class="style1" valign="top"  >:</td>
              <td colspan="3">
                
                  <asp:DropDownList ID="DDLMonth" runat="server" 
                      CssClass="txt" >
                  </asp:DropDownList>
                  <asp:DropDownList ID="DDLYear" runat="server" CssClass="txt1">
                  </asp:DropDownList>
                  <asp:CustomValidator ID="CVAttendance" runat="server" 
                      ControlToValidate="DDLMonth" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Attendance already exist for this month." 
                      onservervalidate="CVAttendance_ServerValidate" ValidationGroup="A"></asp:CustomValidator>
                </td>
            </tr>
            
            
            
             <tr>
              <td valign="top" class="style3" width="20%" >President</td>
              <td class="style1" valign="top">:</td>
              <td width="30%" >             
                 
                  <asp:Label ID="lblPresiName" runat="server"></asp:Label>
                 
                  &nbsp;<asp:Label ID="lblPresiEmail" runat="server"></asp:Label>
                 
                </td>
                 <td class="style3" width="15%">
                     District Secretary</td>
                 <td class="style1" width="35%">
                     :&nbsp;
                     <asp:Label ID="lblDS" runat="server"></asp:Label>
                 </td>
            </tr>
            
          
            
            <tr>
              <td valign="top" class="style3"  >Secretary</td>
              <td class="style1" valign="top"  >:</td>
              <td >                
                 
                  <asp:Label ID="lblSecName" runat="server"></asp:Label>
                 
                  <asp:Label ID="lblSecEmail" runat="server"></asp:Label>
                 
                </td>
                <td class="style3">
                    Assistant Governor</td>
                <td>
                    :&nbsp;
                    <asp:Label ID="lblAG" runat="server"></asp:Label>
                </td>
            </tr>
            
             
            
             <tr>
                 <td class="style3" valign="top">
                     President Elect</td>
                 <td class="style1" valign="top">
                     :</td>
                 <td>
                     <asp:Label ID="lblPresiElectName" runat="server"></asp:Label>
                 </td>
                 <td class="style3">
                     Group Coordinator</td>
                 <td>
                     :&nbsp;
                     <asp:Label ID="lblGC" runat="server"></asp:Label>
                 </td>
            </tr>
            
             
            
             <tr>
              <td class="style3">Membership Strength</td>
              <td class="style1">:</td>
              <td colspan="3">
                   
                  <telerik:RadNumericTextBox ID="txtMemStrength" Runat="server" CssClass="txt" 
                      DataType="System.Int32" MaxLength="5" Width="50px">
                      <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="," />
                  </telerik:RadNumericTextBox>
                   
              </td>
            </tr>
            
            
            
             <tr>
              <td class="style3"><span class="style2">*</span> No. of Meetings Held</td>
              <td class="style1">:</td>
              <td colspan="3">
                  
                  <telerik:RadNumericTextBox ID="txtMeetingHeld" Runat="server" CssClass="txt" 
                      DataType="System.Int32" MaxLength="3" Width="50px">
                      <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" />
                  </telerik:RadNumericTextBox>
                  
              </td>
            </tr>

             <tr>
              <td class="style3">Average Attendance % </td>
              <td class="style1">:</td>
              <td colspan="3">
                  
                  <telerik:RadNumericTextBox ID="txtAvgAttendance" Runat="server" CssClass="txt" 
                      DataType="System.Int32" MaxLength="3" Width="50px">
                      <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" />
                  </telerik:RadNumericTextBox>
                  
              </td>
            </tr>

             <tr>
               <td colspan="5" class="header_title">Meeting(s) Cancelled
               </td>
            </tr>
            
            <tr>
              <td class="style3">No. of Meeting(s) Cancelled</td>
              <td class="style1">:</td>
              <td colspan="3">
                  
                  <telerik:RadNumericTextBox ID="txtMeetingCancelled" Runat="server" CssClass="txt" 
                      DataType="System.Int32" MaxLength="3" Width="50px">
                      <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" />
                  </telerik:RadNumericTextBox>
                  
              </td>
            </tr> 

           
            
             <tr>
                 <td class="style3">
                     Canceled Meeting Date</td>
                 <td class="style1">
                     &nbsp;</td>
                 <td colspan="3">
                     <telerik:RadDatePicker ID="dateCancelledMtng1" Runat="server" Skin="WebBlue" 
                         Culture="(Default)">
                         <Calendar Skin="WebBlue" UseColumnHeadersAsSelectors="False" 
                             UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                         </Calendar>
                         <DatePopupButton HoverImageUrl="" ImageUrl="" />
                         <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                         </DateInput>
                     </telerik:RadDatePicker>
                 </td>
            </tr>
            
             <tr>
              <td valign="top" class="style3"  >Reason for Cancelled Meeting</td>
              <td class="style1" valign="top"  >:</td>
              <td colspan="3" >                
                 
                    <asp:TextBox ID="txtCancelledMtngRes1" runat="server" TextMode="MultiLine" 
                        Width="500px" Height="60px"></asp:TextBox>
                 
                </td>
            </tr>
            
            
                         
            
               <tr>
                 <td class="style3">
                     Canceled Meeting Date</td>
                 <td class="style1">
                     &nbsp;</td>
                 <td colspan="3">
                     <telerik:RadDatePicker ID="dateCancelledMtng2" Runat="server" Skin="WebBlue" 
                         Culture="(Default)">
                         <Calendar Skin="WebBlue" UseColumnHeadersAsSelectors="False" 
                             UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                         </Calendar>
                         <DatePopupButton HoverImageUrl="" ImageUrl="" />
                         <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                         </DateInput>
                     </telerik:RadDatePicker>
                   </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    Reason for Cancelled Meeting</td>
                <td class="style1" valign="top">
                    :</td>
                <td colspan="3">
                    <asp:TextBox ID="txtCancelledMtngRes2" runat="server" TextMode="MultiLine" 
                        Width="500px" Height="60px"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td colspan="3">
                 
                  <div align="left">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"    
                          OnClientClick="return ChkDDLVal()"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" />
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      
                      
                          
                          
                          SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
                  </div>                
                 
                </td>
            </tr>
            
            
                      
            
             
          </table>
     
   </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

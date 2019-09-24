<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_ocv_cal.aspx.cs" Inherits="admin_add_ocv_cal" %>

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
    <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    
   
       <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add OCV Calendar
               </td>
            </tr>
           <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
            
             <tr>
              <td valign="top" class="style3" width="200px" ><span class="style2">* </span>Club Name RC of</td>
              <td class="style1" valign="top"  >:</td>
              <td >
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" >
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
                  <asp:CustomValidator ID="CustomValidator1" runat="server" 
                      ControlToValidate="DDLClubName" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="* Already Exists." 
                      onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="A"></asp:CustomValidator>
                </td>
            </tr>
            
            <tr>
              <td class="style3"><span class="style2">* </span>OCV Date</td>
              <td class="style1">:</td>
              <td>
                  <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" 
                      Culture="English (United Kingdom)">
                      <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                          ViewSelectorText="x">
                      </Calendar>
                      <DatePopupButton HoverImageUrl="" ImageUrl="" />
                      <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                      </DateInput>
                  </telerik:RadDatePicker>
                  <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
                      ControlToValidate="RadDatePicker1" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>
              </td>
            </tr>
            
           
         
         
            
          <tr>
              <td valign="top" class="style3">Time</td>
              <td class="style1" valign="top">:</td>
              <td> <asp:DropDownList ID="DDLTimeH" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeM" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeAMPM" runat="server" CssClass="txt">                        
                        <asp:ListItem>PM</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                    </asp:DropDownList>
              </td>
            </tr>
            
                      
            
             
            <tr>
              <td class="style3" >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"  OnClientClick="ChkDDLVal();"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc">
                  </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
          </table>
     
   <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>



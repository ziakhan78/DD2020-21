<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_benefactors_members.aspx.cs" Inherits="admin_add_benefactors_members" %>

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
    
   
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
              
               <td colspan="3" class="header_title">Add Benefactors & Bequest Society Members</td>
            </tr>
           <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
           
            
             
          
         
             <tr>
              <td ><div align="right" >Title</div></td>
              <td class="style1" ><div align="center">:</div></td>
     
              <td >
                <div align="left">
                    <asp:DropDownList ID="drtitle" runat="server" CssClass="txt">
                        <asp:ListItem>Select</asp:ListItem>                        
                        <asp:ListItem>Mr.</asp:ListItem>                                               
                        <asp:ListItem>Mrs.</asp:ListItem>
                        <asp:ListItem>Miss</asp:ListItem> 
                        <asp:ListItem>Ms.</asp:ListItem>
                        <asp:ListItem>Dr.</asp:ListItem>
                        
                    </asp:DropDownList>
                    </div></td>
            </tr>
            <tr>
              <td width="195"><div align="right" ><span class="style2"><span class="style1">*</span> </span> First Name</div></td>
              <td width="5" class="style1" ><div align="center">:</div></td>
              <td width="600">
                
                  <div align="left">
                      <asp:TextBox ID="txtfname" runat="server" Width="200px" 
                          CssClass="txt"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RFFname" runat="server" 
                          ControlToValidate="txtfname" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Can't left blank" ValidationGroup="D"></asp:RequiredFieldValidator>
                  </div></td>
            </tr>
            
             <tr>
              <td ><div align="right">Middle Name</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td >
                
                  <div align="left">
                      <asp:TextBox ID="txtmname" runat="server" Width="200px" 
                          CssClass="txt"></asp:TextBox>
                      </div></td>
            </tr>
            
            <tr>
              <td  ><div align="right"><span class="style2">* </span> Last Name</div></td>
              <td class="style1" ><div align="center">:</div></td>
              <td >
                
                  <div align="left">
                      <asp:TextBox ID="txtlname" runat="server"  Width="200px" 
                          CssClass="txt"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RFLname" runat="server" 
                          ControlToValidate="txtlname" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Can't left blank" ValidationGroup="D"></asp:RequiredFieldValidator>
                  </div></td>
            </tr>
             
            <tr>
                <td class="style3">
                    <span class="style2">*</span>Select Club Name</td>
                <td>
                    :</td>
                <td class="style1">
                    <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                        CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" 
                        DataValueField="id">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClubname" runat="server" 
                        ControlToValidate="DDLClubName" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Please Select Clubname" InitialValue="Select" 
                        ValidationGroup="D"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CV" runat="server" ControlToValidate="DDLClubName" 
                        CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" 
                        onservervalidate="CVClubname_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
                </td>
            </tr>


              <tr>
                <td class="style3">
                    <span class="style2">*</span>Select Recognition Level</td>
                <td>
                    :</td>
                <td class="style1">
                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="txt" >
                    <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Benefactor</asp:ListItem>
                        <asp:ListItem>Bequest Society</asp:ListItem>                       
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvLevel" runat="server" 
                        ControlToValidate="ddlLevel" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Please Select Level" InitialValue="Select" 
                        ValidationGroup="D"></asp:RequiredFieldValidator>
                </td>
            </tr>
           
         
         
            
             
            <tr>
                <td class="style3">
                    Achieved Date</td>
                <td>
                    :</td>
                <td class="style1">
                    <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="en-IN">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                            ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" 
                            LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </td>
            </tr>
           
         
         
            
             
            <tr>
              <td class="style3" >
                  <div align="right">
                  </div>
                </td>
              <td>&nbsp;</td>
              <td class="style1">
                  <div align="left">
                      <asp:Button ID="btnSubmit" runat="server" CssClass="btn" 
                          onclick="btnSubmit_Click" Text="Submit" ValidationGroup="D" />
                      &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" 
                          CssClass="btn" onclick="btncancel_Click" TabIndex="64" Text="Cancel" />
                  </div>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
                </td>
            </tr>
            
           
             
          </table>
     
   </ContentTemplate>
   <Triggers>
   <asp:PostBackTrigger ControlID="btnSubmit" />
   </Triggers>
    </asp:UpdatePanel>
</asp:Content>



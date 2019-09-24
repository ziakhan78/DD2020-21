<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_avenues_of_service_citation.aspx.cs" Inherits="admin_add_avenues_of_service_citation" %>

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
              
               <td colspan="3" class="header_title">Add Avenues Of Service Citation</td>
            </tr>
           <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
           
            
             
            <tr>
                <td class="style3">
                    <span class="style2">*</span>Select Years</td>
                <td>
                    :</td>
                <td class="style1">
                    <asp:DropDownList ID="DDLYears" runat="server" CssClass="txt1" AppendDataBoundItems="false">
                    <asp:ListItem>Select</asp:ListItem>
                      </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="rfvLevel" runat="server" 
                        ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Please Select Year" InitialValue="Select" 
                        ValidationGroup="D"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="rfvLevel0" runat="server" 
                        ControlToValidate="drtitle" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Please Select Title" InitialValue="Select" ValidationGroup="D"></asp:RequiredFieldValidator>
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
                    </asp:DropDownList>&nbsp; <asp:CheckBox ID="chkIfOther" runat="server" AutoPostBack="True" 
                      oncheckedchanged="chkIfOther_CheckedChanged" Text="If other" TextAlign="Left" />
                </td>
            </tr>

             <tr id="trOtherClub" runat="server">
              <td class="style3">Enter Club Name</td>
              <td class="style1">:</td>
              <td class="style1">
                  <asp:TextBox ID="txtOtherClubname" runat="server" Width="218px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFLname0" runat="server" 
                      ControlToValidate="txtOtherClubname" CssClass="txt_validation" 
                      Display="Dynamic" ErrorMessage="Can't left blank" ValidationGroup="D"></asp:RequiredFieldValidator>
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

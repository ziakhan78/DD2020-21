<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_bulletin.aspx.cs" Inherits="add_bulletin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
              
               <td colspan="4" class="header_title">Add Bulletin</td>
            </tr>
           <tr>
              <td colspan="4" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
           
          <tr>
              <td align="right" >Add Bulletin For</td>
              <td align="center"  >:</td>
              <td >
                
                  <asp:RadioButtonList ID="rbtnFor" runat="server" 
                      RepeatDirection="Horizontal" AutoPostBack="True" 
                      onselectedindexchanged="rbtnFor_SelectedIndexChanged">
                      <asp:ListItem Value="0" Selected="True" Text="District"></asp:ListItem>
                      <asp:ListItem Value="1" Text="Club"></asp:ListItem>
                  </asp:RadioButtonList>
                </td>
              <td width="550" >
                
                  <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" 
                      CssClass="txt" DataSourceID="DSDistClubNo" 
                      DataTextField="club_name" DataValueField="id" >
                      <asp:ListItem>Select Club Name</asp:ListItem>
                  </asp:DropDownList>
                </td>
            </tr>
         
            
             
            <tr>
                <td class="style3">
                    <div align="right">
                        <span class="style2">*</span> Title</div>
                </td>
                <td>
                    :</td>
                <td class="style1" colspan="2">
                    <div align="left">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="txt1" Width="550px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                            ControlToValidate="txtTitle" CssClass="txt_validation" Display="None" 
                            ErrorMessage="Please Enter Bulletin Title" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
         
            
             
            <tr>
              <td class="style3" >Frequency</td>
              <td>:</td>
              <td class="style1" colspan="2">
                  <asp:RadioButtonList ID="rbtnFrequency" runat="server" 
                      RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="0">Weekly</asp:ListItem>
                      <asp:ListItem Value="1">Monthly</asp:ListItem>
                      <asp:ListItem Value="2">Quarterly</asp:ListItem>
                      <asp:ListItem Value="3">Half Yearly</asp:ListItem>
                      <asp:ListItem Value="4">Yearly</asp:ListItem>
                  </asp:RadioButtonList>
                </td>
            </tr>
            
           
             <tr>
              <td valign="top" class="style3"><span class="style2">*</span> Upload File</td>
              <td valign="top">:</td>
              <td class="style1" colspan="2"><div align="left">
                  <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" CssClass="txt1" 
                      Height="24px" />
                  <asp:RequiredFieldValidator ID="rfvUploadFile" runat="server" 
                      ControlToValidate="FileUpload1" CssClass="txt_validation" Display="None" 
                      ErrorMessage="Please Upload File" ValidationGroup="D"></asp:RequiredFieldValidator>
                  <asp:CustomValidator ID="CustomValidator2" runat="server" 
                      ControlToValidate="FileUpload1" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Maximum file size exceeded !" 
                      onservervalidate="CustomValidator2_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
                  <br />
                  <span class="style2">( Upload only .pdf format and maximum file size is 5 MB )</span></div>
              </td>
            </tr>
            
             <tr>
              <td valign="top" class="style3">Upload Mast Head</td>
              <td valign="top">:</td>
              <td class="style1" colspan="2"><div align="left">
                  <asp:FileUpload ID="FileUpload2" runat="server" Width="500px" CssClass="txt1" 
                      Height="24px" />

                   
                  <br />
                  <span class="style2">( Upload file format: .jpg, .jpeg, .gif, .png&nbsp; and maximum 
                  file size is 300 KB, width=75px height=100px )<asp:CustomValidator 
                      ID="CustomValidator3" runat="server" ControlToValidate="FileUpload2" 
                      CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Maximum file size exceeded !" 
                      onservervalidate="CustomValidator3_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
                  </span></div>
              </td>
            </tr>
            
            
            <tr>
              <td class="style3" >Status</td>
              <td>:</td>
              <td class="style1" colspan="2">
                  <asp:DropDownList ID="DDLStatus" runat="server" CssClass="txt">
                  
                      <asp:ListItem >Active</asp:ListItem>                      
                      <asp:ListItem>Inactive</asp:ListItem>
                  </asp:DropDownList>
                </td>
            </tr>
            
           
             
            <tr>
              <td class="style3" ><div align="right"></div></td>
              <td>&nbsp;</td>
              <td class="style1" colspan="2"><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="D" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                      CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False" 
                      ValidationGroup="D" />
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


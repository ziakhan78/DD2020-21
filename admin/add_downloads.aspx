<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_downloads.aspx.cs" Inherits="admin_add_downloads" Title="" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript">

         function OnClientValidationFailed(sender, args) {
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
             if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                 if (sender.get_allowedFileExtensions().indexOf(fileExtention)) {
                     alert("The size of the submitted data exceeded the maximum allowed size!");
                 }
                 else {
                     alert("The size of the submitted data exceeded the maximum allowed size!");
                 }
             }
             else {
                 alert("The size of the submitted data exceeded the maximum allowed size!");
             }
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>              
               <td colspan="4" class="header_title">Add Downloads</td>
            </tr>
           <tr>
              <td colspan="4" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>
        

          <tr>
              <td align="right" >Add Download For</td>
              <td align="center"  >:</td>
              <td >
                
                  <asp:RadioButtonList ID="rbtnFor" runat="server" 
                      RepeatDirection="Horizontal" AutoPostBack="True" 
                      onselectedindexchanged="rbtnFor_SelectedIndexChanged">
                      <asp:ListItem Value="0" Selected="True" Text="District"></asp:ListItem>
                      <asp:ListItem Value="1" Text="Club"></asp:ListItem>
                      <asp:ListItem Value="2" Text="Default"></asp:ListItem>
                  </asp:RadioButtonList>
                </td>
              <td width="500" >
                
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
                            ErrorMessage="Please Enter Title" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
         
            <tr>
              <td valign="top" class="style3" >Description</td>
              <td valign="top"  >:</td>
              <td class="style1" colspan="2" >
                
                      <asp:TextBox ID="txtDesc" runat="server" Width="550px" CssClass="txt1" 
                          TextMode="MultiLine"></asp:TextBox>
                  </td>
            </tr>
         
            <tr>
              <td valign="top" class="style3"><span class="style2">*</span> Upload File</td>
              <td valign="top">:</td>
              <td class="style1" colspan="2"><div align="left">


                 <%-- <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" CssClass="txt1" 
                      Height="24px" />
                  <asp:RequiredFieldValidator ID="rfvFile" runat="server" 
                      ControlToValidate="FileUpload1" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Please Upload File" ValidationGroup="D"></asp:RequiredFieldValidator>
                  <asp:CustomValidator ID="CustomValidator2" runat="server" 
                      ControlToValidate="FileUpload1" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Maximum file size exceeded !" 
                      onservervalidate="CustomValidator2_ServerValidate" ValidationGroup="D"></asp:CustomValidator>--%>
                  <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" Skin="WebBlue"  MaxFileInputsCount="1" MaxFileSize="5242880" OnClientValidationFailed="OnClientValidationFailed" EnableInlineProgress="False" ChunkSize="0" InputSize="57"  />
                  </telerik:RadAsyncUpload>
                  <br />
                  <span class="style2">( Upload file format: i.e.&nbsp; .jpg, .jpeg, .gif, .png, .pdf, 
                  .doc, .txt, .ppt, .pptx, video, mp3. and maximum file size is 5 MB )</span></div>
              </td>
            </tr>
          
            
             
            <tr>
              <td valign="top" class="style3">Author Name</td>
              <td valign="top">:</td>
              <td class="style1" colspan="2">
                      <asp:TextBox ID="txtAuthor" runat="server" Width="300px" CssClass="txt1"></asp:TextBox>
              </td>
            </tr>
          
            
             
            <tr>
              <td class="style3" >Upload for</td>
              <td>:</td>
              <td class="style1" colspan="2">
                  <asp:RadioButtonList ID="rbtnSection" runat="server" 
                      RepeatDirection="Horizontal" >
                      <asp:ListItem Selected="True" Value="0" Text="General">General</asp:ListItem>
                      <asp:ListItem Value="1" Text="ClubLeaders">Club Leaders</asp:ListItem>
                      <asp:ListItem Value="2" Text="District Officers">District Officers</asp:ListItem>
                      <asp:ListItem Value="3" Text="Manuals">Manuals</asp:ListItem>
                  </asp:RadioButtonList>
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
                  <asp:Label ID="lblFileSize" runat="server" Visible="false" ></asp:Label>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                      CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False" 
                      ValidationGroup="D" />
                  <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
                  <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Metro">
                  </telerik:RadProgressArea>
                  </div> <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource></td>
            </tr>
            
           
          </table>
     
   </ContentTemplate>
   <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="upload_ocv_book.aspx.cs" Inherits="admin_upload_ocv_book" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">

        function OnClientValidationFailed(sender, args) {
            var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
            if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                if (sender.get_allowedFileExtensions().indexOf(fileExtention)) {
                    alert("Wrong file extension!");
                }
                else {
                    alert("The size of the submitted data exceeded the maximum allowed size!");
                }
            }
            else {
                alert("Not correct extension!");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
      </telerik:RadAjaxManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>              
               <td class="header_title" colspan="2">Upload OCV</td>
            </tr>
         
            <tr >
                <td align="center" style="border:solid thin; border-color:Gray; color:Red; padding:0 5px 0 5px;" 
                    colspan="2">                
                    You can upload the OCV Report Book in either Pdf or MS Word Format. ONly files 
                    with extention .pdf, .doc and .docx will be permitted to be uploaded.<br /> 
                    Please Note : The Maximum file size permitted is 30 MB.<br />                    
                </td>               
            </tr>

              <tr>
                  <td colspan="2" align="center" ><span style="border:solid thin; border-color:Gray; color:Red; padding:0 5px 0 5px;" >( Please name your document as Clubname_OCVbook. i.e. 
                        RCof_Bombay_Pier_OCVbook.pdf )</span></td>
            </tr>

              <tr>
                  <td align="right">&nbsp;</td>
                  <td align="left"> &nbsp;</td>
              </tr>
            

            <tr>
                <td align="right" width="15%">Select Club Name :</td>
                <td align="left" width="85%">
                    <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true" CssClass="txt" DataSourceID="DSDistClubNo" DataTextField="club_name" DataValueField="id">
                        <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClubname" runat="server" ControlToValidate="DDLClubName" CssClass="txt_validation" ErrorMessage="Please Select Club Name" InitialValue="Select" ValidationGroup="U"></asp:RequiredFieldValidator>
                </td>
            </tr>
            

         <tr>
                  <td align="right">Upload File :</td>
                  <td align="left"> 
                     
                     
                      <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1" MaxFileSize="31457280" OnClientValidationFailed="OnClientValidationFailed" TargetFolder="../OCV_Report_Books" AllowedFileExtensions="pdf, doc, docx" EnableInlineProgress="False" Skin="WebBlue" ChunkSize="0" InputSize="57" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                      <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
                      <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Metro">
                      </telerik:RadProgressArea>
                       
                  </td>
              </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td align="left">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Upload" ValidationGroup="U" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        <tr>
            <td colspan="2"><asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                        SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                    </asp:SqlDataSource></td>
        </tr>
           
          
          </table>

           </ContentTemplate>
   
    </asp:UpdatePanel>

</asp:Content>


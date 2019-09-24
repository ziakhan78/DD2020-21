<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_download.aspx.cs" Inherits="admin_add_download" Title="" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript">

         function OnClientValidationFailed(sender, args) {
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
             if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                 if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                     alert("This file type is not supported.");
                 }
                 else {
                     alert("This file exceeds the maximum allowed size of 500 KB.");
                 }
             }
             else {
                 alert("not correct extension.");
             }
         }

         function validateRadUpload(source, e) {
             e.IsValid = false;

             var upload = $find("<%= RadAsyncUpload1.ClientID %>");
             var inputs = upload.getFileInputs();
             for (var i = 0; i < inputs.length; i++) {
                 //check for empty string or invalid extension 
                 if (inputs[i].value == "" || !upload.isExtensionValid(inputs[i].value)) {
                     alert("Can't be left blank!");
                 }
             }
             e.IsValid = true;
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
            width:130px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
    <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>              
               <td colspan="2" class="header_title">Add Downloads</td>
            </tr>
           <tr>
              <td colspan="2" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>
          <tr>
              <td class="style3" ></td>             
              <td class="style1" >
                  <asp:RadioButtonList ID="rbtnDownloadType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnDownloadType_SelectedIndexChanged">
                      
                       <asp:ListItem Text="Powerpoints" Selected="True" Value="0"></asp:ListItem>
                      <asp:ListItem Text="Documents" Value="1" ></asp:ListItem>
                      <asp:ListItem Text="Manuals"  Value="2"></asp:ListItem>
                  </asp:RadioButtonList>
                  </td>
            </tr>

          <tr id="trDate" runat="server">
                    <td align="right" valign="top">
                        <span class="style2">*</span> Event Date</td>
                   
                    <td class="style5">
                        <telerik:RadDatePicker ID="event_date" runat="server" Culture="(Default)" Skin="Silk">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" Skin="Silk"></Calendar>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RFVSdate" runat="server"
                            ControlToValidate="event_date" Display="Dynamic"
                            ErrorMessage="Can't left blank !" ValidationGroup="D" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>



           <tr id="trEventName" runat="server">
              <td class="style3" ><span class="style2">*</span> Event Name: </td>             
              <td class="style1" >
                
                      <%--<asp:TextBox ID="txtEventName" runat="server" Width="300px" CssClass="txtBox"></asp:TextBox>--%>
                      
                      <telerik:RadComboBox ID="txtEventName" Runat="server" DataSourceID="dsEvent" DataTextField="event_name" DataValueField="event_name" RenderMode="Lightweight" Height="200" Width="300" 
                        DropDownWidth="310" EmptyMessage="Select Event Name" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="StartsWith" 
                        Skin="Silk" >
                      </telerik:RadComboBox>
                  <asp:RequiredFieldValidator ID="rfvEventName" runat="server" ControlToValidate="txtEventName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                    
                      <asp:SqlDataSource ID="dsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT  distinct [event_name] FROM [download_tbl] group by event_name ORDER BY [event_name]"></asp:SqlDataSource>


                  </td>
            </tr>


            <tr>
                <td class="style3">
                    <div align="right">
                        <span class="style2">*</span> Title: </div>
                </td>
               
                <td class="style1">
                    <div align="left">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="txtBox" Width="552px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
         
          
          
            
             
            <tr>
              <td class="style3" >Author: </td>             
              <td class="style1" >
                
                     <%-- <asp:TextBox ID="txtAuthor" runat="server" Width="300px" CssClass="txtBox"></asp:TextBox>--%>
                      <telerik:RadComboBox ID="txtAuthor" Runat="server" DataSourceID="dsAuthors" DataTextField="author" DataValueField="author" RenderMode="Lightweight" Height="200" Width="300" 
                        DropDownWidth="310" EmptyMessage="Select Author" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="StartsWith" 
                        Skin="Silk" >
                      </telerik:RadComboBox>
                      <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [author] FROM [download_tbl] group by author ORDER BY [author]"></asp:SqlDataSource>
                  </td>
            </tr>
         
            
          
            
           
         <%--    
            <tr>
              <td class="style3">Presented At: </td>
             
              <td class="style1">
                  <asp:RadioButtonList ID="rbtnPresentedAt" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Value="0" Text="PrePets" Selected="True"></asp:ListItem>
                      <asp:ListItem Value="1" Text="SOTS" ></asp:ListItem>
                  </asp:RadioButtonList>                     
              </td>
            </tr>--%>

          <tr>
              <td valign="top" class="style3"><span class="style2">*</span> Upload File: </td>
             
              <td class="style1"><div align="left">

                  <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" Skin="Silk" AllowedFileExtensions="pdf,ppt,pptx,pps,ppsx,doc,docx,txt"  MaxFileInputsCount="1" MaxFileSize="157286400" OnClientValidationFailed="OnClientValidationFailed" EnableInlineProgress="true" ChunkSize="0" InputSize="78" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                  </telerik:RadAsyncUpload>
                  <br />
                  <span class="style2">(Upload only .pdf, .ppt, .pptx, .pps, .ppsx, .doc, .docx, .txt file format and maximum file size is 150 MB)</span></div>
              </td>
            </tr>
          
            
             
            <tr>
              <td class="style3" >
                  <div align="right">
                  </div>
                </td>
             
              <td class="style1">
                  <div align="left">
                      <asp:Button ID="btnSubmit" runat="server" CssClass="btn" onclick="btnSubmit_Click" Text="Submit" ValidationGroup="D" />
                      &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" CssClass="btn" onclick="btncancel_Click" TabIndex="64" Text="Cancel" />
                      <asp:Label ID="lblFileSize" runat="server" Visible="false"></asp:Label>                     
                  </div>
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc"></asp:SqlDataSource>
                </td>
            </tr>
            
           
             
          </table>
     
   </ContentTemplate>
   <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>


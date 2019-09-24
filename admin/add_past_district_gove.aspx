<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="add_past_district_gove.aspx.cs" Inherits="admin_add_past_district_gove" Title="" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
<style type="text/css">
      
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
               <td colspan="3" class="header_title">Add Past District Governers
               </td>
            </tr>
             <tr>
              <td colspan="3" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>
          
            <tr>
              <td ><div align="right" ><span class="style2">* </span>Select Year</div></td>
                
                <td  ><div align="center">:</div></td>
              <td valign="top" >
                
                  <div align="left">
                      <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox">
                      </asp:DropDownList> 
                      <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please Select Year" InitialValue="Year" ValidationGroup="DG"></asp:RequiredFieldValidator>
                  </div></td>
            </tr>
         
            <tr>
              <td><div align="right"><span class="style2">* </span> Name of the Rotarian</div></td>
              <td><div align="center">:</div></td>
              <td><div align="left"><asp:TextBox ID="txtRotarian" runat="server" Width="400px" 
                      CssClass="txtBox"></asp:TextBox>
                  <asp:CheckBox ID="chkExpired" runat="server" Text="Expired" />
                  <asp:RequiredFieldValidator ID="RFVRot" runat="server" 
                      ControlToValidate="txtRotarian" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't be left blank" ValidationGroup="DG"></asp:RequiredFieldValidator>
                  </div>
              </td>
            </tr>
            
             <tr>
              <td><div align="right"><span class="style2">* </span> Rotary Club of</div></td>
              <td><div align="center">:</div></td>
              <td><div align="left"><asp:TextBox ID="txtClubName" runat="server" Width="400px" 
                      CssClass="txtBox">RC of </asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVClub" runat="server" 
                      ControlToValidate="txtClubName" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't be left blank" ValidationGroup="DG" InitialValue="RC of "></asp:RequiredFieldValidator>
                      <asp:CustomValidator ID="CustomValidator1" runat="server" 
                          ControlToValidate="txtClubName" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="* Already Exists." 
                          onservervalidate="CustomValidator1_ServerValidate" 
                      ValidationGroup="DG"></asp:CustomValidator>
                  </div>
              </td>
            </tr>
          
           
             
             <tr>
              <td><div align="right">Classification</div></td>
              <td><div align="center">:</div></td>
              <td><div align="left">
                  <asp:TextBox ID="txtClassification" runat="server" Width="400px" 
                      CssClass="txtBox"></asp:TextBox>
                  </div>
              </td>
            </tr>


            <tr>
                    <td align="right" valign="top">Upload Image </td>
                <td valign="top"><div align="center">:</div></td>
                    <td align="left" valign="top">
                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png.gif" ChunkSize="0" EnableInlineProgress="true" InputSize="53" MaxFileInputsCount="5" MaxFileSize="307200000" MultipleFileSelection="Disabled" Skin="Silk" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                        </telerik:RadAsyncUpload>
                        <br />
                        <span class="auto-style1"><strong>(Upload only .jpeg, .gif, .png format and 
                  maximum file size is 400 KB )</strong><br />
                            <br />
                            <asp:Image ID="memImg" runat="server" AlternateText="Image"
                                Height="110px" Width="100px" />
                        </span>
                    </td>
                </tr>
          
             <tr>
           <td align="right" valign="top">Add Description</td>
              <td class="style1" valign="top">:</td>
              <td class="style3" valign="top">            

                   <telerik:RadEditor ID="txtData" Runat="server" Width="800px" CssClass="txtBox" EditModes="Design" Skin="Silk">
                       
                       <CssFiles>
                                <telerik:EditorCssFile Value="../css/editor.css" />
                            </CssFiles>

                            <Tools>
                                <telerik:EditorToolGroup>
                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                    <telerik:EditorTool Name="LinkManager"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Unlink"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyFull"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyCenter"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyLeft"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyRight"></telerik:EditorTool>
                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                                </telerik:EditorToolGroup>
                            </Tools>
                    </telerik:RadEditor>
            </td>
        </tr>
             
            <tr>
              <td ><div align="right"></div></td>
              <td><div align="center"></div></td>
              <td><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="DG" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  </div></td>
            </tr>
            
           
          </table>
     
    </ContentTemplate> 
      <Triggers>
          <asp:PostBackTrigger ControlID="btnSubmit" />
      </Triggers>
    </asp:UpdatePanel>
</asp:Content>


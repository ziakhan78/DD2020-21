<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="SendStaticMail.aspx.cs" Inherits="admin_SendStaticMail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>

    <script type="text/javascript">
        function SelectAllCheckboxes(spanChk) {

            // Added as ASPX uses SPAN for checkbox
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;

            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    //elm[i].click();
                    if (elm[i].checked != xState)
                        elm[i].click();
                    //elm[i].checked=xState;
                }
        }
    </script>


    <style type="text/css">
        .style1 {
            width: 102px;
        }

        .style2 {
            width: 130px;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>

<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>--%>
            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td class="header_title" align="center">Send Static Mail</td>
                </tr>

                <tr>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

               
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Presidents" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="District Officers"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RadioButtonList ID="rbtnSort" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnSort_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="All" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="By District Positions"></asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:DropDownList ID="ddlAvenue" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlAvenue_SelectedIndexChanged">
                        </asp:DropDownList>

                    </td>

                </tr>






                <tr>

                    <td>
                        <telerik:RadGrid ID="PresidentGrid" runat="server" AllowPaging="True"                            
                            PageSize="25" GroupPanelPosition="Top" CellSpacing="-1"  GridLines="Both" OnPageIndexChanged="PresidentGrid_PageIndexChanged" >
                            <HeaderContextMenu EnableAutoScroll="True">
                            </HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False" >
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <Columns>


                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>



                                    <telerik:GridTemplateColumn HeaderText="Select" FilterControlToolTip="Select for sending mail" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        
                                             <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="false"
                                                onclick="javascript:SelectAllCheckboxes(this);" TextAlign="Left"
                                                ToolTip="Select/Deselect All" />
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>' Visible="false"></asp:Label>                                            
                                            <asp:CheckBox ID="chkActive" runat="server" TextAlign="Left"></asp:CheckBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name"
                                        SortExpression="Name" UniqueName="Name">
                                        <ItemStyle VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                

                                    <telerik:GridBoundColumn DataField="club_name" HeaderText="Rotary Club of"
                                        SortExpression="club_name" UniqueName="club_name">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="EmailId" HeaderText="Email-Id"
                                        SortExpression="EmailId" UniqueName="EmailId">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>   
                                    
                                                           



                                    <telerik:GridTemplateColumn HeaderText="Mobile" SortExpression="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobile1" runat="server" Text='<%# Eval("Mobile1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="70px" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="70px" />
                                    </telerik:GridTemplateColumn>                                  




                                </Columns>
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>

                       
                    </td>

                </tr>

                <tr>                    

                    <td>
                        <telerik:RadTextBox ID="txtSubject" runat="server" Width="50%" CssClass="txtBox" Skin="Silk" placeholder="Enter Subject">
                        </telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please enter the subject!" ValidationGroup="M"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>                    

                    <td>
                        <telerik:RadTextBox ID="txtCc" runat="server" Width="99%" CssClass="txtBox" Skin="Silk" placeholder="Enter CC email id with comma (,) seprated">
                        </telerik:RadTextBox>
                    </td>
                </tr>

                <tr>                   

                    <td valign="top">
                        <telerik:RadEditor ID="txtMessage" runat="server" Skin="Silk" Width="99%" ExternalDialogsPath="~/RadEditorDialogs/" Height="700px" >
                            <CssFiles>
                                <telerik:EditorCssFile Value="../css/editor.css" />
                            </CssFiles>

                            <%--<Tools>
                                <telerik:EditorToolGroup>
                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>                                  
                                    <telerik:EditorTool Name="Unlink"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyFull"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyCenter"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyLeft"></telerik:EditorTool>
                                    <telerik:EditorTool Name="JustifyRight"></telerik:EditorTool>
                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                                    <telerik:EditorTool Name="InsertLink" />
                                  
                                </telerik:EditorToolGroup>
                            </Tools>--%>

                        </telerik:RadEditor>
                        
                        <br />
                        
                    </td>
                </tr>

                <tr>
                    <td>
                        Attach file: <asp:FileUpload ID="fileUploader" runat="server" /> File size limit is 15 mb.

                       <%--  <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" CssClass="async-attachment" ID="AsyncUpload1"
                HideFileInput="true"
                AllowedFileExtensions=".jpeg,.jpg,.png,.doc,.docx,.xls,.xlsx" /> 
            <span class="allowed-attachments">Select files to upload <span class="allowed-attachments-list">(<%= String.Join( ",", AsyncUpload1.AllowedFileExtensions ) %>)</span>
            </span>
                          <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,jpeg,png,gif,doc,docs,pdf,xls,xlsx" ChunkSize="0" EnableInlineProgress="true" InputSize="56" MaxFileInputsCount="5" MaxFileSize="15728640" MultipleFileSelection="Disabled" Skin="Silk" >
                            </telerik:RadAsyncUpload>--%> 
                    </td>
                </tr>

              <tr>
           
           
            <td align="left">
                <asp:Button ID="btnSendMail" runat="server" Text="Send Mail" CssClass="btn" ValidationGroup="M" OnClick="btnSendMail_Click"  />
               
            </td>
        </tr>
            </table>
       <%-- </ContentTemplate>

    </asp:UpdatePanel>--%>
</asp:Content>




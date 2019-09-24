<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_abbreviation.aspx.cs" Inherits="admin_add_abbreviation" %>
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
               <td colspan="3" class="header_title">Add Abbreviations
            </td>
            </tr>
           <tr>
              <td colspan="3" class="style3"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>
            <tr>
              <td class="style3" ><div align="right" ><span class="style2">*</span> Abbreviation</div></td>
              <td class="style1"  >:</td>
              <td class="style1" >
                
                 <%-- <asp:TextBox ID="txtAbbri" runat="server" Width="150px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVAbb" runat="server" 
                      ControlToValidate="txtAbbri" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>--%>
                      
                      
                      <telerik:RadComboBox ID="txtAbbri" Runat="server"  DataSourceID="DSAbbre" Skin="Silk" 
                          Width="350px" EmptyMessage="Click Here to Enter Abbreviation"
                    DataTextField="abbreviation" DataValueField="id" 
                          EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10"
        ShowMoreResultsBox="True" EnableVirtualScrolling="True">
                </telerik:RadComboBox>
                      <asp:RequiredFieldValidator ID="RFVDesignName" runat="server" 
                          ControlToValidate="txtAbbri" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Can't left blank." ValidationGroup="A"></asp:RequiredFieldValidator>
                      <asp:CustomValidator ID="CustomValidator1" runat="server" 
                          ControlToValidate="txtAbbri" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="* Already Exists." 
                           ValidationGroup="A" onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
         
         
            
             <tr>
              <td class="style3"><div align="right"><span class="style2">* </span>Full Form</div></td>
              <td class="style1">:</td>
              <td class="style1">
                  <asp:TextBox ID="txtFullForm" runat="server" Width="550px" CssClass="txtBox"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVFull" runat="server" 
                      ControlToValidate="txtFullForm" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>
              </td>
            </tr>
          
          
            
             
            <tr>
              <td class="style3" ><div align="right"></div></td>
              <td class="style1">&nbsp;</td>
              <td><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <asp:SqlDataSource ID="DSAbbre" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT * FROM [abbreviations_tbl] ORDER BY [abbreviation]">
                      </asp:SqlDataSource>
                </div></td>
            </tr>           
          </table>
     
 </ContentTemplate>
      <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>





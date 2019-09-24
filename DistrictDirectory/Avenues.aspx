<%@ Page Title="" Language="C#" MasterPageFile="~/DistrictDirectory/AdminDistrictDirectory.master" AutoEventWireup="true" CodeFile="Avenues.aspx.cs" Inherits="DistrictDirectory_Avenues" %>

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    
   
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="3" class="header_title">Add District Designation
            </td>
            </tr>
           <tr>
              <td align="right" colspan="3" ><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr>


             <tr>
              <td  align="right"><span class="style2">* </span> Select Year</td>
              <td class="style1" >:</td>
               <td class="style1">
                    <asp:DropDownList ID="DDLYears" runat="server" CssClass="txt1" AppendDataBoundItems="true" >
                        <asp:ListItem>Select</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVyear" runat="server" 
                        ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" 
                        ErrorMessage="Select Year" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                  </td>
            </tr>
          
          
            
             
            <tr>
              <td ><div align="right" ><span class="style2">*</span> Designation</div></td>
              <td class="style1"  >:</td>
              <td class="style1" >
                
                 <%-- <asp:TextBox ID="txtAbbri" runat="server" Width="150px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVAbb" runat="server" 
                      ControlToValidate="txtAbbri" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Can't left blank" ValidationGroup="A"></asp:RequiredFieldValidator>--%>
                      
                      
                      <telerik:RadComboBox ID="txtDesig" Runat="server"  DataSourceID="DSDesig" 
                          Width="350px" EmptyMessage="Click Here to Enter District Designation"
                    DataTextField="designation" DataValueField="designation" 
                          EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10"
        ShowMoreResultsBox="True" EnableVirtualScrolling="True">
                </telerik:RadComboBox>
                      <asp:RequiredFieldValidator ID="RFVDesignName" runat="server" 
                          ControlToValidate="txtDesig" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Can't left blank." ValidationGroup="A"></asp:RequiredFieldValidator>
                      <asp:CustomValidator ID="CustomValidator1" runat="server" 
                          ControlToValidate="txtDesig" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="* Already Exists." 
                           ValidationGroup="A" onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
         
         
            
           
          
          
            
             
            <tr>
              <td ><div align="right"></div></td>
              <td class="style1">&nbsp;</td>
              <td><div align="left"><asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <asp:SqlDataSource ID="DSDesig" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                          SelectCommand="SELECT distinct designation FROM [distt_designation_tbl] ORDER BY [designation]">
                      </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
          </table>
     
<%--      </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
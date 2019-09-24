<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_hotlinks.aspx.cs" Inherits="admin_add_hotlinks" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        
        .style1
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
              
               <td colspan="4" class="header_title">Add Hot Links</td>
            </tr>
            
            <tr>
              <td colspan="4" align="right"><span class="style1">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
          
            <tr>
              <td align="right" >Add Hot Links For</td>
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
              <td ><div align="right" ><span class="style1">* </span> Title</div></td>
              <td  ><div align="center">:</div></td>
              <td colspan="2" >
                
                  <div align="left">
                      <asp:TextBox ID="txtTitle" runat="server" Width="500px" CssClass="txt1" 
                          MaxLength="65"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RFVtitle" runat="server" 
                          ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic" 
                          ErrorMessage="Enter title" ValidationGroup="HL"></asp:RequiredFieldValidator>
                  </div></td>
            </tr>
         
            <tr>
              <td><div align="right"><span class="style1">* </span> Links</div></td>
              <td><div align="center">:</div></td>
              <td colspan="2">
              <div align="left">
              <asp:TextBox ID="txtlink" runat="server" Width="500px" CssClass="txt1"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVlink" runat="server" 
                      ControlToValidate="txtlink" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Enter link" ValidationGroup="HL"></asp:RequiredFieldValidator>
              </div>
              </td>
            </tr>
          
            
             
            <tr>
              <td width="100px">&nbsp;</td>
              <td><div align="center"></div></td>
              <td colspan="2"><div align="left">&nbsp;<asp:Button ID="btnSubmit" runat="server" TabIndex="63" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="HL" onclick="btnSubmit_Click"  />
                  &nbsp;<asp:Button ID="btncancel" runat="server" TabIndex="64" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" onclick="btncancel_Click"/>
                  <br />
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
            <tr>
                <td width="100px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
           
           
            <tr>
                <td colspan="4" >
                
                
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
               AllowSorting="True" GridLines="None" 
               Skin="WebBlue" PageSize="100">
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

<MasterTableView autogeneratecolumns="False" 
                   DataKeyNames="id">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
    
         
         <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridTemplateColumn>
        
        <telerik:GridBoundColumn DataField="title" HeaderText="Title" HeaderStyle-Font-Underline="true"
            SortExpression="title" UniqueName="title">
            <HeaderStyle Width="345px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="345px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>
        
        <telerik:GridTemplateColumn HeaderText="Links">
        <ItemTemplate >
        <a href='<%# Eval("link_file") %>' target="_blank"><%# Eval("link_file")%></a>
        </ItemTemplate>
        
        <HeaderStyle Width="400px" HorizontalAlign="Left" Font-Bold="true" />
        <ItemStyle Width="400px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridTemplateColumn>
        
         <%--<telerik:GridBoundColumn DataField="status" HeaderText="Status" HeaderStyle-Font-Underline="true"
            SortExpression="status" UniqueName="status">
            <HeaderStyle Width="50px" HorizontalAlign="Left" Font-Bold="true" />
            <ItemStyle Width="50px" HorizontalAlign="Left" VerticalAlign="Top" />
        </telerik:GridBoundColumn>--%>
      
      
        
    
      
    </Columns>
</MasterTableView>
               <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
           </telerik:RadGrid>
                </td>
            </tr>
            
            <tr>
                <td align="center" colspan="4">  <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"  
                style="font-weight:bold; font-size:14px; color:#FF0000; background-color:Black; padding:5px 5px 5px 5px;"></asp:Label></td>
            </tr>
          

          </table>
</ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="btnSubmit" />
</Triggers>
    </asp:UpdatePanel>

</asp:Content>




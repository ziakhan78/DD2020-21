<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="MembersGoogleReports.aspx.cs" Inherits="admin_MembersGoogleReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" style="vertical-align: top;">

                <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">



                    <tr>
                        <td class="header_title">Inbounds</td>
                    </tr>



                  <%--  <tr>
                        <td align="left">
                            <asp:Panel ID="Pid" runat="server" GroupingText="Sort By">
                                <table>
                                    <tr>
                                        <td width="310"><b>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                                RepeatDirection="Horizontal" AutoPostBack="True"
                                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">Inbound</asp:ListItem>
                                                <asp:ListItem Value="1">Outbound</asp:ListItem>
                                              
                                            </asp:RadioButtonList></b>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>--%>


                    <tr>
                        <td align="left">


                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="DSInbound">
<Columns>
    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="200" />
    <asp:BoundField DataField="emailId" HeaderText="EmailId" ItemStyle-Width="250" />
        
</Columns>
</asp:GridView>
                             <asp:SqlDataSource ID="DSInbound" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="select club_name, name, mobile1, emailid from ViewMembers where district_no='3141' and MemType='Active' order by club_name, name"></asp:SqlDataSource>

<br />
<asp:Button Text="Export" OnClick="ExportTextFile" runat="server" CssClass="btn" />

                          
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblError" runat="server" Text="No records to display"
                                Visible="false"></asp:Label>
                        </td>
                    </tr>

                  
                </table>

            </div>
</asp:Content>


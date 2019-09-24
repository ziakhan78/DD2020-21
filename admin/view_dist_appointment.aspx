<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_dist_appointment.aspx.cs" Inherits="admin_view_dist_appointment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="2" class="header_title">View District Appointment
                    </td>
                </tr>
                <!-- search and sort start -->

                <tr>
                    <td valign="top" class="style5" align="left">
                        <table width="170">
                            <tr>
                                <td valign="top" align="center" style="width: 195px; border-right: #f4f4f4 1px solid; border-top: #f4f4f4 1px solid; border-left: #f4f4f4 1px solid; border-bottom: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                                    <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="border-collapse: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
                                        <tr>
                                            <td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'"
                                                onmouseout="this.style.backgroundColor='#f9f9f9'" align="center">
                                                <asp:LinkButton ID="LnkA" runat="server" OnClick="LnkA_Click" CssClass="txtSearch">A</asp:LinkButton></td>
                                            <td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkB" runat="server"
                                                    OnClick="LnkB_Click" CssClass="txtSearch">B</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkC" runat="server"
                                                    OnClick="LnkC_Click" CssClass="txtSearch">C</asp:LinkButton>

                                            </td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkD" runat="server"
                                                    OnClick="LnkD_Click" CssClass="txtSearch">D</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkE" runat="server"
                                                    OnClick="LnkE_Click" CssClass="txtSearch">E</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkF" runat="server"
                                                    OnClick="LnkF_Click" CssClass="txtSearch">F</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkG" runat="server"
                                                    OnClick="LnkG_Click" CssClass="txtSearch">G</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkH" runat="server"
                                                    OnClick="LnkH_Click" CssClass="txtSearch">H</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkI" runat="server"
                                                    OnClick="LnkI_Click" CssClass="txtSearch">I</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkJ" runat="server"
                                                    OnClick="LnkJ_Click" CssClass="txtSearch">J</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkK" runat="server"
                                                    OnClick="LnkK_Click" CssClass="txtSearch">K</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkL" runat="server"
                                                    OnClick="LnkL_Click" CssClass="txtSearch">L</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkM" runat="server"
                                                    OnClick="LnkM_Click" CssClass="txtSearch">M</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkN" runat="server" OnClick="LnkN_Click" CssClass="txtSearch">N</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkO" runat="server"
                                                    OnClick="LnkO_Click" CssClass="txtSearch">O</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkP" runat="server"
                                                    OnClick="LnkP_Click" CssClass="txtSearch">P</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkQ" runat="server"
                                                    OnClick="LnkQ_Click" CssClass="txtSearch">Q</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkR" runat="server"
                                                    OnClick="LnkR_Click" CssClass="txtSearch">R</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkS" runat="server"
                                                    OnClick="LnkS_Click" CssClass="txtSearch">S</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkT" runat="server"
                                                    OnClick="LnkT_Click" CssClass="txtSearch">T</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkU" runat="server"
                                                    OnClick="LnkU_Click" CssClass="txtSearch">U</asp:LinkButton></td>
                                        </tr>
                                        <tr>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkV" runat="server"
                                                    OnClick="LnkV_Click" CssClass="txtSearch">V</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkW" runat="server"
                                                    OnClick="LnkW_Click" CssClass="txtSearch">W</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkX" runat="server"
                                                    OnClick="LnkX_Click" CssClass="txtSearch">X</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkY" runat="server"
                                                    OnClick="LnkY_Click" CssClass="txtSearch">Y</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="LnkZ" runat="server"
                                                    OnClick="LnkZ_Click" CssClass="txtSearch">Z</asp:LinkButton></td>
                                            <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                align="center">
                                                <asp:LinkButton ID="Linkbutton1" runat="server"
                                                    OnClick="Linkbutton1_Click" CssClass="txtSearch">ALL</asp:LinkButton>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>




                    <td valign="top" width="380px" align="right">
                        <asp:Panel ID="SearchPanel" runat="server" DefaultButton="btnSearch">
                            <table style="text-align: right;" width="380px">

                                <tr>
                                    <td valign="top" align="center" style="border: 1px solid #f4f4f4;"
                                        bgcolor="#f4f4f4" class="style1">
                                        <b>&nbsp; ::&nbsp;Search By ::</b>
                                    </td>
                                </tr>
                                <tr>

                                    <td valign="top" align="right" width="100%">
                                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
                                            <table width="100%">


                                                <tr>
                                                    <td valign="top" bordercolor="#ffffff" align="left">
                                                        <asp:RadioButtonList ID="rbtnSearch" runat="server" AutoPostBack="true"
                                                            RepeatDirection="Horizontal"
                                                            OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">Name</asp:ListItem>
                                                            <asp:ListItem Value="1">Club Name</asp:ListItem>
                                                            <asp:ListItem Value="2">Email</asp:ListItem>
                                                            <asp:ListItem Value="3">Mobile</asp:ListItem>


                                                        </asp:RadioButtonList>

                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td valign="top" bordercolor="#ffffff" align="left">
                                                        <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                            BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                        <asp:DropDownList ID="DDLClubName" runat="server" AppendDataBoundItems="true"
                                                            AutoPostBack="True" CssClass="txtBox" DataSourceID="DSDistClubNo"
                                                            DataTextField="club_name" DataValueField="id"
                                                            OnSelectedIndexChanged="DDLClubName_SelectedIndexChanged">
                                                            <asp:ListItem>Select Club Name</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                                            OnClick="btnSearch_Click" Text="Search" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <asp:Panel ID="PanelSort" runat="server" Width="100%" GroupingText="">
                            <table align="left" width="100%">
                                <tr>

                                    <td width="70%">
                                        <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlAvenue" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlAvenue_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>


                                    <td width="30%" align="right">
                                        <asp:Button ID="btnSendMailtoAG" runat="server" CssClass="btn"
                                             Text="Send Mail to AG" OnClick="btnSendMailtoAG_Click"  />
                                        &nbsp;<asp:Button ID="btnSendDta" runat="server" CssClass="btn"
                                             Text="Send DTA" OnClick="btnSendDta_Click" /> &nbsp;<asp:Button ID="btnSendLoginPass" runat="server" CssClass="btn" OnClick="btnSendLoginPass_Click" Text="Send Appointment Letter" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </td>
                </tr>
                <!-- search and sort end -->

                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True"
                            GridLines="None" OnItemCommand="RadGrid1_ItemCommand"
                            OnPageIndexChanged="RadGrid1_PageIndexChanged"
                            OnPageSizeChanged="RadGrid1_PageSizeChanged"
                            OnSortCommand="RadGrid1_SortCommand"
                            PageSize="100" Skin="Default" OnItemDataBound="RadGrid1_ItemDataBound">
                            <HeaderContextMenu EnableAutoScroll="True">
                            </HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False">
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
                                            <asp:Label ID="lblMemId" runat="server" Text='<%# Eval("MemberId") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblMemName" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblClubName" runat="server" Text='<%# Eval("club_name") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblAvenue" runat="server" Text='<%# Eval("avenue") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("position") %>' Visible="false"></asp:Label>
                                            <asp:CheckBox ID="chkActive" runat="server" TextAlign="Left"></asp:CheckBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" onclick="MM_openBrWindow('view_member_details.aspx?id=<%# Eval("MemberId") %>','01111','width=850, height=850')"><%# Eval("Name") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>



                                    <%--   <telerik:GridBoundColumn DataField="DistrictClubNo" DataType="System.Int32" 
                                                            HeaderText="Club No." SortExpression="DistrictClubNo" 
                                                            UniqueName="DistrictClubNo">
                                                            <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="50px" />
                                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
                                                        </telerik:GridBoundColumn>--%>

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

                                    <%--  <telerik:GridBoundColumn DataField="position_held_on" HeaderText="Type"
                                        SortExpression="position_held_on" UniqueName="position_held_on">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>--%>

                                    <telerik:GridBoundColumn DataField="avenue" HeaderText="Avenue"
                                        SortExpression="avenue" UniqueName="avenue">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="position" HeaderText="Position"
                                        SortExpression="position" UniqueName="position">
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


                                    <telerik:GridBoundColumn DataField="mail_status" HeaderText="Status"
                                        SortExpression="mail_status" UniqueName="mail_status">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>


                                    <%--  <telerik:GridBoundColumn DataField="MembershipNo" HeaderText="RI MemNo."
                                        SortExpression="MembershipNo" UniqueName="MembershipNo">
                                        <HeaderStyle Font-Bold="true" Width="70px" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="70px" VerticalAlign="Top" />
                                    </telerik:GridBoundColumn>--%>

                                    <%-- <telerik:GridTemplateColumn HeaderText="RI MemNo." SortExpression="MembershipNo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemNo" runat="server" Text='<%# Eval("MembershipNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" Width="60px" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="60px" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>--%>



                                    <%-- <telerik:GridBoundColumn DataField="doj" HeaderText="Joined On" DataFormatString="{0:dd MMM, yyyy}"
                                        SortExpression="doj" UniqueName="doj" DataType="System.DateTime">
                                        <HeaderStyle Width="80px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="80px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>--%>

                                    <%--  <telerik:GridTemplateColumn HeaderText="Joined On" SortExpression="doj">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldoj" runat="server" Text='<%# Eval("doj") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="90px" HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle Width="90px" HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>


                                    <%--  <telerik:GridBoundColumn DataField="TRF_Amt" HeaderText="TRF"  DataFormatString="{0:n}"
                                                            SortExpression="TRF_Amt" UniqueName="TRF_Amt">
                                                            <HeaderStyle Font-Bold="true" HorizontalAlign="Left"  />
                                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  />
                                                        </telerik:GridBoundColumn>--%>


                                    <%-- <telerik:GridTemplateColumn HeaderText="TRF">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltrf" runat="server" Text='<%# Eval("TrfAmt") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="TRF" HeaderText="TRF Status"
                                        SortExpression="TRF" UniqueName="TRF">
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="70px" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="70px" />
                                    </telerik:GridBoundColumn>--%>





                                    <%--   <telerik:GridTemplateColumn HeaderText="Status" SortExpression="MemType">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("MemberId") %>' Visible="false"></asp:Label>                                           
                                            <asp:Label ID="lblMemStatus" runat="server" Text='<%# Eval("MemType") %>' Visible="false"></asp:Label>
                                           

                                            <asp:DropDownList ID="chkMemActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkMemActive_SelectedIndexChanged">                                               
                                                <asp:ListItem>Active</asp:ListItem>
                                                <asp:ListItem>Honorary</asp:ListItem>
                                                <asp:ListItem>Inactive</asp:ListItem>                                                         
                                            </asp:DropDownList>                                         

                                        </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" ></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>


                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                        <ItemTemplate>
                                            <a href='add_dist_appointment.aspx?id=<%# Eval("id") %>'>
                                                <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" />
                                            </a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                    </telerik:GridTemplateColumn>



                                    <telerik:GridTemplateColumn AllowFiltering="false"
                                        HeaderStyle-Font-Underline="false" HeaderText="Action">
                                        <ItemTemplate>

                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"
                                                ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                            </cc1:ConfirmButtonExtender>
                                            <asp:ImageButton ID="imgDeleteP" runat="Server" AlternateText="Delete"
                                                CommandArgument='<%# Eval("id") %>' CommandName="Delete"
                                                ImageUrl="~/admin_icons/delete.gif" ToolTip="Delete" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <div align="left">
                        </div>

                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." CssClass="txt_validation"
                            Style="font-weight: 700"></asp:Label>
                        <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [clubs_tbl] order by club_name asc"></asp:SqlDataSource>
                        <%--  <asp:SqlDataSource ID="DSDistt3140Mem" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnStringridist3140 %>" 
                SelectCommand="SELECT ROW_NUMBER () OVER (ORDER BY Name asc) AS RowNumber, * FROM [View_Disttt3140Members]">
            </asp:SqlDataSource>--%>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


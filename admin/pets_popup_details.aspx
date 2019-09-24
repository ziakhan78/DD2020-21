<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pets_popup_details.aspx.cs" Inherits="admin_pets_popup_details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div style="overflow: auto; height: 600px; width: 620px; text-align:left;background-color:#ffffff;">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" CssClass="txt"
                                 AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                                 DataSourceID="dsPrePets" ForeColor="#333333" GridLines="None" Height="50px" 
                                 Width="600px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    
            <Fields>
              <%--  <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="club_id" HeaderText="club_id" 
                    SortExpression="club_id" />--%>
                <asp:BoundField DataField="club_name" HeaderText="Club Name : " 
                    SortExpression="club_name" />
               <%-- <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />--%>
                <asp:BoundField DataField="name" HeaderText="Name : " SortExpression="name" />
               
                <asp:BoundField DataField="badge_name" HeaderText="Badge / Call Name : " 
                    SortExpression="badge_name" />
                <asp:BoundField DataField="classification" HeaderText="Classification : " 
                    SortExpression="classification" />
                <asp:BoundField DataField="spouse_name" HeaderText="Spouse Name : " 
                    SortExpression="spouse_name" />
                <asp:BoundField DataField="spouse_badge_name" HeaderText="Spouse Badge / Call Name : " 
                    SortExpression="spouse_badge_name" />
                <asp:BoundField DataField="food_preferences" HeaderText="Food Preferences :" 
                    SortExpression="food_preferences" />
                <asp:BoundField DataField="tshirt_size" HeaderText="T-Shirt Size : " 
                    SortExpression="tshirt_size" />
                <asp:BoundField DataField="address" HeaderText="Address : " SortExpression="address" />
              
                <asp:BoundField DataField="citypin" HeaderText="City Pin : " SortExpression="citypin" />
                <asp:BoundField DataField="phone_resi" HeaderText="Phone (Resi.) : " 
                    SortExpression="phone_resi" />
                <asp:BoundField DataField="phone_offi" HeaderText="Phone (Office) : " 
                    SortExpression="phone_offi" />
                <asp:BoundField DataField="mobile" HeaderText="Mobile :" 
                    SortExpression="mobile" />
                <asp:BoundField DataField="emailId" HeaderText="Email-Id : " 
                    SortExpression="emailId" />
                <asp:BoundField DataField="payment_type" HeaderText="Payment Type :" 
                    SortExpression="payment_type" />
                <asp:BoundField DataField="amount" HeaderText="Amount : " 
                    SortExpression="amount" />
                <asp:BoundField DataField="bank_name" HeaderText="Bank Name : " 
                    SortExpression="bank_name" />
                <asp:BoundField DataField="branch_name" HeaderText="Branch Name : " 
                    SortExpression="branch_name" />
                <asp:BoundField DataField="cheque_no" HeaderText="Cheque No. : " 
                    SortExpression="cheque_no" />
                <asp:BoundField DataField="cheque_date" HeaderText="Cheque Date : " 
                    SortExpression="cheque_date" DataFormatString="{0:dd-MM-yyyy}" />
               <%-- <asp:BoundField DataField="added_date" HeaderText="added_date" 
                    SortExpression="added_date" />--%>
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right"  />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsPrePets" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnString %>" 
            SelectCommand="SELECT * FROM [View_PrePETS] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                     </asp:SqlDataSource>

               <div align="center">
                    <a href="javascript:self.close()">
                        <img src="../images/close.jpg" name="Image1" border="0" id="Image1"  />
                    </a>
                </div>
    
    </div>
    </div>
    </form>
</body>
</html>

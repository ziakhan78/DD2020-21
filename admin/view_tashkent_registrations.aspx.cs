using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Telerik.Web.UI;

public partial class admin_view_tashkent_registrations : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                ddlClub.Visible = false;
                txtName.Visible = true;
                btnSearch.Visible = true;
                BindClub();

                bool b = true;
                if (b == true)
                {
                    Session["name"] = null;
                    Session["value"] = null;
                    Session["searchField"] = null;
                    Session["clubname"] = null;
                    b = false;
                }
                lblMsg.Visible = false;
                permission();
                ManageGrid();
               
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    #region Search Start

    protected void LnkA_Click(object sender, EventArgs e)
    {
        string val = "A";
        SearchByAlphabet(val);
    }
    protected void LnkB_Click(object sender, EventArgs e)
    {
        string val = "B";
        SearchByAlphabet(val);
    }
    protected void LnkC_Click(object sender, EventArgs e)
    {
        string val = "C";
        SearchByAlphabet(val);
    }
    protected void LnkD_Click(object sender, EventArgs e)
    {
        string val = "D";
        SearchByAlphabet(val);
    }
    protected void LnkE_Click(object sender, EventArgs e)
    {
        string val = "E";
        SearchByAlphabet(val);
    }
    protected void LnkF_Click(object sender, EventArgs e)
    {
        string val = "F";
        SearchByAlphabet(val);
    }
    protected void LnkG_Click(object sender, EventArgs e)
    {
        string val = "G";
        SearchByAlphabet(val);
    }
    protected void LnkH_Click(object sender, EventArgs e)
    {
        string val = "H";
        SearchByAlphabet(val);
    }
    protected void LnkI_Click(object sender, EventArgs e)
    {
        string val = "I";
        SearchByAlphabet(val);
    }
    protected void LnkJ_Click(object sender, EventArgs e)
    {
        string val = "J";
        SearchByAlphabet(val);
    }
    protected void LnkK_Click(object sender, EventArgs e)
    {
        string val = "K";
        SearchByAlphabet(val);
    }
    protected void LnkL_Click(object sender, EventArgs e)
    {
        string val = "L";
        SearchByAlphabet(val);
    }
    protected void LnkM_Click(object sender, EventArgs e)
    {
        string val = "M";
        SearchByAlphabet(val);
    }
    protected void LnkN_Click(object sender, EventArgs e)
    {
        string val = "N";
        SearchByAlphabet(val);
    }
    protected void LnkO_Click(object sender, EventArgs e)
    {
        string val = "O";
        SearchByAlphabet(val);
    }
    protected void LnkP_Click(object sender, EventArgs e)
    {
        string val = "P";
        SearchByAlphabet(val);
    }
    protected void LnkQ_Click(object sender, EventArgs e)
    {
        string val = "Q";
        SearchByAlphabet(val);
    }
    protected void LnkR_Click(object sender, EventArgs e)
    {
        string val = "R";
        SearchByAlphabet(val);
    }
    protected void LnkS_Click(object sender, EventArgs e)
    {
        string val = "S";
        SearchByAlphabet(val);
    }
    protected void LnkT_Click(object sender, EventArgs e)
    {
        string val = "T";
        SearchByAlphabet(val);
    }
    protected void LnkU_Click(object sender, EventArgs e)
    {
        string val = "U";
        SearchByAlphabet(val);
    }
    protected void LnkV_Click(object sender, EventArgs e)
    {
        string val = "V";
        SearchByAlphabet(val);
    }
    protected void LnkW_Click(object sender, EventArgs e)
    {
        string val = "W";
        SearchByAlphabet(val);
    }
    protected void LnkX_Click(object sender, EventArgs e)
    {
        string val = "X";
        SearchByAlphabet(val);
    }
    protected void LnkY_Click(object sender, EventArgs e)
    {
        string val = "Y";
        SearchByAlphabet(val);
    }
    protected void LnkZ_Click(object sender, EventArgs e)
    {
        string val = "Z";
        SearchByAlphabet(val);
    }
    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        string val = "ALL";
        SearchByAlphabet(val);
    }


    #endregion

    private void SearchByAlphabet(string name)
    {
        Session["name"] = null;
        Session["value"] = null;
        Session["searchField"] = null;
        Session["clubname"] = null;

        Session["name"] = name;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetTashkentReg";
        obj.AddParam("@name", name);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["name"] = null;
        Session["value"] = null;
        Session["searchField"] = null;
        Session["clubname"] = null;

        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "Name";
        }        


        string val = txtName.Text.Trim().ToString();
        Session["searchField"] = searchField.ToString();
        Session["value"] = val;
        SearchGrid(searchField, val);
    }
    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_TashkentRegistrations] where " + searchField + " like  '%'+'" + pname + "'+ '%' ";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void SearchGrid(string clubName)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_TashkentRegistrations] where club_name='" + clubName + "'";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_TashkentRegistrations]";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void ManageGrid()
    {
        try
        {

            if (Session["searchField"] != null)
            {
                SearchGrid(Session["searchField"].ToString(), Session["value"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["name"] != null)
            {
                SearchByAlphabet(Session["name"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["clubname"] != null)
            {
                SearchGrid(Session["clubname"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }
            else
            {
                try
                {
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

                    BindGrid();
                }
                catch
                {
                    BindGrid();
                }
            }
        }
        catch (Exception ex) { }
    }

    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [Users]";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }

    protected void chkActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int id = 0;
            string strC = "";

            DropDownList dropdownlist1 = (DropDownList)sender;

            GridDataItem item1 = (GridDataItem)dropdownlist1.NamingContainer;
            Label lblId = (Label)item1.FindControl("lblId");
            id = Int32.Parse(lblId.Text.ToString());

            strC = dropdownlist1.SelectedItem.Text;
            DBconnection con = new DBconnection();
            con.SetCommandQry = "update View_TashkentRegistrations set payment_status='" + strC + "' where  id=" + id;
            int exe = con.ExecuteNonQuery();
        }
        catch { }
    }   

    protected void btnSendReceipt_Click(object sender, EventArgs e)
    {
        int id = 0;
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkMail");
                // Label lblcid = (Label)item.FindControl("lblcid");

                Label lblbookingNo = (Label)item.FindControl("lblbookingNo");

                if (chkbox.Checked)
                {
                    id = Int32.Parse(lblbookingNo.Text.ToString());
                    GetForm(id);
                }
                chkbox.Checked = false;
            }
            catch(Exception ex) { }
        }
    }
    private void GetForm(int regNo)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_TashkentRegistrations] where registration_no=" + regNo + "";
       // obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string strRegDt = "";
            string strChequeDt = "";

            strRegDt = dt.Rows[0]["added_date"].ToString();
            string strRegNo = dt.Rows[0]["registration_no"].ToString();
            string strRegFrom = dt.Rows[0]["registration_type"].ToString();
            string strRegFor = dt.Rows[0]["registration_for"].ToString();
            string strClubname = dt.Rows[0]["club_name"].ToString();          
            string strName = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            string strEmail = dt.Rows[0]["emailId"].ToString();
            string strIp = dt.Rows[0]["ipaddress"].ToString();
            string strAmt = dt.Rows[0]["amount"].ToString();
            string balanceAmount = dt.Rows[0]["balance_amt"].ToString();
            // bank details
            string strPaymentType = dt.Rows[0]["payment_type"].ToString();
            string strBank = dt.Rows[0]["bank_name"].ToString();
            if (strBank == "Select")
                strBank = "";
            string strBranch = dt.Rows[0]["branch_name"].ToString();
            string strChequeNo = dt.Rows[0]["cheque_no"].ToString();
            try
            {
                strChequeDt = dt.Rows[0]["cheque_date"].ToString();
            }
            catch { }


            SendMailtoClient(strRegNo, strRegDt, strRegFor, strRegFrom, strClubname, strName, strEmail, strPaymentType, strAmt, strIp, strBank, strBranch,
                strChequeNo, strChequeDt, balanceAmount);
        }
    }

    private void SendMailtoClient(string strRegNo, string strRegDt, string strRegFor, string strRegFrom, string strClubname, string strName, string strEmail,
        string strPaymentType, string strAmt, string strIp, string strBankname, string strBranch, string strChequeNo, string strChequeDt, string balance_amount)
    {
        try
        {
            decimal amt, balAmt = 0;
            string ReadFileName = "";
            MailMessage mail = new MailMessage();

            mail.To.Add(strEmail);
            mail.Bcc.Add("devang.rotary@goradiainfotech.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("tashkent@rotarydist3141.com");

            mail.Subject = "Tashkent 4N5D Tour Registration - 19 March to 23 March 2017";

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");

            ReadFileName = PathVal + "Tashkent\\registration.htm";

            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("XXXclub", strClubname);

            strMessage = strMessage.Replace("XXXdt", DateTime.Parse(strRegDt).ToString("dd MMMM yyyy 'at' hh:mm:ss tt"));
            strMessage = strMessage.Replace("XXXmem", strName);
            strMessage = strMessage.Replace("XXXregisno", strRegNo);
            strMessage = strMessage.Replace("XXXregisFor", strRegFor);

            amt = decimal.Parse(strAmt);
            strMessage = strMessage.Replace("XXXamt", amt.ToString("n0"));

            //strMessage = strMessage.Replace("XXXfor", strRegFrom);

            if (strRegFrom == "Delhi-Tashkent-Delhi the cost is Rs. 43,000")
            {
                strMessage = strMessage.Replace("XXXfor", "Delhi - Tashkent - Delhi");
            }
            else
            {
                strMessage = strMessage.Replace("XXXfor", "Delhi - Tashkent - Delhi with overnight stay");

            }

            if (balance_amount == "0")
            {
                strMessage = strMessage.Replace("XXXbal", "");
            }
            else
            {
                balAmt = decimal.Parse(balance_amount); 
                strMessage = strMessage.Replace("XXXbal", "Balance amount is: " + "&#x20B9;<strong>" + balAmt.ToString("n0") + "</strong>");
            }

            strMessage = strMessage.Replace("XXXmode", strPaymentType);
            strMessage = strMessage.Replace("XXXbank", strBankname);
            strMessage = strMessage.Replace("XXXbranch", strBranch);
            strMessage = strMessage.Replace("XXXchqNo", strChequeNo);
            strMessage = strMessage.Replace("XXXdate", Convert.ToDateTime(strChequeDt.ToString()).ToString("dd MMMM yyyy"));
            strMessage = strMessage.Replace("XXXip", strIp);

            mail.Body = strMessage;
            sr1.Close();

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("tashkent@rotarydist3141.com", "T#5x8hK$9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);


            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("tashkent@rotarydist3141.com", "T#5x8hK$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);


            string jv = "<script>alert('Your Form Has Been Submited Successfully.');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

    decimal total = 0; decimal actualTotal; decimal balTotal; decimal receivedTotal; decimal totalMem;
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = e.Item as GridDataItem;
            string payment1 = dataItem["actual_amt"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue1 = decimal.Parse(payment1);
                actualTotal += fieldValue1;
            }

            string payment2 = dataItem["amount"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue2 = decimal.Parse(payment2);
                balTotal += fieldValue2;
            }

            string payment3 = dataItem["balance_amt"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue3 = decimal.Parse(payment3);
                receivedTotal += fieldValue3;
            }

            string strRegFor = dataItem["registration_for"].Text;

            if (strRegFor == "Couple")
                totalMem = totalMem + 2;
            else
                totalMem = totalMem + 1;


            //Label lblSpouse = (Label)e.Item.FindControl("lblSpouse");
            //if (lblSpouse != null)
            //    Session["Spouse"] = lblSpouse.Text;

            //Label lblMember = (Label)e.Item.FindControl("lblMember");
            //if (lblMember != null)
            //    Session["Member"] = lblMember.Text;

            //Label lblTotal = (Label)e.Item.FindControl("lblTotal");
            //if (lblTotal != null)
            //    Session["Total"] = lblTotal.Text;
        }

        if (e.Item is GridFooterItem)
        {
            //Label lblTotalSpouse = e.Item.FindControl("lblTotalSpouse") as Label;
            //Label lblTotalMember = e.Item.FindControl("lblTotalMember") as Label;
            //Label lblTotals = e.Item.FindControl("lblTotals") as Label;
            //lblTotalMember.Text = "Members: " + Session["Member"].ToString();
            //lblTotalSpouse.Text = "Spouses: " + Session["Spouse"].ToString();
            //lblTotals.Text = "Total: " + Session["Total"].ToString();

            GridFooterItem footerItem = e.Item as GridFooterItem;
            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["actual_amt"].Text = actualTotal.ToString("n0");

            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["amount"].Text = balTotal.ToString("n0");

            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["balance_amt"].Text = receivedTotal.ToString("n0");

            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["registration_for"].Text = totalMem.ToString("n0");
        }

        try
        {
            DropDownList chkStatus = (DropDownList)e.Item.FindControl("chkActive");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");

            if (lblStatus != null)
            {
                string strStatus = lblStatus.Text;

                if (strStatus == "Pending")
                    chkStatus.SelectedIndex = 0;
                if (strStatus == "Received Adv")
                    chkStatus.SelectedIndex = 1;
                if (strStatus == "Received Full")
                    chkStatus.SelectedIndex = 2;
            }
        }
        catch { }
    }

    private void BindClub()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT distinct club_name FROM [View_TashkentRegistrations] order by club_name";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlClub.Items.Clear();
            ddlClub.DataTextField = "club_name";
            ddlClub.DataValueField = "club_name";
            ddlClub.DataSource = dt;
            ddlClub.DataBind();
            ddlClub.Items.Insert(0, "Select");
        }

        else
        {
            ddlClub.Items.Clear();
            ddlClub.Items.Insert(0, "Select");
        }
    }

    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlClub.SelectedIndex = 0;
        txtName.Text = "";
        if(rbtnSearch.SelectedIndex==0)
        {
            ddlClub.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }
        else
        {
            ddlClub.Visible = true;
            txtName.Visible = false;
            btnSearch.Visible = false;
        }

    }

    protected void ddlClub_SelectedIndexChanged(object sender, EventArgs e)
    {
        string clubName = ddlClub.SelectedItem.Text.ToString();
        Session["name"] = null;
        Session["value"] = null;
        Session["searchField"] = null;
        Session["clubname"] = clubName;

        SearchGrid(clubName);
    }
}

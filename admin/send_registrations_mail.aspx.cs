using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_send_registrations_mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = false;
            PanelDate.Visible = false;

            if (!IsPostBack)
            {
                //  rbtnSearch.ClearSelection();
                bool b = true;
                if (b = true)
                {
                    Session["SearchField"] = null;
                    Session["SearchBy"] = null;
                    Session["SearchByAlphabetic"] = null;
                    Session["SortBy"] = null;
                    Session["SortByDateRange"] = null;

                    b = false;
                }

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
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Send Email")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            GetForm(id);
            
        }
    }
    private void GetForm(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetRegistration";
       

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string strRegDt = "";
            string strUtrDt = "";
            string strChequeDt = "";


            string strCategory = dt.Rows[0]["category"].ToString();
            try
            {
                strRegDt = dt.Rows[0]["registration_date"].ToString();
            }
            catch { }

            string strScheemCat = "";
            try
            {

                Decimal regSingleFees, regSpouseFees, regCoupleFees = 0;
                DBconnection cmd = new DBconnection();
                cmd.SetCommandSP = "z_GetRegistrationFeesAdmin";
                cmd.AddParam("@member_type", strCategory);
                cmd.AddParam("@reg_date", DateTime.Parse(strRegDt));
                DataTable dt1 = new DataTable();
                dt1 = cmd.ExecuteTable();
                if (dt1.Rows.Count > 0)
                {
                    strScheemCat = dt1.Rows[0]["category"].ToString();

                }
            }
            catch { }




            string strRegNo = dt.Rows[0]["booking_id"].ToString();



            string strClubname = dt.Rows[0]["club_name"].ToString();

            string strRegFor = dt.Rows[0]["registration_for"].ToString();
            string strDistNo = dt.Rows[0]["district_no"].ToString();
            string strRegType = dt.Rows[0]["registration_type"].ToString();
            string strName = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            string strBadgename = dt.Rows[0]["badge_name"].ToString();
            string strEmail = dt.Rows[0]["emailId"].ToString();
            string strIp = dt.Rows[0]["ipaddress"].ToString();

            // string strActualAmt = dt.Rows[0]["amount"].ToString();
            // string strDiscount = dt.Rows[0]["discount_amount"].ToString();
            string strAmt = dt.Rows[0]["applicable_amount"].ToString();


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

            string strUtr = dt.Rows[0]["neft_utr_no"].ToString();

            try
            {
                strUtrDt = dt.Rows[0]["neft_utr_date"].ToString();
            }
            catch { }

            string strCardtype = dt.Rows[0]["card_type"].ToString();
            string strCardNo = dt.Rows[0]["card_no"].ToString();
            string strExMonth = dt.Rows[0]["expiry_month"].ToString();
            if (strExMonth == "Month")
                strExMonth = "";
            string strExYear = dt.Rows[0]["expiry_year"].ToString();
            if (strExYear == "Year")
                strExYear = "";

            string strExDate = "";
            strExDate = strExMonth + " " + strExYear;


            string balanceAmount = dt.Rows[0]["balance_amount"].ToString();


            SendMailtoClient(strRegNo, strRegDt, strCategory, strRegFor, strDistNo, strRegType, strName, strBadgename, strEmail, strPaymentType, strAmt, strIp, strClubname, strBank, strBranch,
                strChequeNo, strChequeDt, strUtr, strUtrDt, strScheemCat, strCardtype, strCardNo, strExDate, balanceAmount);
        }
    }
    protected void chkActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = 0;
        // string email, Pass = ""; 
        try
        {
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {

                DropDownList chkbox = (DropDownList)item.FindControl("chkActive");
                Label lblId = (Label)item.FindControl("lblId");

                //Label lblEmail = (Label)item.FindControl("lblEmail");

                string strC = chkbox.SelectedItem.Text.Trim();
                if (strC != "Select")
                {
                    if (strC == "Active")
                        strC = "True";
                    if (strC == "Inactive")
                        strC = "False";

                    id = Int32.Parse(lblId.Text.ToString());
                    //email = lblEmail.Text.ToString();
                    if (id != 0)
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "update testimonials_tbl set status='" + strC + "' where  id=" + id;
                            int exe = con.ExecuteNonQuery();

                        }
                        catch { }
                    }
                }
                chkbox.SelectedIndex = 0;
            }
            RadGrid1.DataBind();
        }
        catch { }

    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        DropDownList chkbox = (DropDownList)e.Item.FindControl("chkActive");
        Label lblStatus = (Label)e.Item.FindControl("lblStatus");

        if (lblStatus != null)
        {
            string b = lblStatus.Text;

            if (b == "True")
                chkbox.SelectedIndex = 0;
            if (b == "False")
                chkbox.SelectedIndex = 1;
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

    private void SearchByAlphabet(string firstName)
    {
        txtName.Text = "";
        //rbtnSearch.ClearSelection();

        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlphabetic"] = firstName;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabet";
        obj.AddParam("@fname", firstName);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SearchByAlfhabetic"] = null;

        string searchField = "";
        string val = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "booking_id";
            val = txtName.Text.Trim();
        }
        if (i == 1)
        {
            searchField = "name";
            val = txtName.Text.Trim();
        }

        if (i == 2)
        {
            searchField = "club_name";
            val = txtName.Text.Trim();
        }

        if (i == 3)
        {
            searchField = "mobile";
            val = txtName.Text.Trim();
        }


        Session["SearchField"] = searchField;
        Session["SearchBy"] = val;
        SearchGrid(searchField, val);
    }
    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from view_registrations  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SortGrid(string sortField)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from view_registrations  where category='" + sortField + "' ORDER BY [booking_id]";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SortGrid(string sortField1, string sortField2)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (sortField2 == "0")
        {
            obj.SetCommandQry = "select * from view_registrations  where category='" + sortField1 + "' and district_no='3141' ORDER BY [booking_id]";
        }
        else
        {

            obj.SetCommandQry = "select * from view_registrations  where category='" + sortField1 + "' and district_no !='3141' ORDER BY [booking_id]";
        }

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SortGrid(string sortField1, string sortField2, string sortField3)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (sortField2 == "0")
        {
            obj.SetCommandQry = "select * from view_registrations  where category='" + sortField1 + "' and district_no='3141' and registration_type='" + sortField3 + "' ORDER BY [booking_id]";
        }
        else
        {

            obj.SetCommandQry = "select * from view_registrations  where category='" + sortField1 + "' and district_no !='3141' and registration_type='" + sortField3 + "' ORDER BY [booking_id]";
        }

        // obj.SetCommandQry = "select * from discon_registrations_tbl  where category='" + sortField1 + "' and district_no='" + sortField2 + "' and registration_type='" + sortField3 + "' ORDER BY [booking_id]";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [view_registrations] ORDER BY [booking_id]";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["SearchBy"] != null)
            {
                SearchGrid(Session["SearchField"].ToString(), txtName.Text.Trim());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["SearchByAlfhabetic"] != null)
            {
                SearchByAlphabet(Session["SearchByAlfhabetic"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["SortBy"] != null)
            {

                if (Session["SortByDateRange"] != null)
                {
                    BindGridDate();
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
                else
                {
                    SortGrid(rbtnType.SelectedItem.Text.Trim().ToString());
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
            }

            else
            {
                BindGrid();
            }
        }
        catch
        {
            // BindGrid();
        }
    }
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM admin_users_tbl";

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
    protected void RadGrid1_PageIndexChanged(object sender, GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SearchByAlphabetic"] = null;
        Session["SortBy"] = null;
        Session["SortByDateRange"] = null;


        rbtnNonRtn.Visible = false;
        rbtnRegType.Visible = false;
        PanelDate.Visible = false;

        string strValue = rbtnType.SelectedItem.Text.Trim().ToString();
        Session["SortBy"] = strValue;

        if (strValue == "All")
        {
            PanelDate.Visible = false;
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = false;

            BindGrid();
        }


        if (strValue == "Rotarian")
        {
            rbtnDist.Visible = true;
            rbtnRegType.Visible = false;
            SortGrid(strValue);
        }

        if (strValue == "Rotaractor")
        {
            rbtnDist.Visible = true;
            rbtnRegType.Visible = false;
            SortGrid(strValue);
        }

        if (strValue == "Non Rotarian")
        {
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = true;
            SortGrid(strValue);
        }

        if (strValue == "Date Range")
        {
            dateFrom.SelectedDate = DateTime.Now;
            dateTo.SelectedDate = DateTime.Now;

            PanelDate.Visible = true;
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = false;
        }

        if (strValue == "Spouse")
        {
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = true;
            //SortGrid(strValue);
        }

        if (strValue == "Inner Wheel")
        {
            rbtnDist.Visible = false;
            rbtnRegType.Visible = false;
            rbtnNonRtn.Visible = true;
            SortGrid(strValue);
        }



    }
    protected void rbtnDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        rbtnDist.Visible = true;
        rbtnRegType.Visible = true;

        string strValue = rbtnType.SelectedItem.Text.Trim().ToString();
        string strDist = rbtnDist.SelectedValue.Trim().ToString();

        if (strValue == "Rotarian")
        {
            rbtnDist.Visible = true;
            rbtnRegType.Visible = true;
        }

        if (strValue == "Rotaractor")
        {
            rbtnDist.Visible = true;
            rbtnRegType.Visible = false;
        }

        SortGrid(strValue, strDist);
    }
    protected void rbtnRegType_SelectedIndexChanged(object sender, EventArgs e)
    {
        rbtnDist.Visible = true;
        rbtnRegType.Visible = true;

        string strValue = rbtnType.SelectedItem.Text.Trim().ToString();
        string strDist = rbtnDist.SelectedValue.ToString();
        string strRegType = rbtnRegType.SelectedItem.Text.Trim().ToString();
        SortGrid(strValue, strDist, strRegType);
    }
    protected void rbtnNonRtn_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSortdateSubmit_Click(object sender, EventArgs e)
    {
        BindGridDate();
    }
    private void BindGridDate()
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SearchByAlphabetic"] = null;
        Session["SortBy"] = null;
        Session["SortByDateRange"] = "Date Range";

        //string[] dFrom = dateFrom.SelectedDate.ToString().Split(' ');
        //string[] dTo = dateTo.SelectedDate.ToString().Split(' ');

        //string dFromm = dFrom[0].Replace('/', '-');
        //string dtoo = dTo[0].Replace('/', '-');

        DateTime dFromm = DateTime.Parse(dateFrom.DbSelectedDate.ToString());
        DateTime dtoo = DateTime.Parse(dateTo.DbSelectedDate.ToString());
        //string dtoo = dTo[0].Replace('/', '-');

        DBconnection obj = new DBconnection();

        ///************Code For Local Database **********/
        //try
        //{
        //    string distConnString = obj.GetLocalConnString();
        //    obj.SetConnString = distConnString;           
        //}
        //catch
        //{
        //}
        ///*********************************************/

        obj.SetCommandSP = "z_SortOrderbyDate";
        obj.AddParam("@dFrom", dFromm);
        obj.AddParam("@dTo", dtoo);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            PanelDate.Visible = true;
            lblError.Visible = false;
            RadGrid1.Visible = true;

            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void SendMailtoClient(string strRegNo, string strRegDt, string strCategory, string strRegFor, string strDistNo, string strRegType, string strName, string strBadgename, string strEmail,
        string strPaymentType, string strAmt, string strIp, string strClubname, string strBankname, string strBranch, string strChequeNo, string strChequeDt, string strUtr, string strUtrDt, string strScheemCat,
        string strCardtype, string strCardNo, string strExDate, string balance_amount)
    {
        try
        {
            string ReadFileName = "";
            MailMessage mail = new MailMessage();
            mail.To.Add(strEmail);
            mail.CC.Add("ajay@lokchem.com");
            mail.CC.Add("kishanc@rptechindia.com");
            mail.CC.Add("cdawar@gmail.com");
            mail.CC.Add("arvindgadia@hotmail.com");

            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");

            mail.Subject = "Discon 2017 Registrations";

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            
            ReadFileName = PathVal + "/Mail/discon_registration_receipt.htm";
           
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();


            // strMessage = strMessage.Replace("XXXdt", DateTime.Now.ToString("dd MMMM yyyy 'at' hh:mm:ss tt"));

            strMessage = strMessage.Replace("XXXdt", Convert.ToDateTime(strRegDt).ToString("dd MMMM yyyy"));

            strMessage = strMessage.Replace("XXXmem", strName);

            if (strCategory == "Rotarian")
            {
                strMessage = strMessage.Replace("XXXclub", "Rotary Club of " + strClubname);
            }

            if (strCategory == "Non Rotarian")
            {
                strMessage = strMessage.Replace("XXXclub", "Referred By Rotary Club of " + strClubname);
            }

            if (strCategory == "Rotaractor")
            {
                strMessage = strMessage.Replace("XXXclub", "Rotaract Club of " + strClubname);
            }
            
            strMessage = strMessage.Replace("XXXregisno", strRegNo);

            strMessage = strMessage.Replace("XXXbadge", strBadgename);


            strMessage = strMessage.Replace("XXXregisType", strCategory + " - " + strRegFor);
            strMessage = strMessage.Replace("XXXfor", strRegType);
            
            strMessage = strMessage.Replace("XXXpayScheme", strScheemCat);

            Decimal amt = 0;
            string strPayAmt = "";
            amt = Convert.ToDecimal(strAmt.ToString());
            strPayAmt = amt.ToString("n0").ToString();


            //string strBalance = lblDiscountAmt.Text.Trim().ToString();

            if (balance_amount != "0")
            {
                strMessage = strMessage.Replace("XXXbal", "Balance Payable is: <strong>&#8377;" + balance_amount.ToString() + "</strong><br /><br />" + "You can make balance payment by: <br /><strong> Cheque -</strong> Cheque is to be drawn on <strong> ''Discon 2017'' </strong><br /> <strong> NEFT - A / C No.:</strong> 0171101083715 <strong> IFSC CODE:</strong> CNRB0000171 <strong> Bank:</strong> Canara Bank, Versova Road<br />");
            }
            else
                strMessage = strMessage.Replace("XXXbal", "");


            strMessage = strMessage.Replace("XXXamt", strPayAmt);
            strMessage = strMessage.Replace("XXXmode", strPaymentType);

           // strMessage = strMessage.Replace("XXXreceived", lblPayableAmt.Text.Trim().ToString());
            strMessage = strMessage.Replace("XXXprePaid", GetGridviewData(GridView1)); // Get Balance Paid Amount Details                       

            strMessage = strMessage.Replace("XXXip", strIp); 

            mail.Body = strMessage;
            sr1.Close();

          
            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@discon2017.com", "Njb98!x1");
            //emailClient.Port = 25;
            //emailClient.Host = "mail.discon2017.com";
            //emailClient.EnableSsl = false;
            //emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@goradiainfotech.com", "n7$Gk5#W");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.gmail.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            string jv = "<script>alert('Registration Receipt Has Been Sent Successfully.');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
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
                    BindGridview(id);
                    GetForm(id);
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }

    public string GetGridviewData(GridView gv)
    {
        StringBuilder strBuilder = new StringBuilder();
        StringWriter strWriter = new StringWriter(strBuilder);
        HtmlTextWriter htw = new HtmlTextWriter(strWriter);
        gv.RenderControl(htw);
        return strBuilder.ToString();
    }
    protected void BindGridview(int id)
    {

        DataSet ds = new DataSet();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from registration_payment_tbl where booking_id=" + id;

        ds = obj.ExecuteDataSet();
        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
}
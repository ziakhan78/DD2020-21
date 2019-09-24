using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using Telerik.Web.UI;

public partial class DistrictDirectory_ViewDistrictAppointments : System.Web.UI.Page
{
    int intYear = DateTime.Now.Year;
    string rotaryCurrentYear = "";
    int m = DateTime.Now.Month;

    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (m > 6 && m <= 12)
        //    rotaryCurrentYear = (intYear + " - " + (intYear + 1)).ToString();
        //else
        //    rotaryCurrentYear = (intYear - 1 + " - " + (intYear)).ToString();

        rotaryCurrentYear = "2020 - 2021";

        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                //rbtnSearch.ClearSelection();  
                GetDistDesignation(rotaryCurrentYear);

                BindYears();

                DDLClubName.Visible = false;
                DDLClubName.SelectedIndex = 0;
                // txtName.Visible = false;
                // btnSearch.Visible = false;

                bool b;
                if (b = true)
                {
                    Session["searchField"] = null;
                    Session["name"] = null;
                    Session["value"] = null;
                    Session["SortField"] = null;
                    Session["SortByClubName"] = null;

                    b = false;
                }

                lblMsg.Visible = false;
                CheckPermission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }
    }
    private void SearchByAlphabet(string name)
    {
        // rbtnSearch.ClearSelection();

        rbtnSearch.SelectedIndex = 0;
        txtName.Text = "";
        DDLClubName.SelectedIndex = 0;


        Session["searchField"] = null;
        Session["value"] = null;
        Session["SortField"] = null;
        Session["SortByClubName"] = null;

        Session["name"] = name;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetDistAppointment";
        obj.AddParam("@name", name);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;
        Session["SortField"] = null;
        Session["SortByClubName"] = null;

        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());




        if (i == 0)
        {
            searchField = "Name";
        }

        if (i == 1)
        {
            searchField = "club_name";
        }

        if (i == 2)
        {
            searchField = "EmailId";
        }

        if (i == 3)
        {
            searchField = "Mobile1";
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
        obj.SetCommandQry = "select * from View_DistPositionHeldMembers where district_no='3141' and " + searchField + " like  '%'+'" + pname + "'+ '%' ";
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
    private void SearchGrid(int clubid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_DistPositionHeldMembers where district_no='3141' and club_id='" + clubid + "' order by Name";
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
        //if (m > 6 && m <= 12)
        //    rotaryCurrentYear = (intYear + " - " + (intYear + 1)).ToString();
        //else
        //    rotaryCurrentYear = (intYear - 1 + " - " + (intYear)).ToString();

        rotaryCurrentYear = "2020 - 2021";

        try
        {
            if (Session["SortByClubName"] != null)
            {
                // int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
                SearchGrid(int.Parse(Session["SortByClubName"].ToString()));
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }


            else if (Session["value"] != null)
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

            else
            {
                try
                {
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                    BindGrid(rotaryCurrentYear);
                }
                catch
                {
                    BindGrid(rotaryCurrentYear);
                }
            }
        }
        catch { }
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
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;
        Session["SortField"] = null;
        Session["SortByClubName"] = null;

        Session["value"] = "Search";
        txtName.Text = "";
        DDLClubName.SelectedIndex = 0;

        int i = int.Parse(rbtnSearch.SelectedValue.ToString());

        if (i == 1)
        {
            txtName.Visible = false;
            btnSearch.Visible = false;
            DDLClubName.Visible = true;
        }
        else
        {
            txtName.Visible = true;
            btnSearch.Visible = true;
            DDLClubName.Visible = false;
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;
        Session["SortField"] = null;
        Session["SortByClubName"] = null;

        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        Session["SortByClubName"] = clubid;
        SearchGrid(clubid);
    }
    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        try
        {
            Label lbldoj = (Label)e.Item.FindControl("lbldoj");
            if (lbldoj != null)
            {
                DateTime doj = DateTime.Parse(lbldoj.Text.ToString());
                if (doj.Year == 1900 && doj.Month == 1 && doj.Day == 1)
                {
                    lbldoj.Text = "";
                }
                else
                {
                    lbldoj.Text = doj.ToString("dd-MM-yyyy");
                }
            }

            Label lblMemNo = (Label)e.Item.FindControl("lblMemNo");
            if (lblMemNo != null)
            {
                string memno = lblMemNo.Text.Trim();
                if (memno == "0")
                {
                    lblMemNo.Text = "";
                }
                else
                {
                    lblMemNo.Text = memno;
                }
            }

            Label lbltrf = (Label)e.Item.FindControl("lbltrf");
            if (lbltrf.Text != "")
            {
                lbltrf.Text = Convert.ToDouble(lbltrf.Text.ToString()).ToString("n");
            }

            Label lblMobile1 = (Label)e.Item.FindControl("lblMobile1");
            if (lblMobile1.Text != "")
            {
                string[] mob1 = lblMobile1.Text.Trim().ToString().Split(' ');
                lblMobile1.Text = mob1[1];
            }
        }
        catch { }

        try
        {
            DropDownList chkMemStatus = (DropDownList)e.Item.FindControl("chkMemActive");
            Label lblMemStatus = (Label)e.Item.FindControl("lblMemStatus");

            if (lblMemStatus != null)
            {
                string strStatus = lblMemStatus.Text;

                if (strStatus == "Active")
                    chkMemStatus.SelectedIndex = 0;
                if (strStatus == "Honorary")
                    chkMemStatus.SelectedIndex = 1;
                if (strStatus == "Inactive")
                    chkMemStatus.SelectedIndex = 2;
            }
        }
        catch { }

    }
    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        int pid = 0;
        string email, Pass = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblMemId = (Label)item.FindControl("lblMemId");
                Label lblEmail = (Label)item.FindControl("lblEmail");
                Label lblMemName = (Label)item.FindControl("lblMemName");
                Label lblClubName = (Label)item.FindControl("lblClubName");
                Label lblAvenue = (Label)item.FindControl("lblAvenue");
                Label lblPosition = (Label)item.FindControl("lblPosition");
                if (chkbox.Checked)
                {
                    pid = Int32.Parse(lblMemId.Text.ToString());
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            SendMailtoClient(email, lblClubName.Text.Trim().ToString(), lblMemName.Text.Trim().ToString(), lblAvenue.Text.Trim().ToString(), lblPosition.Text.Trim().ToString());
                            UpdateMailStatus(pid);
                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
        ManageGrid();
    }
    private void SendMailtoClient(string email, string clubName, string name, string avenue, string position)
    {
        try
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            //mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.From = new MailAddress("dggopal@rotarydist3141.com");

            //mail.From = new MailAddress("3141dg@gmail.com");
            //mail.From = new MailAddress("info@goradiainfotech.com");
            // mail.Bcc.Add("dggopal@rotarydist3141.com");

            mail.Bcc.Add("distofficers@rotarydist3141.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "District Appointment For RY 2016-17 Pratham Team";

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/DistAppointment.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("XXXdt", DateTime.Now.ToString("dd MMMM yyyy"));
            strMessage = strMessage.Replace("xxxClubName", clubName);
            strMessage = strMessage.Replace("xxxName", name);
            strMessage = strMessage.Replace("xxxAvenue", avenue);
            strMessage = strMessage.Replace("xxxPosition", position);

            mail.Body = strMessage;
            sr1.Close();

            
            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("dggopal@rotarydist3141.com", "#mumbai3141$");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);


            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("dggopal@rotarydist3141.com", "mumbai3141");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);


            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("info@goradiainfotech.com", "omshanti2011");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.gmail.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("3141dg@gmail.com", "mumbai3141");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.gmail.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("dggopal@rotarydist3141.com", "lpQy@694");
            //emailClient.Port = 2525;
            //emailClient.Host = "mail.rotarydist3141.com";
            //emailClient.EnableSsl = false;
            //emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "vF5i4!8l");
            //emailClient.Port = 2525;
            //emailClient.Host = "mail.rotarydist3141.com";
            //emailClient.EnableSsl = false;
            //emailClient.Send(mail);

            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }

    }
    private void BindGrid(string currentYears)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='" + currentYears + "' order by Name";
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
    private void BindGrid(string yrs, string position)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='" + yrs + "' and avenue='" + position + "' order by Name";
        obj.SetCommandSP = "z_GetPositionByAvenue";
        obj.AddParam("@district_no", 3141);
        obj.AddParam("@years", yrs);
        obj.AddParam("@avenue", position);
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
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteDistAppointment";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //RadGrid1.DataBind();
                ManageGrid();
            }
        }
    }
    public void CheckPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [admin_users_tbl]";

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
    protected void chkMemActive_SelectedIndexChanged(object sender, EventArgs e)
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
            con.SetCommandQry = "update club_members_tbl set MemType='" + strC + "' where  MemberId=" + id;
            int exe = con.ExecuteNonQuery();
        }
        catch { }
    }

    private void BindYears()
    {
        try
        {
            for (Int32 i = Convert.ToInt32(DateTime.Now.Year); i >= 2000; i--)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());
            }
            string currentyears = Convert.ToInt32(DateTime.Now.Year).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 1).ToString();
            string nextyears = Convert.ToInt32(DateTime.Now.Year + 1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 2).ToString();
            //DDLYears.Items.Insert(0, "Select");
            DDLYears.Items.Insert(1, nextyears);
            DDLYears.Items.Insert(2, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }

    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        string yrs = DDLYears.SelectedItem.Text.Trim().ToString();
        BindGrid(yrs);
        GetDistDesignation(yrs);
    }

    protected void ddlAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string yrs = DDLYears.SelectedItem.Text.Trim().ToString();
        string position = ddlAvenue.SelectedItem.Text.Trim().ToString();
        BindGrid(yrs, position);
    }

    private void GetDistDesignation(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlAvenue.DataTextField = "designation";
            ddlAvenue.DataValueField = "id";
            ddlAvenue.DataSource = dt;
            ddlAvenue.DataBind();
            ddlAvenue.Items.Insert(0, "Select Avenue");
        }
    }

    private void UpdateMailStatus(int memId)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDistAppointmentMailStatus";
            obj.AddParam("@id", memId);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }

    }

    protected void btnSendDta_Click(object sender, EventArgs e)
    {
        string email = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblEmail = (Label)item.FindControl("lblEmail");

                if (chkbox.Checked)
                {
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            SendMailtoDta(email);
                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
      //  ManageGrid();
    }
    private void SendMailtoDta(string email)
    {
        try
        {
            string ReadFileName = "";
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            //mail.To.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.CC.Add("dggopal@rotarydist3141.com");
            mail.CC.Add("rajkhosla@puritytex.com");
            mail.CC.Add("rtnarun@gmail.com");
            mail.CC.Add("pnandekar@yahoo.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Zenith - District Training Assembly (DTA)";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            ReadFileName = PathVal + "/Mail/DTA_DO.htm";

            //if (ddlAvenue.SelectedItem.Text == "")
            //{
            //    ReadFileName = PathVal + "/Mail/DTA_DO.htm";
            //}
            //else
            //{
            //    ReadFileName = PathVal + "/Mail/DTA_AG.htm";
            //}

            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();

            mail.Body = strMessage;
            sr1.Close();

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }

    }

    protected void btnSendMailtoAG_Click(object sender, EventArgs e)
    {
        string email = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox) item.FindControl("chkActive");
                Label lblEmail = (Label) item.FindControl("lblEmail");

                if (chkbox.Checked)
                {
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            SendMailtoAG(email);
                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }

    private void SendMailtoAG(string email)
    {
        try
        {
            string ReadFileName = "";
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            //mail.To.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.CC.Add("dggopal@rotarydist3141.com");
           // mail.CC.Add("rajkhosla@puritytex.com");
            mail.CC.Add("rtnarun@gmail.com");
           // mail.CC.Add("pnandekar@yahoo.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Club's Website Address";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            ReadFileName = PathVal + "/Mail/AGMail.htm";

            //if (ddlAvenue.SelectedItem.Text == "")
            //{
            //    ReadFileName = PathVal + "/Mail/DTA_DO.htm";
            //}
            //else
            //{
            //    ReadFileName = PathVal + "/Mail/DTA_AG.htm";
            //}

            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();

            mail.Body = strMessage;
            sr1.Close();

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }

    }
}
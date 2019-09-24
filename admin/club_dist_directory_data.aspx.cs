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

public partial class admin_club_dist_directory_data : System.Web.UI.Page
{
    int intYear = DateTime.Now.Year;
    string rotaryYear = "2016 - 2017";
    int m = DateTime.Now.Month;
    string designation = "President";
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (m > 6 && m <= 12)
            rotaryYear = intYear + " - " + (intYear + 1);

      

        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
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
                permission();
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



        Session["searchField"] = null;
        Session["value"] = null;
        Session["SortField"] = null;
        Session["SortByClubName"] = null;

        Session["name"] = name;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetPresident";
        obj.AddParam("@name", name);
        obj.AddParam("@designation", designation);
        obj.AddParam("@year", rotaryYear);

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
            searchField = "name";
        }

        if (i == 1)
        {
            searchField = "designation";
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
        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and designation='" + designation + "' and year='" + rotaryYear + "' and MemType='Active' and " + searchField + " like  '%'+'" + pname + "'+ '%' order by Name";
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

            if (Session["value"] != null)
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

                    BindGrid();
                }
                catch
                {
                    BindGrid();
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
    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        int pid = 0;
        string email, Pass = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblcid = (Label)item.FindControl("lblcid");
                Label lblEmail = (Label)item.FindControl("lblEmail");
                if (chkbox.Checked)
                {
                    pid = Int32.Parse(lblcid.Text.ToString());
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "select password from View_BodMembers where  EmailId='" + email + "' and MemType='Active' order by Name";
                            DataTable dt = con.ExecuteTable();
                            Pass = dt.Rows[0]["password"].ToString();


                            SendMailtoClient(email, Pass);

                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }
    private void SendMailtoClient(string email, string password)
    {
        try
        {

            MailMessage mail = new MailMessage();
            
           
           
           

            mail.From = new MailAddress("mail@rotarydist3141.com");
            //mail.To.Add(email);
            mail.To.Add("zia@goradiainfotech.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Rotary District 3141 President Login Information";



            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/PresidentLoginPassword.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("xxxLoginID", email);
            strMessage = strMessage.Replace("xxxPassword", password);


            mail.Body = strMessage;
            sr1.Close();

            // Create the credentials to login to the gmail account associated with my custom domain 

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }



    }
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and designation='" + designation + "' and year='" + rotaryYear + "' and MemType='Active' order by Name";
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


    string imgPresident, imgPresidentSpouse, imgSec, imgSecSpouse = "";
    protected void btnSendDistrictDirectoryData_Click(object sender, EventArgs e)
    {       

        int clubId = 0;
        string email = "-";
        string clubName = "-";
        string clubNo = "-";
        string charterDate = "-";
        string mettingDay = "-";
        string strMeetingTime = "-";
        string venue = "-";
        string ds = "-";
        string at = "-";
        string ag = "-";
        string flagshipText = "-";
        string strFlagship = "";
        int members = 0;
        int womenMembers = 0;
        int iw, rotract, interact, srCitizen, rcc = 0;

        

        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");              
                Label lblClubId = (Label)item.FindControl("lblClubId");
                Label lblEmail = (Label)item.FindControl("lblEmail");
                
                if (chkbox.Checked)
                {
                    clubId = Int32.Parse(lblClubId.Text.ToString());

                    //GetClubDetails(clubId);
                    iw=GetIw(clubId);
                    rotract=GetRotaract(clubId);
                    interact=GetInteract(clubId);
                    srCitizen=GetSrCitizen(clubId);
                    rcc=GetRcc(clubId);
                    //GetBodDetails(clubId);
                    BindGridview(clubId);
                    BindPresident(clubId);
                    BindSecretary(clubId);


                    DataTable dt = new DataTable();
                    DBconnection obj = new DBconnection();
                    obj.SetCommandSP = "z_GetMaleFemaleMembersByClubId";
                    obj.AddParam("@club_id", clubId);
                    dt = obj.ExecuteTable();
                    if (dt.Rows.Count > 0)
                    {
                        members = int.Parse(dt.Rows[0]["Total"].ToString());
                        womenMembers = int.Parse(dt.Rows[0]["WomenMembers"].ToString());
                    }


                    try
                    {
                        DistrictClub obj1 = new DistrictClub();
                        obj1.Id = clubId;

                        DataTable dt1 = new DataTable();
                        dt1 = obj1.GetClubById();
                        if (dt1.Rows.Count > 0)
                        {

                            // Club Details

                            clubName = dt1.Rows[0]["club_name"].ToString();
                            clubNo = dt1.Rows[0]["ri_club_No"].ToString();

                            DateTime chrterdate = DateTime.Parse(dt1.Rows[0]["charter_date"].ToString());
                            charterDate = chrterdate.ToString("dd-MMMM-yyyy");
                            mettingDay = dt1.Rows[0]["meeting_day"].ToString();
                            

                            try
                            {
                                DateTime meetingTime = DateTime.Parse(dt1.Rows[0]["meeting_time"].ToString());
                                strMeetingTime = meetingTime.ToString("hh:mm tt");
                            }
                            catch
                            {
                                strMeetingTime = "-";
                            }


                            venue = dt1.Rows[0]["venue1"].ToString() + " " + dt1.Rows[0]["venue2"].ToString() + " " + dt1.Rows[0]["city"].ToString();

                            ds = dt1.Rows[0]["ds"].ToString();
                            at = dt1.Rows[0]["at"].ToString();
                            ag = dt1.Rows[0]["ag"].ToString();

                           flagshipText= dt1.Rows[0]["flagship_text"].ToString();

                           strFlagship = dt1.Rows[0]["flagship_image"].ToString();
                            //if (strFlagship != "")
                            //{
                            //    imgFlagship.Visible = true;
                            //    imgFlagship.ImageUrl = "../ClubsLogo/" + strFlagship;
                            //}
                            //else
                            //{
                            //    imgFlagship.Visible = false;
                            //}
                        }
                    }
                    catch { }


                            email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            SendMailtoDistDirectory(email, clubId, clubName, clubNo, charterDate, members, womenMembers, iw, rotract, interact, srCitizen, rcc, venue, mettingDay, strMeetingTime, ds,at,ag, flagshipText, strFlagship);
                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }

    private void SendMailtoDistDirectory(string email, int clubId, string clubName, string clubNo, string charterDate, int members, int womenMembers, int iw, int rotract, int interact, int srCitizen, int rcc, string venue, string mettingDay, string strMeetingTime, string ds, string at, string ag, string flagshipText, string strFlagship)
    {
        try
        {
            MailMessage mail = new MailMessage();
            //mail.To.Add(email);
            mail.From = new MailAddress("mail@rotarydist3141.com");
            //mail.To.Add("rotarypublications1617@gmail.com");
            mail.To.Add("zia@goradiainfotech.com");
           // mail.CC.Add("distdata@rotarydist3141.com");
           // mail.CC.Add(email);
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Rotary District Directory Data";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/RotaryDistrictDirectoryData.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("xxxClub", clubName);
            strMessage = strMessage.Replace("xxxCNo", clubNo);
            strMessage = strMessage.Replace("xxxChDt", charterDate);
            strMessage = strMessage.Replace("xxxMem", members.ToString());
            strMessage = strMessage.Replace("xxxWom", womenMembers.ToString());
            strMessage = strMessage.Replace("xxxIW", iw.ToString());
            strMessage = strMessage.Replace("xxxRtr", rotract.ToString());
            strMessage = strMessage.Replace("xxxInt", interact.ToString());
            strMessage = strMessage.Replace("xxxCtzn", srCitizen.ToString());
            strMessage = strMessage.Replace("xxxRcc", rcc.ToString());
            strMessage = strMessage.Replace("xxxVenue", venue);
            strMessage = strMessage.Replace("xxxDay", mettingDay);
            strMessage = strMessage.Replace("xxxTime", strMeetingTime);

            strMessage = strMessage.Replace("XXXpresident", GetDetailsViewData1(DetailsView1));
            strMessage = strMessage.Replace("XXXsecretary", GetDetailsViewData2(DetailsView2));
            strMessage = strMessage.Replace("XXXbod", GetGridviewData(GridView1));

            strMessage = strMessage.Replace("xxxds", ds);
            strMessage = strMessage.Replace("xxxat", at);
            strMessage = strMessage.Replace("xxxag", ag);
            strMessage = strMessage.Replace("XXXflagship", flagshipText);

            mail.Body = strMessage;

            string pathVal1 = Server.MapPath("~");
            string readFileName1 = pathVal1 + "/mail/RotaryDistrictDirectoryData" + clubId + ".htm";

            string path = readFileName1;

            File.WriteAllText(path, strMessage);
            mail.Attachments.Add(new Attachment(readFileName1));
            try { mail.Attachments.Add(new Attachment(PathVal + "/ProjectFlagship/" + strFlagship)); } catch { }
            try { mail.Attachments.Add(new Attachment(PathVal + "/MemberImages/" + imgPresident)); } catch { }
            try { mail.Attachments.Add(new Attachment(PathVal + "/MemberImages/" + imgPresidentSpouse)); } catch { }
            try { mail.Attachments.Add(new Attachment(PathVal + "/MemberImages/" + imgSec)); } catch { }
            try { mail.Attachments.Add(new Attachment(PathVal + "/MemberImages/" + imgSecSpouse)); } catch { }


            sr1.Close();


            // Create the credentials to login to the gmail account associated with my custom domain 

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@rotarydist3141.com", "G#5x7hR$9");
            emailClient.Port = 25;
            emailClient.Host = "mail.rotarydist3141.com";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

    private int GetIw(int id)
    {
        int intIw = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_iw_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            intIw = int.Parse(dt.Rows.Count.ToString());            
        }     

        return intIw;
    }
    private int GetRotaract(int id)
    {
        int intRtr = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_rotaract_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            intRtr = int.Parse(dt.Rows.Count.ToString());
        }
        return intRtr;
    }
    private int GetInteract(int id)
    {
        int intIntr = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_interact_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            intIntr = int.Parse(dt.Rows.Count.ToString());
        }
        return intIntr;
    }
    private int GetSrCitizen(int id)
    {
        int intSrCtzn = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_sr_citizen_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            intSrCtzn = int.Parse(dt.Rows.Count.ToString());
        }
        return intSrCtzn;
    }
    private int GetRcc(int id)
    {
        int intRcc = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_rcc_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            intRcc = int.Parse(dt.Rows.Count.ToString());
        }
        return intRcc;
    }

    //private void GetClubDetails(int id)
    //{
    //    try
    //    {
    //        DistrictClub obj = new DistrictClub();
    //        obj.Id = id;

    //        DataTable dt = new DataTable();
    //        dt = obj.GetClubById();
    //        if (dt.Rows.Count > 0)
    //        {
    //            // Club Details

    //            lblClubName.Text = dt.Rows[0]["club_name"].ToString();
    //            lblClubNo.Text = dt.Rows[0]["ri_club_No"].ToString();

    //            DateTime chrterdate = DateTime.Parse(dt.Rows[0]["charter_date"].ToString());
    //            lblCharterDate.Text = chrterdate.ToString("dd-MMMM-yyyy");

    //            lblMeetingDay.Text = dt.Rows[0]["meeting_day"].ToString();
    //            // lblMeetingTime.Text = dt.Rows[0]["meeting_time"].ToString();

    //            try
    //            {
    //                DateTime meetingTime = DateTime.Parse(dt.Rows[0]["meeting_time"].ToString());
    //                lblMeetingTime.Text = meetingTime.ToString("hh:mm tt");
    //            }
    //            catch
    //            {
    //                lblMeetingTime.Text = "-";
    //            }


    //            lblVenue.Text = dt.Rows[0]["venue1"].ToString() + " " + dt.Rows[0]["venue2"].ToString() + " " + dt.Rows[0]["city"].ToString();

    //            lblDS.Text = dt.Rows[0]["ds"].ToString();
    //            lblAT.Text = dt.Rows[0]["at"].ToString();
    //            lblAG.Text = dt.Rows[0]["ag"].ToString();

    //            lblFlagship.Text = dt.Rows[0]["flagship_text"].ToString();

    //            string strFlagship = dt.Rows[0]["flagship_image"].ToString();
    //            if (strFlagship != "")
    //            {
    //                imgFlagship.Visible = true;
    //                imgFlagship.ImageUrl = "../ClubsLogo/" + strFlagship;
    //            }
    //            else
    //            {
    //                imgFlagship.Visible = false;
    //            }



    //            //string gps = dt.Rows[0]["gps_latitude"].ToString();
    //            //if (gps != "")
    //            //{
    //            //    lblGPS.Text = "Latitude : " + dt.Rows[0]["gps_latitude"].ToString() + "    " + "Longitude : " + dt.Rows[0]["gps_longitude"].ToString();
    //            //}
    //            //else
    //            //{
    //            //    lblGPS.Text = "";
    //            //}

    //            //DateTime instDate = DateTime.Parse(dt.Rows[0]["installation_date"].ToString());
    //            //lblInsDate.Text = instDate.ToString("dd-MMMM-yyyy");

    //            //lblInstTime.Text = dt.Rows[0]["installation_time"].ToString();
    //            //lblInstChiefGuest.Text = dt.Rows[0]["installation_chief_guest"].ToString();
    //            //lblInstVenue.Text = dt.Rows[0]["installation_venue"].ToString();


    //            //DateTime ocvDate = DateTime.Parse(dt.Rows[0]["ocv_date"].ToString());
    //            //lblOcvDate.Text = ocvDate.ToString("dd-MMMM-yyyy");

    //            //lblOcvTime.Text = dt.Rows[0]["ocv_time"].ToString();

    //            //lblTrfStatus.Text = dt.Rows[0]["club_trf_status"].ToString();

    //            //string strLogo = dt.Rows[0]["club_logo"].ToString();
    //            //if(strLogo!="")
    //            //{
    //            //    imgLogo.Visible = true;
    //            //    imgLogo.ImageUrl = "../ClubsLogo/" + strLogo;
    //            //}
    //            //else
    //            //{
    //            //    imgLogo.Visible = false;
    //            //}


    //            //string strLocationMap = dt.Rows[0]["location_map"].ToString();
    //            //if (strLocationMap != "")
    //            //{
    //            //    imgMap.Visible = true;
    //            //    imgMap.ImageUrl = "../ClubsLogo/" + strLocationMap;
    //            //}
    //            //else
    //            //{
    //            //    imgMap.Visible = false;
    //            //}




    //        }
    //    }
    //    catch { }
    //}
    //private void GetBodDetails(int id)
    //{

    //    DataTable dt = new DataTable();
    //    BodBll obj = new BodBll();
    //    obj.ClubId = id;
     //   dt = obj.GetAllBodByDist3141ClubId();

    //    if (dt.Rows.Count > 0)
    //    {
    //        string desi = "";
    //        for (int i = 0; i <= dt.Rows.Count - 1; i++)
    //        {
    //            try
    //            {
    //                desi = dt.Rows[i]["designation"].ToString();

    //                if (desi == "President")
    //                {
    //                    lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
    //                    try
    //                    {
    //                        DateTime dojDt = DateTime.Parse(dt.Rows[0]["DOJ"].ToString());
    //                        lblJr.Text = dojDt.ToString("yyyy");
    //                    }
    //                    catch { lblJr.Text = "-"; }

    //                    string strClassification = dt.Rows[i]["classification"].ToString();
    //                    if (strClassification != "")
    //                    {
    //                        lblClassification.Text = strClassification;
    //                    }
    //                    else { lblClassification.Text = "-"; }

    //                    lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
    //                    lblEmail.Text = dt.Rows[i]["EmailId"].ToString();

    //                    lblPhResi.Text = dt.Rows[i]["RPhoneCc1"].ToString() + "-" + dt.Rows[i]["RPhoneAc1"].ToString() + "-" + dt.Rows[i]["RPhone1"].ToString();
    //                    lblPhOffice.Text = dt.Rows[i]["OPhoneCc1"].ToString() + "-" + dt.Rows[i]["OPhoneAc1"].ToString() + "-" + dt.Rows[i]["OPhone1"].ToString();

    //                    string strAdd1 = dt.Rows[i]["RAdd1"].ToString();
    //                    string strAdd2 = dt.Rows[i]["RAdd2"].ToString();
    //                    string strCity = dt.Rows[i]["RCity"].ToString();
    //                    string strPin = dt.Rows[i]["RPin"].ToString();

    //                    string strAddress = "";

    //                    if (strAdd1 != "")
    //                        strAddress = dt.Rows[i]["RAdd1"].ToString();
    //                    if (strAdd2 != "")
    //                        strAddress = strAddress + "<br />" + dt.Rows[i]["RAdd2"].ToString();
    //                    if (strCity != "")
    //                        strAddress = strAddress + "<br />" + dt.Rows[i]["RCity"].ToString();
    //                    if (strPin != "")
    //                        lblAddress.Text = strAddress + "-" + dt.Rows[i]["RPin"].ToString();
    //                    else
    //                        lblAddress.Text = strAddress;

    //                    try
    //                    {
    //                        DateTime dobDt = DateTime.Parse(dt.Rows[i]["DOB"].ToString());
    //                        lblDob.Text = dobDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblDob.Text = "-"; }

    //                    string strBg = dt.Rows[i]["BG"].ToString().Trim();
    //                    string strRhf = dt.Rows[i]["RHF"].ToString();

    //                    if (strBg != "Select")
    //                    {
    //                        if (strBg != "")
    //                        {
    //                            lblBg.Text = strBg + strRhf;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        lblBg.Text = "-";
    //                    }


    //                    try
    //                    {
    //                        DateTime sdoDt = DateTime.Parse(dt.Rows[i]["SDOB"].ToString());
    //                        lblSdob.Text = sdoDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblSdob.Text = "-"; }

    //                    //lblSbg.Text = dt.Rows[i]["SBG"].ToString() + " " + dt.Rows[i]["SRHF"].ToString();

    //                    string strSBg = dt.Rows[i]["SBG"].ToString().Trim();
    //                    string strSRhf = dt.Rows[i]["SRHF"].ToString();

    //                    if (strSBg != "Select")
    //                    {
    //                        if (strSBg != "")
    //                        {
    //                            lblSbg.Text = strSBg + strSRhf;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        lblSbg.Text = "-";
    //                    }


    //                    string strSpouse = dt.Rows[i]["SName"].ToString();
    //                    if (strSpouse != "")
    //                    {
    //                        lblSpouseName.Text = strSpouse;
    //                    }
    //                    else { lblSpouseName.Text = "-"; }



    //                    try
    //                    {
    //                        DateTime anniDt = DateTime.Parse(dt.Rows[i]["Anniversary"].ToString());
    //                        lblAnni.Text = anniDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblAnni.Text = "-"; }

    //                    //string email = dt.Rows[i]["EmailId"].ToString();
    //                    //emaillink.HRef = "mailto:" + email;

    //                    string strImg = dt.Rows[i]["MemberImage"].ToString();
    //                    if (strImg != "")
    //                    {
    //                        imgPresident.Visible = true;
    //                        imgPresident.ImageUrl = "../MemberImages/" + strImg;
    //                    }

    //                    string strSImg = dt.Rows[i]["SImage"].ToString();
    //                    if (strSImg != "")
    //                    {
    //                        imgPresidentSpouse.Visible = true;
    //                        imgPresidentSpouse.ImageUrl = "../MemberImages/" + strSImg;
    //                    }

    //                }

    //                if (desi == "Secretary")
    //                {
    //                    lblSecretaryName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
    //                    try
    //                    {
    //                        DateTime dojDt = DateTime.Parse(dt.Rows[i]["DOJ"].ToString());
    //                        lblSecJr.Text = dojDt.ToString("yyyy");
    //                    }
    //                    catch { lblSecJr.Text = "-"; }

    //                    // lblSecClassi.Text = dt.Rows[i]["classification"].ToString();
    //                    string strClassification = dt.Rows[i]["classification"].ToString();
    //                    if (strClassification != "")
    //                    {
    //                        lblSecClassi.Text = strClassification;
    //                    }
    //                    else { lblSecClassi.Text = "-"; }


    //                    lblSecMobile.Text = dt.Rows[i]["Mobile1"].ToString();
    //                    lblSecEmail.Text = dt.Rows[i]["EmailId"].ToString();

    //                    lblSecPhResi.Text = dt.Rows[i]["RPhoneCc1"].ToString() + "-" + dt.Rows[i]["RPhoneAc1"].ToString() + "-" + dt.Rows[i]["RPhone1"].ToString();
    //                    lblSecPhOffice.Text = dt.Rows[i]["OPhoneCc1"].ToString() + "-" + dt.Rows[i]["OPhoneAc1"].ToString() + "-" + dt.Rows[i]["OPhone1"].ToString();

    //                    string strAdd1 = dt.Rows[i]["RAdd1"].ToString();
    //                    string strAdd2 = dt.Rows[i]["RAdd2"].ToString();
    //                    string strCity = dt.Rows[i]["RCity"].ToString();
    //                    string strPin = dt.Rows[i]["RPin"].ToString();

    //                    string strAddress = "";

    //                    if (strAdd1 != "")
    //                        strAddress = dt.Rows[i]["RAdd1"].ToString();
    //                    if (strAdd2 != "")
    //                        strAddress = strAddress + "<br />" + dt.Rows[i]["RAdd2"].ToString();
    //                    if (strCity != "")
    //                        strAddress = strAddress + "<br />" + dt.Rows[i]["RCity"].ToString();
    //                    if (strPin != "")
    //                        lblSecAddress.Text = strAddress + "-" + dt.Rows[i]["RPin"].ToString();
    //                    else
    //                        lblSecAddress.Text = strAddress;


    //                    string strSecSpouse = dt.Rows[i]["SName"].ToString();
    //                    if (strSecSpouse != "")
    //                    {
    //                        lblSecSpouse.Text = strSecSpouse;
    //                    }
    //                    else { lblSecSpouse.Text = "-"; }


    //                    try
    //                    {
    //                        DateTime dobDt = DateTime.Parse(dt.Rows[i]["DOB"].ToString());
    //                        lblSecDob.Text = dobDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblSecDob.Text = "-"; }

    //                    // lblSecBg.Text = dt.Rows[i]["BG"].ToString() + " " + dt.Rows[i]["RHF"].ToString();

    //                    string strSecBg = dt.Rows[i]["BG"].ToString().Trim();
    //                    string strSecRhf = dt.Rows[i]["RHF"].ToString();

    //                    if (strSecBg != "Select")
    //                    {
    //                        if (strSecBg != "")
    //                        {
    //                            lblSecBg.Text = strSecBg + strSecRhf;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        lblSecBg.Text = "-";
    //                    }

    //                    try
    //                    {
    //                        DateTime sdoDt = DateTime.Parse(dt.Rows[i]["SDOB"].ToString());
    //                        lblSecSdob.Text = sdoDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblSecSdob.Text = "-"; }

    //                    // lblSecSbg.Text = dt.Rows[i]["SBG"].ToString() + " " + dt.Rows[i]["SRHF"].ToString();

    //                    string strSecSBg = dt.Rows[i]["BG"].ToString().Trim();
    //                    string strSecSRhf = dt.Rows[i]["RHF"].ToString();

    //                    if (strSecSBg != "Select")
    //                    {
    //                        if (strSecSBg != "")
    //                        {
    //                            lblSecSbg.Text = strSecSBg + strSecSRhf;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        lblSecSbg.Text = "-";
    //                    }


    //                    try
    //                    {
    //                        DateTime anniDt = DateTime.Parse(dt.Rows[i]["Anniversary"].ToString());
    //                        lblSecAnni.Text = anniDt.ToString("dd MMMM");
    //                    }
    //                    catch { lblSecAnni.Text = "-"; }


    //                    string strSecImg = dt.Rows[i]["MemberImage"].ToString();
    //                    if (strSecImg != "")
    //                    {
    //                        imgSecretary.Visible = true;
    //                        imgSecretary.ImageUrl = "../MemberImages/" + strSecImg;
    //                    }

    //                    string strSesSImg = dt.Rows[i]["SImage"].ToString();
    //                    if (strSesSImg != "")
    //                    {
    //                        imgSecretarySpouse.Visible = true;
    //                        imgSecretarySpouse.ImageUrl = "../MemberImages/" + strSesSImg;
    //                    }


    //                }

    //                //if (desi == "President Elect")
    //                //{
    //                //    lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();                       
    //                //    lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
    //                //    lblEmail.Text = dt.Rows[i]["EmailId"].ToString();                    
    //                //}

    //                //if (desi == "Hon. Treasurer")
    //                //{
    //                //    lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
    //                //    lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
    //                //    lblEmail.Text = dt.Rows[i]["EmailId"].ToString();
    //                //}

    //            }
    //            catch { }
    //        }
    //    }
    //}
    //private void GetNoOfMembers(int id)
    //{
    //    DataTable dt = new DataTable();
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "z_GetMaleFemaleMembersByClubId";
    //    obj.AddParam("@club_id", id);
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        //lblMembers.Text = dt.Rows[0]["Members"].ToString();
    //        lblMembers.Text = dt.Rows[0]["Total"].ToString();
    //        lblWomensMembers.Text = dt.Rows[0]["WomenMembers"].ToString();

    //    }
    //    else
    //    {
    //        lblMembers.Text = "-";
    //        lblWomensMembers.Text = "-";
    //    }
    //}
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    public string GetGridviewData(GridView gv)
    {
        StringBuilder strBuilder = new StringBuilder();
        StringWriter strWriter = new StringWriter(strBuilder);
        HtmlTextWriter htw = new HtmlTextWriter(strWriter);
        gv.RenderControl(htw);
        return strBuilder.ToString();
    }
    public string GetDetailsViewData1(DetailsView dv1)
    {
        StringBuilder strBuilder = new StringBuilder();
        StringWriter strWriter = new StringWriter(strBuilder);
        HtmlTextWriter htw = new HtmlTextWriter(strWriter);
        dv1.RenderControl(htw);
        return strBuilder.ToString();
    }
    public string GetDetailsViewData2(DetailsView dv2)
    {
        StringBuilder strBuilder = new StringBuilder();
        StringWriter strWriter = new StringWriter(strBuilder);
        HtmlTextWriter htw = new HtmlTextWriter(strWriter);
        dv2.RenderControl(htw);
        return strBuilder.ToString();
    }
    protected void BindGridview(int clubId)
    {
        DBconnection obj = new DBconnection();
        DataSet ds = new DataSet();       

        obj.SetCommandSP = "z_GetAllBodInMailByDist3141ClubId";
        obj.AddParam("@Dist3141ClubId", clubId);

        ds = obj.ExecuteDataSet();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void BindPresident(int clubId)
    {
        DBconnection obj = new DBconnection();
        DataTable ds = new DataTable();

        obj.SetCommandQry = "select * from View_BodMembers where designation='President' and DistrictClubID='" + clubId + "' and year ='2016 - 2017'";

        ds = obj.ExecuteTable();

        imgPresident = ds.Rows[0]["MemberImage"].ToString();
        imgPresidentSpouse = ds.Rows[0]["SImage"].ToString();

        DetailsView1.DataSource = ds;
        DetailsView1.DataBind();
    }
    protected void BindSecretary(int clubId)
    {        
        DBconnection obj = new DBconnection();
        DataTable ds = new DataTable();
        obj.SetCommandQry = "select * from View_BodMembers where designation='Secretary' and DistrictClubID='" + clubId + "' and year ='2016 - 2017'";
        ds = obj.ExecuteTable();
        imgSec = ds.Rows[0]["MemberImage"].ToString();
        imgSecSpouse = ds.Rows[0]["SImage"].ToString();
        DetailsView2.DataSource = ds;
        DetailsView2.DataBind();
    }
}

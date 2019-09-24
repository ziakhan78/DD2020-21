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

public partial class admin_view_presidents : System.Web.UI.Page
{
    int intYear = DateTime.Now.Year;
    string rotaryYear = "2016 - 2017";
    int m = DateTime.Now.Month;
    string designation = "";
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (m > 6 && m <= 12)
            rotaryYear = intYear + " - " + (intYear + 1);

        designation = rbtnDesignation.SelectedItem.Text.ToString();

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
        string email,Pass, clubName, name = "";
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
                            con.SetCommandQry = "select name, password, club_name from View_BodMembers where  EmailId='" + email + "' and MemType='Active' order by Name";
                            DataTable dt = con.ExecuteTable();
                            Pass = dt.Rows[0]["password"].ToString();
                            clubName = dt.Rows[0]["club_name"].ToString();
                            name = dt.Rows[0]["name"].ToString();


                            SendMailtoClient(email, Pass, clubName, name);
                            
                        }
                        catch {}
                    }                   
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }
    private void SendMailtoClient(string email,string password, string clubName, string name)
    {
        try
        {
            if (designation == "Secretary")
                designation = "Honorary Secretary";

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
           // mail.To.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Rotary District 3141 "+designation+" Login Information";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/PresidentLoginPassword.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("xxxDesig", designation + " " + name);
            strMessage = strMessage.Replace("xxxClubname", "Rotary Club of "+clubName);
            strMessage = strMessage.Replace("xxxLoginID", email);
            strMessage = strMessage.Replace("xxxPassword", password);


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
    protected void rbtnDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation = rbtnDesignation.SelectedItem.Text.ToString();
        ManageGrid();
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
                        SendMailtoDta(email);
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }
    private void SendMailtoDta(string email)
    {
        try
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            //mail.To.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.CC.Add("dggopal@rotarydist3141.com");
            mail.CC.Add("rajkhosla@puritytex.com");
            mail.CC.Add("rtnarun@gmail.com");
            mail.CC.Add("pnandekar @yahoo.com");            
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Zenith - District Training Assembly (DTA)";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/DTA.htm";
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

    protected void btnSendMail_Click(object sender, EventArgs e)
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
                        SendMailtoPresident(email);
                    }
                }
                chkbox.Checked = false;
            }
            catch { }
        }
    }

    private void SendMailtoPresident(string email)
    {
        try
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            //mail.To.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@rotarydist3141.com");
            mail.CC.Add("dggopal@rotarydist3141.com");
           // mail.CC.Add("rajkhosla@puritytex.com");
            mail.CC.Add("rtnarun@gmail.com");
           // mail.CC.Add("pnandekar @yahoo.com");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Club's Website Address";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/PresidentMail.htm";
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

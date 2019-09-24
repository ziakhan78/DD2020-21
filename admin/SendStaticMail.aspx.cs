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

public partial class admin_SendStaticMail : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = PresidentGrid.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rbtnSort.Visible = false;
            ddlAvenue.Visible = false;
            ManageGrid();
           // BindPresident();
        }
    }
    protected void ddlAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string position = ddlAvenue.SelectedItem.Text.Trim().ToString();
        BindDistrictOfficers(position);
    }
    private void BindDistDesignation()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='2016 - 2017' ORDER BY [designation] ";
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
    private void BindPresident()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and designation='President' and year='2016 - 2017' and MemType='Active' order by Name";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            PresidentGrid.Visible = true;
            PresidentGrid.DataSourceID = string.Empty;
            PresidentGrid.DataSource = dt;
            PresidentGrid.Rebind();
        }
        else
        {

            PresidentGrid.Visible = false;
        }
    }
    private void BindDistrictOfficers(string position)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        if (position == "All")
            obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='2016 - 2017' order by Name";
        else
            obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='2016 - 2017' and avenue='" + position + "' order by Name";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            PresidentGrid.Visible = true;
            PresidentGrid.DataSourceID = string.Empty;
            PresidentGrid.DataSource = dt;
            PresidentGrid.Rebind();
        }
        else
        {

            PresidentGrid.Visible = false;
        }
    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = PresidentGrid.CurrentPageIndex.ToString();
        rbtnSort.SelectedIndex = 0;
        if (rbtnType.SelectedValue == "0")
        {
           // DistrictOfficersGrid.Visible = false;

            ddlAvenue.Visible = false;
            rbtnSort.Visible = false;         

            BindPresident();
        }
        else
        {
            rbtnSort.Visible = true;
            ddlAvenue.Visible = false;
            //PresidentGrid.Visible = false;
            BindDistrictOfficers("All");
        }

    }
    protected void rbtnSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnSort.SelectedValue == "0")
        {
            rbtnSort.Visible = true;
            ddlAvenue.Visible = false;
            BindDistrictOfficers("All");
        }
        else
        {
            rbtnSort.Visible = true;
            ddlAvenue.Visible = true;
            BindDistDesignation();
        }
    }
    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string email = "";
            bool isChecked = false;

            //if (rbtnType.SelectedValue == "0")
            //{
            //PresidentGrid.Visible = true;
            // DistrictOfficersGrid.Visible = false;


            foreach (GridDataItem item in PresidentGrid.MasterTableView.Items)
            {
                try
                {
                    CheckBox chkbox = (CheckBox) item.FindControl("chkActive");
                    Label lblEmail = (Label) item.FindControl("lblEmail");

                    if (chkbox.Checked)
                    {
                        isChecked = true;
                        email = lblEmail.Text.ToString();
                        if (email != "")
                        {
                            try
                            {
                                SendMail(email);
                            }
                            catch { }
                        }
                    }
                    chkbox.Checked = false;
                }
                catch { }
            }

            if (isChecked == false)
            {
                string jv = "<script>alert('Please select atleast one checkbox!');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }



            // }
            //else
            //{
            //  PresidentGrid.Visible = false;
            // DistrictOfficersGrid.Visible = true;

            //foreach (GridDataItem item in DistrictOfficersGrid.MasterTableView.Items)
            //{
            //    try
            //    {
            //        CheckBox chkbox = (CheckBox) item.FindControl("chkActive");
            //        Label lblEmail = (Label) item.FindControl("lblEmail");

            //        if (chkbox.Checked)
            //        {
            //            isChecked = true;
            //            email = lblEmail.Text.ToString();
            //            if (email != "")
            //            {
            //                try
            //                {
            //                    SendMail(email);
            //                }
            //                catch { }
            //            }
            //        }
            //        chkbox.Checked = false;
            //    }
            //    catch { }
            //}

            //if (isChecked == false)
            //{
            //    string jv = "<script>alert('Please select atleast one checkbox!');</script>";
            //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            //}
            //}
        }
    }
    private void SendMail(string email)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);            
            mail.From = new MailAddress("dggopal@rotarydist3141.com");
            //mail.From = new MailAddress("mail@rotarydist3141.com");

            string strCc = txtCc.Text.Trim().ToString();
            if (strCc != "")
                mail.CC.Add(strCc);
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = txtSubject.Text.Trim().ToString();

            if (fileUploader.HasFile)
            {
                string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
            }
            

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/StaticMail.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("XXXtextmail", txtMessage.Content);
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


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

    private void ManageGrid()
    {
        try
        {
            if (rbtnType.SelectedValue == "0")
            {
                PresidentGrid.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                BindPresident();
            } 
            else if (rbtnType.SelectedValue == "1")
            {
                if (rbtnSort.SelectedValue == "0")
                {                   
                    BindDistrictOfficers("All");
                }
                else
                {
                    string position = ddlAvenue.SelectedItem.Text.Trim().ToString();
                    BindDistrictOfficers(position);
                }
                PresidentGrid.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
               // BindDistrictOfficers("All");
            }

            else
            {
                try
                {
                    PresidentGrid.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

                    BindPresident();
                }
                catch
                {
                    BindPresident();
                }
            }
        }
        catch { }
    }


    protected void PresidentGrid_PageIndexChanged(object sender, GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
}

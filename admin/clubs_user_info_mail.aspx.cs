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

public partial class admin_clubs_user_info_mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        int mid = 0;
        string email, Pass, website = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblcid = (Label)item.FindControl("lblcid");
               // Label lblEmail = (Label)item.FindControl("lblEmail");
                if (chkbox.Checked)
                {
                    mid = Int32.Parse(lblcid.Text.ToString());
                   // email = lblEmail.Text.ToString();
                    if (mid != null)
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "select * from View_DomainFTP where  MemberId='" + mid + "' ";
                            DataTable dt = con.ExecuteTable();

                            website = dt.Rows[0]["domain_name"].ToString();
                            email = dt.Rows[0]["EmailId"].ToString();
                            Pass = dt.Rows[0]["Password"].ToString();

                            SendMailtoClient(website,email, Pass);

                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }

        }
    }

    private void SendMailtoClient(string website,string email, string password)
    {
        try
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("mail@rotarydist3141.com");
            //mail.CC.Add("zia@goradiainfotech.com");
            mail.Subject = "Club Admin Login Information";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/ClubsUserInfo.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();

            strMessage = strMessage.Replace("xxxWebsite", website);           
            strMessage = strMessage.Replace("xxxLoginID", email);
            strMessage = strMessage.Replace("xxxPassword", password);


            mail.Body = strMessage;
            sr1.Close();

            // Create the credentials to login to the gmail account associated with my custom domain 

            //SmtpClient emailClient = new SmtpClient();           
            //emailClient.Credentials = new NetworkCredential("info@goradiainfotech.com", "omshanti2011");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.gmail.com";
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
}
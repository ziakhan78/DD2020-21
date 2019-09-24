using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class add_domain_ftp_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtESPother.Visible = false;

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDomain(id);
            }
        }
    }

    protected void CVClubname0_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVClubname0.Enabled = false;
        }
        else
        {
            try
            {
                string ss = DDLClubName.SelectedItem.Text.Trim().ToString();
                if (ss == "Select Club Name")
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }

    }
    protected void CVClubname_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVClubname.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select club_id from club_domain_ftp_tbl where club_id='" + DDLClubName.SelectedValue.ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }

    private void GetDomain(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_DomainFTP where id='" + id + "'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedValue = dt.Rows[0]["club_id"].ToString();
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            txtDomainName.Text = dt.Rows[0]["domain_name"].ToString();
            txtFTPusername.Text = dt.Rows[0]["ftp_username"].ToString();
            txtFTPpassword.Text = dt.Rows[0]["ftp_password"].ToString();

            
            string emailSp = dt.Rows[0]["email_sp"].ToString();
            if (emailSp != "outlook.com")
            {
                DDLesp.Items.Insert(1, "outlook.com");
            }
           
            if (emailSp == "")
            {
                DDLesp.SelectedItem.Text = "outlook.com";

            }
            else
            {                
                DDLesp.SelectedItem.Text = dt.Rows[0]["email_sp"].ToString();
            }
            txtMXrecord.Text = dt.Rows[0]["mx_record"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDomain(id);
            }
            else
            {
                AddDomain();
            }
        }
    }

    private void AddDomain()
    {
        try
        {
            int club_id = int.Parse(DDLClubName.SelectedValue.ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDomain";

            obj.AddParam("@domain_name", txtDomainName.Text.Trim().ToString());
            obj.AddParam("@ftp_username", txtFTPusername.Text.Trim().ToString());
            obj.AddParam("@ftp_password", txtFTPpassword.Text.Trim().ToString());
            obj.AddParam("@club_id", club_id);

            // MX Record
            string emailSP="";
            emailSP=DDLesp.SelectedValue.ToString();
            if(emailSP=="Other")
            {
                emailSP=txtESPother.Text.Trim().ToString();
            }
            obj.AddParam("@email_sp", emailSP);
            obj.AddParam("@mx_record", txtMXrecord.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDomain(int id)
    {
        try
        {
            int club_id = int.Parse(DDLClubName.SelectedValue.ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDomain";

            obj.AddParam("@id", id);
            obj.AddParam("@club_id", club_id);
            obj.AddParam("@domain_name", txtDomainName.Text.Trim().ToString());
            obj.AddParam("@ftp_username", txtFTPusername.Text.Trim().ToString());
            obj.AddParam("@ftp_password", txtFTPpassword.Text.Trim().ToString());

            // MX Record
            string emailSP = "";
            emailSP = DDLesp.SelectedValue.ToString();
            if (emailSP == "Other")
            {
                emailSP = txtESPother.Text.Trim().ToString();
            }
            obj.AddParam("@email_sp", emailSP);
            obj.AddParam("@mx_record", txtMXrecord.Text.Trim().ToString());


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                showmsg("Record updated successfully !", "view_domain_ftp.aspx");
            }
        }
        catch { }
    }

    private void Clear()
    {
        txtDomainName.Text = "www.";
        txtFTPpassword.Text = "";
        txtFTPusername.Text = "";
        DDLClubName.ClearSelection();
        DDLesp.SelectedIndex = 0;
        txtMXrecord.Text = "";
        txtESPother.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }

    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void DDLesp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLesp.SelectedValue == "Other")
        {
            txtESPother.Visible = true;
        }
        else
        {
            txtESPother.Visible = false;
        }

    }
}
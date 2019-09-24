using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_ftp_mx_record : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLClubName.Visible = false;
            DDLdomain.Visible = false;
            DDLpresident.Visible = false;
        }
    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string type = rbtnType.SelectedValue.ToString();
        if (type == "0")
        {
            DDLClubName.SelectedIndex = 0;
            DDLClubName.Visible = true;
            DDLdomain.Visible = false;
            DDLpresident.Visible = false;
        }
        if (type == "1")
        {
            DDLpresident.SelectedIndex = 0;
            DDLClubName.Visible = false;
            DDLdomain.Visible = false;
            DDLpresident.Visible = true;
        }
        
        if (type == "2")
        {
            DDLdomain.SelectedIndex = 0;
            DDLClubName.Visible = false;
            DDLdomain.Visible = true;
            DDLpresident.Visible = false;
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GetData(int.Parse(DDLClubName.SelectedValue.ToString()));
        }
        catch { }
    }

    private void GetData(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_DomainFTP where id='" + id + "'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblPresident.Text = dt.Rows[0]["name"].ToString();
            lblClubname.Text = dt.Rows[0]["club_name"].ToString();
            lblFTPuser.Text = dt.Rows[0]["ftp_username"].ToString();
            lblFTPpassword.Text = dt.Rows[0]["ftp_password"].ToString();
            lblemailSP.Text = dt.Rows[0]["email_sp"].ToString();            
            lblMXrecord.Text = dt.Rows[0]["mx_record"].ToString();

            string dom = dt.Rows[0]["domain_name"].ToString();
            lblDomain.Text = dom;
             dom="http://"+dom;
            linkDomain.HRef=dom;          
        }
    }
    protected void DDLdomain_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GetData(int.Parse(DDLdomain.SelectedValue.ToString()));
        }
        catch { }
    }
    protected void DDLpresident_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GetData(int.Parse(DDLpresident.SelectedValue.ToString()));
        }
        catch { }
    }
}
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = this.btnsubmit.UniqueID;

        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                txtoldp.Focus();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
        
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "Sp_AccessPassword";
        obj.AddParam("@oldpass", txtoldp.Text.Trim());
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count == 0)
        {
            //show("Wrong Old password!");
            string jv = "<script>alert('Wrong Old Password!');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            clear();
        }
        else
        {
            if (dt.Rows[0]["Password"].ToString() == txtoldp.Text.Trim())
            {
                DBconnection con = new DBconnection();
                con.SetCommandQry = "update Users set Password='" + txtnewp.Text.Trim() + "' where Password='" + txtoldp.Text.Trim() + "'";
                if (con.ExecuteNonQuery() > 0)
                {
                    //showmsg("Password Updated Succeessfully!", "Default.aspx");
                    string jv = "<script>alert('Password Updated Succeessfully!');</script>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                }
                else { }
            }
            else
            {
                //show("Wrong Password");
                string jv = "<script>alert('Wrong Password!');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                clear();
            }
        }
    }
    public void clear()
    {
        txtoldp.Text = "";
        txtnewp.Text = "";
        txtretp.Text = "";

        txtoldp.Focus();
    }
    public void show(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
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
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }
}

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

public partial class admin_add_hotlinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {

            if (!IsPostBack)
            {
                BindHotLinksList("District");

                DDLClubName.Visible = false;
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetHotLinks(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void BindHotLinksList(string links_for)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetHotLinksList";
        obj.AddParam("@link_for", links_for);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;

            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            RadGrid1.Visible = false;
            lblMsg.Visible = true;
        }
    }


    private void GetHotLinks(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetHotLink";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtTitle.Text = dt.Rows[0]["title"].ToString();
            txtlink.Text = dt.Rows[0]["link_file"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateHotLinks(id);
            }
            else
            {
                AddHotLinks();
            }
        }
    }
    private void UpdateHotLinks(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateHotLink";
            obj.AddParam("@id", id);
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@link_file", txtlink.Text.ToString());

            int i = int.Parse(rbtnFor.SelectedValue.ToString());
            if (i == 0 || i == 2)
            {
                obj.AddParam("@DistrictClubID", 0);
            }

            else
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                obj.AddParam("@DistrictClubID", cid);
            }

            obj.AddParam("@link_for", rbtnFor.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully", "view_hotlinks.aspx");

            }
        }
        catch { }
    }
    private void AddHotLinks()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddHotLink";
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@link_file", txtlink.Text.ToString());

            int i = int.Parse(rbtnFor.SelectedValue.ToString());
            if (i == 0 || i == 2)
            {
                obj.AddParam("@DistrictClubID", 0);
            }

            else
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                obj.AddParam("@DistrictClubID", cid);
            }


            obj.AddParam("@added_by", "Admin");
            obj.AddParam("@link_for", rbtnFor.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {

                string type = rbtnFor.SelectedItem.Text.Trim().ToString();
                BindHotLinksList(type);

                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    private void clear()
    {
        txtTitle.Text = "";
        txtlink.Text = "";
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
    protected void rbtnFor_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = int.Parse(rbtnFor.SelectedValue.ToString());

        string type = rbtnFor.SelectedItem.Text.Trim().ToString();
        BindHotLinksList(type);

        if (i == 0 || i == 2)
        {
            DDLClubName.Visible = false;
        }
        else
        {
            DDLClubName.Visible = true;
        }
    }
}
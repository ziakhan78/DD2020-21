using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_ri_awards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetRIAwards(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Page.IsValid)
            {
                if (Request.QueryString["id"] != null)
                {
                    

                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdateRIAwards(id);
                }
                else
                {
                    
                    AddRIAwards();
                }
            }
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void GetRIAwards(int id)
    {

        awards a = new awards();
        a.Id = id;

        DataTable dt = new DataTable();
        dt = a.GetRIAwards();
        if (dt.Rows.Count > 0)
        {
            txtNomenclature.Text = dt.Rows[0]["name"].ToString();
            txtWhom.Text = dt.Rows[0]["whome"].ToString();
            txtPurpose.Text = dt.Rows[0]["purpose"].ToString();
            txtEligibility.Text = dt.Rows[0]["eligibility"].ToString();
            txtSelection.Text = dt.Rows[0]["selection"].ToString();
            txtDeadLine.Text = dt.Rows[0]["dead_line"].ToString();
            txtRemarks.Text = dt.Rows[0]["remarks"].ToString();

        }

    }
    private void AddRIAwards()
    {
        awards a = new awards();       

        a.Name = txtNomenclature.Text.Trim().ToString();
        a.Whome = txtWhom.Text.Trim().ToString();
        a.Purpose = txtPurpose.Text.Trim().ToString();
        a.Eligibility = txtEligibility.Text.Trim().ToString();
        a.Selection = txtSelection.Text.Trim().ToString();
        a.Deadline = txtDeadLine.Text.Trim().ToString();
        a.Remarks = txtRemarks.Text.Trim().ToString();       

        int exe = a.AddRIAwards();
        if (exe > 0)
        {
            Reset();
            string jv = "<script>alert('Record Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

    private void UpdateRIAwards(int id)
    {
        awards a = new awards();

        a.Id = id;
        a.Name = txtNomenclature.Text.Trim().ToString();
        a.Whome = txtWhom.Text.Trim().ToString();
        a.Purpose = txtPurpose.Text.Trim().ToString();
        a.Eligibility = txtEligibility.Text.Trim().ToString();
        a.Selection = txtSelection.Text.Trim().ToString();
        a.Deadline = txtDeadLine.Text.Trim().ToString();
        a.Remarks = txtRemarks.Text.Trim().ToString();

        int exe = a.UpdateRIAwards();
        if (exe > 0)
        {
            Reset();
            //string jv = "<script>alert('Record Update Successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            showmsg("Record updated successfully !", "view_ri_awards.aspx");
        }
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
    private void Reset()
    {
        txtDeadLine.Text = "";
        txtEligibility.Text = "";
        txtNomenclature.Text = "";
        txtPurpose.Text = "";
        txtRemarks.Text = "";
        txtSelection.Text = "";
        txtWhom.Text = "";
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_award : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                trDonor.Visible = false;
                BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetAward(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetAward(int award_id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetAward";
        obj.AddParam("@award_id", award_id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLCategory.SelectedItem.Text = dt.Rows[0]["category"].ToString();
            txtAwardName.Text = dt.Rows[0]["award_name"].ToString();
            DDLDonor.SelectedItem.Text = dt.Rows[0]["donor"].ToString();
            DDLYear.SelectedItem.Text = dt.Rows[0]["constituted_on"].ToString();
           
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateAward(id);
            }
            else
            {
                AddAward();
            }
        }
    }

    private void AddAward()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDistrictAward";
            obj.AddParam("@category", DDLCategory.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@award_name", txtAwardName.Text.Trim().ToString());
            string ss = DDLDonor.SelectedItem.Text.Trim().ToString();
            if (ss == "Select")
            {
                obj.AddParam("@donor", txtOtherDonor.Text.Trim().ToString());
            }
            else
            {
                obj.AddParam("@donor", DDLDonor.SelectedItem.Text.Trim().ToString());
            }
            obj.AddParam("@constituted_on", DDLYear.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateAward(int award_id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDistrictAward";

            obj.AddParam("@award_id", award_id);
            obj.AddParam("@category", DDLCategory.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@award_name", txtAwardName.Text.Trim().ToString());
            string ss = DDLDonor.SelectedItem.Text.Trim().ToString();
            if (ss == "Select")
            {
                obj.AddParam("@donor", txtOtherDonor.Text.Trim().ToString());
            }
            else
            {
                obj.AddParam("@donor", DDLDonor.SelectedItem.Text.Trim().ToString());
            }
            obj.AddParam("@constituted_on", DDLYear.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_award.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtAwardName.Text = "";
        //txtAwardPur.Text = "";
       // txtConsti.Text = "";
        //RadDatePicker1.Clear();
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
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

    private void BindYears()
    {
        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt); i >= 1920; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLYear.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void chkIfOther_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIfOther.Checked == true)
        {
            DDLDonor.SelectedIndex = 0;
            trDonor.Visible = true;
        }
        else
        {
            trDonor.Visible = false;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_discon_registration_rate : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                rbtnRegisFor.Visible = true;
                rbtnSingleCouple.Visible = false;

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetDisconRegistrationRate(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetDisconRegistrationRate(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "disc_GetDisconRegistrationFees";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            rbtnMemType.SelectedItem.Text = dt.Rows[0]["member_type"].ToString();
            ddlCat.SelectedItem.Text = dt.Rows[0]["category"].ToString();
            rbtnRegisFor.SelectedItem.Text = dt.Rows[0]["registration_fees_for"].ToString();
            dateFrom.DbSelectedDate = dt.Rows[0]["date_from"].ToString();
            dateTo.DbSelectedDate = dt.Rows[0]["date_to"].ToString();
            txtAmt.Text = dt.Rows[0]["amount"].ToString();
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDisconRegistrationRate(id);
            }
            else
            {
                AddDisconRegistrationRate();
            }
        }
    }

    private void AddDisconRegistrationRate()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "disc_AddDisconRegistrationFees";
            obj.AddParam("@member_type", rbtnMemType.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@category", ddlCat.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@registration_fees_for", rbtnRegisFor.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@date_from", DateTime.Parse(dateFrom.SelectedDate.ToString()));
            obj.AddParam("@date_to", DateTime.Parse(dateTo.SelectedDate.ToString()));
            obj.AddParam("@amount", decimal.Parse(txtAmt.Text.Trim().ToString()));
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

    private void UpdateDisconRegistrationRate(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "disc_UpdateDisconRegistrationFees";

            obj.AddParam("@id", id);
            obj.AddParam("@member_type", rbtnMemType.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@category", ddlCat.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@registration_fees_for", rbtnRegisFor.SelectedItem.Text.Trim().ToString());
            try
            {
                obj.AddParam("@date_from", DateTime.Parse(dateFrom.SelectedDate.ToString()));
            }
            catch { obj.AddParam("@date_from", null); }
            try
            {
                obj.AddParam("@date_to", DateTime.Parse(dateTo.SelectedDate.ToString()));
            }
            catch { obj.AddParam("@date_to", null); }
            obj.AddParam("@amount", decimal.Parse(txtAmt.Text.Trim().ToString()));


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_add_discon_registration_rate.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {

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
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            // CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select category from discon_registration_rate_master_tbl where category='" + ddlCat.SelectedItem.Text.Trim().ToString() + "' and member_type='" + rbtnMemType.SelectedItem.Text.Trim().ToString() + "'";
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
    protected void rbtnMemType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnMemType.SelectedValue == "0")
        {
            rbtnRegisFor.Visible = true;
            rbtnSingleCouple.Visible = false;
        }
        else
        {
            rbtnSingleCouple.Visible = true;
            rbtnRegisFor.Visible = false;
        }
    }
}

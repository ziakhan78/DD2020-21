using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class admin_add_district_no : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add District No.";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDistrictNo(id);
            }
        }
    }
    private void GetDistrictNo(int id)
    {
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetDistrictNo();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit District No.";
            txtDistNo.Text = dt.Rows[0]["district_no"].ToString();
        }

    }
    private void AddDistrictNo()
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.DistrictNo = int.Parse(txtDistNo.Text.Trim().ToString());
            int i = obj.AddDistrictNo();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('District No. Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateDistrictNo(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.DistrictNo = int.Parse(txtDistNo.Text.Trim().ToString());
            int i = obj.UpdateColors();

            if (i > 0)
            {
                Clear();
                showmsg("District No. Has Been Updated Successfully", "view_district_no.aspx");
            }
        }
        catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtDistNo.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDistrictNo(id);
            }
            else
            {
                AddDistrictNo();
            }
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
    protected void CVDistNo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVDistNo.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select color_name from color_master_tbl where color_name='" + txtDistNo.Text.Trim().ToString() + "'";
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
}
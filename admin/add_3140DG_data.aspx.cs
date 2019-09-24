using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_3140DG_data : System.Web.UI.Page
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
                    GetData(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetData(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDGsRIPs";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtData.Content = dt.Rows[0]["DGs_RIPs_Data"].ToString();
            DDLDGs.SelectedItem.Text = dt.Rows[0]["DGs_RIPs"].ToString();

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateThrustarea(id);
            }
            else
            {
                AddData();
            }
        }
    }

    private void AddData()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDGsRIPs";

            obj.AddParam("@DGs_RIPs", DDLDGs.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@DGs_RIPs_Data", txtData.Content);


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

    private void UpdateThrustarea(int award_id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDGsRIPs";

            obj.AddParam("@id", award_id);
            obj.AddParam("@DGs_RIPs", DDLDGs.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@DGs_RIPs_Data", txtData.Content);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully !", "view_3140DG_data.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtData.Content = "";
        DDLDGs.ClearSelection();
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

    protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CV.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select DGs_RIPs from DGs_RIPs_Data_tbl where DGs_RIPs='" + DDLDGs.SelectedItem.Text.Trim().ToString() + "'";
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

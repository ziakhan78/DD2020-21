using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_service_above_self_awards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindYears();
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetSASA(id);
            }
        }
    }
    private void BindYears()
    {
        try
        {
            for (Int32 i = 1995; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());
            }
           // DDLYears.Items.Insert(0, "Year");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetSASA(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetService_above_self_awards";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();
            drtitle.SelectedItem.Text = dt.Rows[0]["title"].ToString();
            txtfname.Text = dt.Rows[0]["fname"].ToString();
            txtmname.Text = dt.Rows[0]["mname"].ToString();
            txtlname.Text = dt.Rows[0]["lname"].ToString();
            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSASA(id);
            }
            else
            {
                AddSASA();
            }
        }
    }
    private void AddSASA()
    {
        if (Page.IsValid)
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandSP = "z_Add_service_above_self_awards";
                obj.AddParam("@years", DDLYears.SelectedItem.Text.ToString());
                obj.AddParam("@title", drtitle.SelectedItem.Text.ToString());
                obj.AddParam("@fname", txtfname.Text.ToString());
                obj.AddParam("@mname", txtmname.Text.ToString());
                obj.AddParam("@lname", txtlname.Text.ToString());
                obj.AddParam("@DistrictClubID", int.Parse(DDLClubName.SelectedValue.ToString()));
                obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.ToString());

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
    }
    private void UpdateSASA(int id)
    {
        if (Page.IsValid)
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandSP = "z_UpdateService_above_self_awards";
                obj.AddParam("@id", id);
                obj.AddParam("@years", DDLYears.SelectedItem.Text.ToString());
                obj.AddParam("@title", drtitle.SelectedItem.Text.ToString());
                obj.AddParam("@fname", txtfname.Text.ToString());
                obj.AddParam("@mname", txtmname.Text.ToString());
                obj.AddParam("@lname", txtlname.Text.ToString());
                obj.AddParam("@DistrictClubID", int.Parse(DDLClubName.SelectedValue.ToString()));
                obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.ToString());

                int exe = obj.ExecuteNonQuery();

                if (exe > 0)
                {
                    clear();
                    //string jv = "<script>alert('Record Has Been Updated Successfully');</script>";
                    //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    showmsg("Record Has Been Updated Successfully", "view_major_donors.aspx");
                }
            }
            catch { }
        }
    }
    private void clear()
    {
        txtfname.Text = "";
        txtmname.Text = "";
        txtlname.Text = "";
        DDLYears.SelectedIndex = 0;
        DDLClubName.SelectedIndex = 0;
        drtitle.SelectedIndex = 0;
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
}
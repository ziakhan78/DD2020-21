using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_rotary_eclubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        { 
            if (!IsPostBack)
            {
                BindTime();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetEclubs(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }
    }
    private void BindTime()
    {
        string s = "";
        for (int i = 1; i <= 12; i++)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLTimeH.Items.Add(s.ToString());
        }
        DDLTimeH.Items.Insert(0, "HH");
        DDLTimeH.Items.Insert(1, "00");
        for (int i = 5; i <= 55; i = i + 5)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLTimeM.Items.Add(s.ToString());
        }
        DDLTimeM.Items.Insert(0, "MM");
        DDLTimeM.Items.Insert(1, "00");
    }
    private void GetEclubs(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetEclubs";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLDay.SelectedItem.Text = dt.Rows[0]["day"].ToString();        
            
            string[] time = dt.Rows[0]["time"].ToString().Split(':');
            DDLTimeH.SelectedValue = time[0].ToString();
            DDLTimeM.SelectedValue = time[1].ToString();
            DDLTimeAMPM.SelectedValue = time[2].ToString();

            txtClubname.Text = dt.Rows[0]["club_name"].ToString();
            txtCountry.Text = dt.Rows[0]["country"].ToString();
            txtDistrictNo.Text = dt.Rows[0]["district"].ToString();
            txtWebsite.Text = dt.Rows[0]["website"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateEclubs(id);
            }
            else
            {
                AddEclubs();
            }
        }
    }

    private void AddEclubs()
    {
        try
        {
            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTimeAMPM.SelectedItem.Text;

            time = h + ":" + m + ":" + am;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddEclubs";
            obj.AddParam("@club_name", txtClubname.Text.Trim().ToString());
            obj.AddParam("@day", DDLDay.SelectedItem.Text.Trim().ToString());            
            obj.AddParam("@time", time);
            obj.AddParam("@district", txtDistrictNo.Text.Trim().ToString());
            obj.AddParam("@country", txtCountry.Text.Trim().ToString());
            obj.AddParam("@website", txtWebsite.Text.Trim().ToString());

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

    private void UpdateEclubs(int id)
    {
        try
        {
            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTimeAMPM.SelectedItem.Text;

            time = h + ":" + m + ":" + am;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateEclubs";
            obj.AddParam("@id", id);
            obj.AddParam("@club_name", txtClubname.Text.Trim().ToString());
            obj.AddParam("@day", DDLDay.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@time", time);
            obj.AddParam("@district", txtDistrictNo.Text.Trim().ToString());
            obj.AddParam("@country", txtCountry.Text.Trim().ToString());
            obj.AddParam("@website", txtWebsite.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_rotary_eclubs.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtClubname.Text = "";
        txtCountry.Text = "";
        txtDistrictNo.Text = "";
        txtWebsite.Text = "";
        DDLDay.SelectedIndex = 0;
        DDLTimeH.SelectedIndex = 0;
        DDLTimeM.SelectedIndex = 0;
        DDLTimeAMPM.SelectedIndex = 0;
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


    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Request.QueryString["id"] != null)
    //    {
    //        CustomValidator1.Enabled = false;
    //    }
    //    else
    //    {
    //        try
    //        {
    //            DBconnection obj = new DBconnection();
    //            obj.SetCommandQry = "select club_name from ocv_calendar_tbl where club_name='" + DDLClubName.SelectedItem.Text.Trim().ToString() + "'";
    //            object res = obj.ExecuteScalar();
    //            if (res != null)
    //                args.IsValid = false;
    //            else
    //                args.IsValid = true;
    //        }
    //        catch
    //        {
    //            args.IsValid = true;
    //        }
    //    }
    //}
}

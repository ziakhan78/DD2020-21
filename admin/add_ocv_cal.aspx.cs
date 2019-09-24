using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_ocv_cal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            DDLClubName.DataSourceID = "DSDistClubNo";
            DDLClubName.DataBind();

            if (!IsPostBack)
            {
                BindTime();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetOCV(id);
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
        DDLTimeH.Items.Insert(0, "00");
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
        //DDLTimeM.Items.Insert(0, "MM");
        DDLTimeM.Items.Insert(0, "00");
    }
    private void GetOCV(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetOCVCal";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["club_id"].ToString();
            RadDatePicker1.DbSelectedDate = dt.Rows[0]["date"].ToString();
            string[] time = dt.Rows[0]["time"].ToString().Split(':');
            DDLTimeH.SelectedValue = time[0].ToString();
            DDLTimeM.SelectedValue = time[1].ToString();
            DDLTimeAMPM.SelectedValue = time[2].ToString();

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateOCV(id);
            }
            else
            {
                AddOCV();
            }
        }
    }

    private void AddOCV()
    {
        try
        {
            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTimeAMPM.SelectedItem.Text;

            time = h + ":" + m + ":" + am;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddOCVCal";
            obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@date", DateTime.Parse(RadDatePicker1.SelectedDate.Value.ToString()));
            obj.AddParam("@time", time);

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

    private void UpdateOCV(int id)
    {
        try
        {
            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTimeAMPM.SelectedItem.Text;

            time = h + ":" + m + ":" + am;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateOCVCal";
            obj.AddParam("@id", id);
            obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@date", DateTime.Parse(RadDatePicker1.SelectedDate.Value.ToString()));
            obj.AddParam("@time", time);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_ocv_cal.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        DDLClubName.SelectedIndex = 0;
        RadDatePicker1.Clear();
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
            CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select club_name from ocv_calendar_tbl where club_name='" + DDLClubName.SelectedItem.Text.Trim().ToString() + "' and datepart(year,date)='2013'";
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

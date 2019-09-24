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

public partial class AddSpeakerEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DDLClubName.DataSourceID = "DSDistClubNo";
                DDLClubName.DataBind();

                BindTime();
                TREvents.Visible = false;
                TRGuestCharge.Visible = false;
                TRSpeaker.Visible = true;
                TRTopics.Visible = true;

                if (Request.QueryString["id"] != null)
                {
                    int eid = int.Parse(Request.QueryString["id"].ToString());
                    GetEvents(eid);
                }
                else
                {

                    //string ve = rbtnvenue.SelectedItem.Text;
                    //if (ve == "Regular")
                    //{
                    //    int cid = int.Parse(Session["DistrictClubID"].ToString());
                    //    GetClubDetails(cid);
                    //}
                    //else
                    //{
                    //    txtvenue.Text = "";
                    //}
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetEvents(int eid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetSpeakerEvents";
        obj.AddParam("@event_id", eid);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();

            string se = dt.Rows[0]["speaker_events"].ToString();

            if (se == "Speaker")
            {
                TREvents.Visible = false;
                TRSpeaker.Visible = true;
                TRTopics.Visible = true;
                rbtnSpeaEvents.Items[0].Selected = true;
                txtspeaker.Text = dt.Rows[0]["name"].ToString();
            }
            else
            {
                TREvents.Visible = true;
                TRSpeaker.Visible = false;
                TRTopics.Visible = false;
                rbtnSpeaEvents.Items[1].Selected = true;
                txtevents.Text = dt.Rows[0]["event_name"].ToString();
            }


            string event_type = dt.Rows[0]["event_type"].ToString();


            if (event_type == "Club")
            {
                rbtnEventType.SelectedIndex = 0;
            }
            if (event_type == "District")
            {
                rbtnEventType.SelectedIndex = 1;
            }            

            txttopics.Text = dt.Rows[0]["topics"].ToString();

            string venue_type=dt.Rows[0]["venue_type"].ToString();
            try
            {
                if (venue_type == "Regular")
                    rbtnvenue.SelectedIndex = 0;
                else
                    rbtnvenue.SelectedIndex = 1;
            }
            catch { }


            txtvenue.Text = dt.Rows[0]["venue"].ToString();
            RadDatePicker1.SelectedDate = DateTime.Parse(dt.Rows[0]["date"].ToString());

            string[] time = dt.Rows[0]["time"].ToString().Split(':');
            if (dt.Rows[0]["time"] != "")
            {
                DDLTimeH.Text = time[0].ToString();
                string ss = time[1].ToString();
                string[] sss = ss.Split(' ');

                DDLTimeM.SelectedValue = sss[0].ToString();
                DDLTime.SelectedValue = sss[1].ToString();
            }

            string avenue = dt.Rows[0]["avenue"].ToString();
            if (avenue != "")
            {
                DDLAvenueCovered.SelectedItem.Text = avenue;
            }
            else
            {
                DDLAvenueCovered.SelectedItem.Text = "Select";
            }

            string guestAllowed = dt.Rows[0]["guest_allowed"].ToString();


            if (guestAllowed == "No")
            {
                rbtnGuestAll.SelectedIndex = 0;
                TRGuestCharge.Visible = false;
            }
            if (guestAllowed == "Yes")
            {
                TRGuestCharge.Visible = true;
                rbtnGuestAll.SelectedIndex = 1;
                txtCost.Text = dt.Rows[0]["guest_charges"].ToString();
            }

            string dressCode = dt.Rows[0]["dress_code"].ToString();


            if (dressCode == "Formals")
            {
                rbtnDress.SelectedIndex = 0;
            }
            if (dressCode == "Smart Casuals")
            {
                rbtnDress.SelectedIndex = 1;
            }
            if (dressCode == "Ethnic")
            {
                rbtnDress.SelectedIndex = 2;
            }

            txtdescription.Text = dt.Rows[0]["description"].ToString();   

        }
    }

    private void GetClubDetails(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDistrictClubDetails";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string[] time = dt.Rows[0]["time"].ToString().Split(':');
            DDLTimeH.SelectedItem.Text = time[0].ToString();
            DDLTimeM.SelectedItem.Text = time[1].ToString();
            DDLTime.SelectedItem.Text = time[2].ToString();

            txtvenue.Text = dt.Rows[0]["venue1"].ToString() + " " + dt.Rows[0]["venue2"].ToString() + " " + dt.Rows[0]["city"].ToString();
            //string gps = dt.Rows[0]["gps_latitude"].ToString();
            //if (gps != "")
            //{
            //    lblGPS.Text = "Latitude : " + dt.Rows[0]["gps_latitude"].ToString() + "    " + "Longitude : " + dt.Rows[0]["gps_longitude"].ToString();
            //}
            //else
            //{
            //    lblGPS.Text = "";
            //}
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
    protected void rbtnSpeaEvents_SelectedIndexChanged(object sender, EventArgs e)
    {
        string se = rbtnSpeaEvents.SelectedItem.Text;
        if (se == "Speaker")
        {
            TREvents.Visible = false;
            TRSpeaker.Visible = true;
            TRTopics.Visible = true;
        }
        else
        {
            TREvents.Visible = true;
            TRSpeaker.Visible = false;
            TRTopics.Visible = false;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSpeakerEvents(id);
            }
            else
            {
                AddSpeakerEvent();
            }
        }

    }
    private void AddSpeakerEvent()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_AddSpeakerEvents";
            
            int cid = int.Parse(DDLClubName.SelectedValue.ToString());
            obj.AddParam("@DistrictClubID", cid);
            obj.AddParam("@added_by", "Admin");
            

            string name;
            string sp_events;
            string se = rbtnSpeaEvents.SelectedItem.Text;
            if (se == "Speaker")
            {
                sp_events = "Speaker";
                name = txtspeaker.Text;
                obj.AddParam("@name", name);
                obj.AddParam("@event_name", "");
            }
            else
            {
                sp_events = "Event";
                obj.AddParam("@name", "");
                obj.AddParam("@event_name", txtevents.Text.ToString());
            }

            obj.AddParam("@event_type", rbtnEventType.SelectedItem.Text);

            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTime.SelectedItem.Text;

            time = h + ":" + m + " " + am;
            if (h != "HH" || m != "MM")
            {
                obj.AddParam("@time", time);
            }
            else
            {
                obj.AddParam("@time", "");
            }

            obj.AddParam("@date", DateTime.Parse(RadDatePicker1.SelectedDate.ToString()));
            obj.AddParam("@topics", txttopics.Text.Trim());
            obj.AddParam("@venue_type", rbtnvenue.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@venue", txtvenue.Text.Trim());
            obj.AddParam("@speaker_events", sp_events);

            string ga = rbtnGuestAll.SelectedItem.Text;

            obj.AddParam("@guest_allowed", ga);
            if (ga == "Yes")
                obj.AddParam("@guest_charges", Decimal.Parse(txtCost.Text.Trim().ToString()));
            else
                obj.AddParam("@guest_charges", 0);

            obj.AddParam("@dress_code", rbtnDress.SelectedItem.Text.Trim().ToString());

            string avenue = DDLAvenueCovered.SelectedItem.Text.Trim().ToString();
            if (avenue == "Select")
            {
                obj.AddParam("@avenue", "");
            }
            else
            {
                obj.AddParam("@avenue", avenue);
            }

            obj.AddParam("@description", txtdescription.Text.Trim().ToString());

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
    private void UpdateSpeakerEvents(int id)
    {
        BindTime();
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_UpdateSpeakerEvents";

            int cid = int.Parse(DDLClubName.SelectedValue.ToString());
            obj.AddParam("@DistrictClubID", cid);
            //obj.AddParam("@added_by", "Admin");

            string name;
            string sp_events;
            string se = rbtnSpeaEvents.SelectedItem.Text;

            if (se == "Speaker")
            {
                sp_events = "Speaker";
                name = txtspeaker.Text;
                obj.AddParam("@name", name);
                obj.AddParam("@event_name", "");
            }
            else
            {
                sp_events = "Event";
                obj.AddParam("@name", "");
                obj.AddParam("@event_name", txtevents.Text.ToString());
            }

            obj.AddParam("@event_type", rbtnEventType.SelectedItem.Text);

            string h, m, am, time = "";
            h = DDLTimeH.SelectedItem.Text;
            m = DDLTimeM.SelectedItem.Text;
            am = DDLTime.SelectedItem.Text;

            time = h + ":" + m + " " + am;
            if (h != "HH" || m != "MM")
            {
                obj.AddParam("@time", time);
            }
            else
            {
                obj.AddParam("@time", "");
            }

            obj.AddParam("@date", DateTime.Parse(RadDatePicker1.SelectedDate.ToString()));
            obj.AddParam("@topics", txttopics.Text.Trim());
            obj.AddParam("@venue_type", rbtnvenue.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@venue", txtvenue.Text.Trim());
            obj.AddParam("@speaker_events", sp_events);
            obj.AddParam("@event_id", id);

            string ga = rbtnGuestAll.SelectedItem.Text;

            obj.AddParam("@guest_allowed", ga);
            if (ga == "Yes")
                obj.AddParam("@guest_charges", Decimal.Parse(txtCost.Text.Trim().ToString()));
            else
                obj.AddParam("@guest_charges", 0);

            obj.AddParam("@dress_code", rbtnDress.SelectedItem.Text.Trim().ToString());

            string avenue = DDLAvenueCovered.SelectedItem.Text.Trim().ToString();
            if (avenue == "Select")
            {
                obj.AddParam("@avenue", "");
            }
            else
            {
                obj.AddParam("@avenue", avenue);
            }

            obj.AddParam("@description", txtdescription.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully", "ViewSpeakerEvents.aspx");
                //string jv = "<script>alert('Record Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void clear()
    {
        TRGuestCharge.Visible = false;
        rbtnGuestAll.SelectedIndex = 0;
        rbtnDress.SelectedIndex = 0;

        txtevents.Text = "";
        txtspeaker.Text = "";
        txttopics.Text = "";
        //txtvenue.Text = "";       
        RadDatePicker1.Clear();
        
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void rbtnvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string ve = rbtnvenue.SelectedItem.Text;
            if (ve == "Regular")
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                GetClubDetails(cid);
            }
            else
            {
                txtvenue.Text = "";
            }
        }
        catch { }
    }
    protected void rbtnGuestAll_SelectedIndexChanged(object sender, EventArgs e)
    {
        string se = rbtnGuestAll.SelectedItem.Text;
        if (se == "Yes")
        {
            TRGuestCharge.Visible = true;
        }
        else
        {
            TRGuestCharge.Visible = false;
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
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string ve = rbtnvenue.SelectedItem.Text;
            if (ve == "Regular")
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                GetClubDetails(cid);
            }
            else
            {
                txtvenue.Text = "";
            }
        }
        catch { }
    }
}

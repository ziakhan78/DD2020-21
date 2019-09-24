using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;

public partial class admin_add_upcoming_events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                trRegister.Visible = false;
                mapImg.Visible = false;
                eventImg.Visible = false;
                trLeadHost.Visible = false;
                trCoHost1.Visible = false;
                trCoHost2.Visible = false;
                trCoHost3.Visible = false;
                trCommitteeHost.Visible = false;
              
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetEvents(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }

    }   

    private void GetEvents(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_Get_upcoming_events";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
          

            string year= dt.Rows[0]["year"].ToString();
            if (year == "2016 - 2017")
                rbtnYear.SelectedIndex = 0;
            if (year == "2017 - 2018")
                rbtnYear.SelectedIndex =1;
            if (year == "2018 - 2019")
                rbtnYear.SelectedIndex = 2;

            txtEventName.Text = dt.Rows[0]["event_name"].ToString();

            eventDate.SelectedDate = DateTime.Parse(dt.Rows[0]["event_date"].ToString());
            try
            {
                eventTime.SelectedDate = DateTime.Parse(dt.Rows[0]["event_time"].ToString());
            }
            catch { }

           
           
            txtVenue1.Text = dt.Rows[0]["venue1"].ToString();
            txtVenue2.Text = dt.Rows[0]["venue2"].ToString();
            txtVenue3.Text = dt.Rows[0]["venue3"].ToString();

            txtEventDesc.Content = dt.Rows[0]["event_description"].ToString();
            rbtnDressCode.SelectedItem.Text = dt.Rows[0]["dress_code"].ToString();
            txtGPSLati.Text = dt.Rows[0]["gps_latitude"].ToString();
            txtGPSLongi.Text = dt.Rows[0]["gps_longitude"].ToString();

            string map = dt.Rows[0]["direction_map"].ToString();
            if (map != "")
            {
                Session["DirectionMap"] = map;
                mapImg.Visible = true;
                mapImg.ImageUrl = "../EventImages/" + map;
            }
            string img = dt.Rows[0]["image"].ToString();

            if (img != "")
            {
                Session["EventImage"] = img;
                eventImg.Visible = true;
                eventImg.ImageUrl = "../EventImages/" + img;
            }

            // Registration

            string regFacility = dt.Rows[0]["registration_facility"].ToString();

            if (regFacility == "Yes")
            {
                trRegister.Visible = true;
                rbtnRegister.SelectedIndex = 1;
            }
            else
            {
                trRegister.Visible = false;
                rbtnRegister.SelectedIndex = 0;
            }

            string regCharges = dt.Rows[0]["registration_charges"].ToString();

            if (regCharges == "Yes")
            {
                RegistrationPanel.Visible = true;
                rbtnRegCharge.SelectedIndex = 1;
            }
            else
            {
                RegistrationPanel.Visible = false;
                rbtnRegCharge.SelectedIndex = 0;
            }


            // Lead Host Details

           
            txtLeadHostAmt.Text = dt.Rows[0]["lead_host_amt"].ToString();

            string[] leadHostClubs  = dt.Rows[0]["lead_host_club"].ToString().Split(',');
            if (dt.Rows[0]["lead_host_club"].ToString() != null)
            {
                trLeadHost.Visible = true;
                for (int i = 0; i <= leadHostClubs.Length - 1; i++)
                {
                    listHostLubs.Items.Add(leadHostClubs[i]);
                }
            }
            else
            {
                trLeadHost.Visible = false;
            }


            // Co-host-I
            txtCoHost1Amt.Text = dt.Rows[0]["co_host1_amt"].ToString();
            txtCoHost1Title.Text = dt.Rows[0]["co_host1_title"].ToString();

            string[] coHost1Clubs = dt.Rows[0]["co_host1_clubs"].ToString().Split(',');
            if (dt.Rows[0]["co_host1_clubs"].ToString() != null)
            {
                trCoHost1.Visible = true;
                for (int i = 0; i <= coHost1Clubs.Length - 1; i++)
                {
                    listCoHost1.Items.Add(coHost1Clubs[i]);
                }
            }
            else
            {
                trCoHost1.Visible = false;
            }


            // Co-Host-II
            txtCoHost2Amt.Text = dt.Rows[0]["co_host2_amt"].ToString();
            txtCoHost2Title.Text = dt.Rows[0]["co_host2_title"].ToString();

            string[] coHost2Clubs = dt.Rows[0]["co_host2_clubs"].ToString().Split(',');
            if (dt.Rows[0]["co_host2_clubs"].ToString() != null)
            {
                trCoHost2.Visible = true;
                for (int i = 0; i <= coHost2Clubs.Length - 1; i++)
                {
                    listCoHost2.Items.Add(coHost2Clubs[i]);
                }
            }
            else
            {
                trCoHost2.Visible = false;
            }


            // Co-Host-III

            txtCoHost3Amt.Text = dt.Rows[0]["co_host3_amt"].ToString();
            txtCoHost3Title.Text = dt.Rows[0]["co_host3_title"].ToString();

            string[] coHost3Clubs = dt.Rows[0]["co_host3_clubs"].ToString().Split(',');
            if (dt.Rows[0]["co_host3_clubs"].ToString() != null)
            {
                trCoHost3.Visible = true;
                for (int i = 0; i <= coHost3Clubs.Length - 1; i++)
                {
                    listCoHost3.Items.Add(coHost3Clubs[i]);
                }
            }
            else
            {
                trCoHost3.Visible = false;
            }


            // Committee-Host Members           

            txtCommitteeHostAmt.Text = dt.Rows[0]["committee_host_amt"].ToString(); 
            string[] committeeHostMembers = dt.Rows[0]["committee_host_members"].ToString().Split(',');
            if (dt.Rows[0]["committee_host_members"].ToString() != null)
            {
                trCommitteeHost.Visible = true;
                for (int i = 0; i <= committeeHostMembers.Length - 1; i++)
                {
                    listCommitteeOfHosts.Items.Add(committeeHostMembers[i]);
                }
            }
            else
            {
                trCommitteeHost.Visible = false;
            }

          

            // Registration Charges

            txtCost1.Text = dt.Rows[0]["cost1"].ToString();
            txtCost2.Text = dt.Rows[0]["cost2"].ToString();
            txtCost3.Text = dt.Rows[0]["cost3"].ToString();
            try
            {
                dateFC1.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFC1"].ToString());
            }
            catch { }
            try
            {
                dateFC2.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFC2"].ToString());
            }
            catch { }
            try
            {
                dateFC3.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFC3"].ToString());
            }
            catch { }

            try
            {
                dateTC1.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFT1"].ToString());
            }
            catch { }
            try
            {
                dateTC2.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFT2"].ToString());
            }
            catch { }
            try
            {
                dateTC3.DbSelectedDate = DateTime.Parse(dt.Rows[0]["dateFT3"].ToString());
            }
            catch { }

            txtAccountName.Text = dt.Rows[0]["account_details"].ToString();
            txtPayAddress.Content = dt.Rows[0]["send_payment_address"].ToString();

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateEvents(id);
            }
            else
            {
                AddEvents();
            }
        }
    }
    private void AddEvents()
    {
        string leadHostClubs= "";
        string coHost1Clubs = "";
        string coHost2Clubs = "";
        string coHost3Clubs= "";
        string committeeHostMembers = "";

        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_add_upcoming_events";
        obj.AddParam("@year", rbtnYear.SelectedItem.Text.Trim().ToString());
        obj.AddParam("@event_name", txtEventName.Text.Trim().ToString());

        try
        {
            obj.AddParam("@event_date", DateTime.Parse(eventDate.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@event_date", nullDate); }

        try
        {
             obj.AddParam("@event_time", DateTime.Parse(eventTime.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@event_time", nullDate); }
        
        obj.AddParam("@venue1", txtVenue1.Text.Trim().ToString());
        obj.AddParam("@venue2", txtVenue2.Text.Trim().ToString());
        obj.AddParam("@venue3", txtVenue3.Text.Trim().ToString());

        obj.AddParam("@event_description", txtEventDesc.Content);
        obj.AddParam("@dress_code", rbtnDressCode.SelectedItem.Text.Trim().ToString());

        obj.AddParam("@gps_latitude", txtGPSLati.Text.Trim().ToString());
        obj.AddParam("@gps_longitude", txtGPSLongi.Text.Trim().ToString());

        if (Session["DirectionMap"] != null)
            obj.AddParam("@direction_map", Session["DirectionMap"].ToString());
        else
            obj.AddParam("@direction_map", "");

        if (Session["EventImage"] != null)
            obj.AddParam("@image", Session["EventImage"].ToString());
        else
            obj.AddParam("@image", "");

        obj.AddParam("@registration_facility", rbtnRegister.SelectedItem.Text.Trim().ToString());
        obj.AddParam("@registration_charges", rbtnRegCharge.SelectedItem.Text.Trim().ToString());

        // Event Registration  ---   Lead Host Club Details


        try
        {
            obj.AddParam("@lead_host_amt", Decimal.Parse(txtLeadHostAmt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@lead_host_amt", 0); }

        if (listHostLubs.Items.Count>0)
        {

            foreach (ListItem li in listHostLubs.Items)
            {
                leadHostClubs = leadHostClubs + li.Text + ", ";
            }
            obj.AddParam("@lead_host_club", leadHostClubs.Remove(leadHostClubs.Length - 2));
        }
        else
        {
            obj.AddParam("@lead_host_club", "");
        }

        // Co Host Club Details 

        
        try
        {
            obj.AddParam("@co_host1_amt", Decimal.Parse(txtCoHost1Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host1_amt", 0); }
        obj.AddParam("@co_host1_title", txtCoHost1Title.Text.Trim());
        if (listCoHost1.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost1.Items)
            {
                coHost1Clubs = coHost1Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host1_clubs", coHost1Clubs.Remove(coHost1Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host1_clubs", "");
        }

              
        try
        {
            obj.AddParam("@co_host2_amt", Decimal.Parse(txtCoHost2Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host2_amt", 0); }
        obj.AddParam("@co_host2_title", txtCoHost2Title.Text.Trim());
        if (listCoHost2.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost2.Items)
            {
                coHost2Clubs = coHost2Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host2_clubs", coHost2Clubs.Remove(coHost2Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host2_clubs", "");
        }


        if (listCoHost3.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost3.Items)
            {
                coHost3Clubs = coHost3Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host3_clubs", coHost3Clubs.Remove(coHost3Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host3_clubs", "");
        }


        try
        {
            obj.AddParam("@co_host3_amt", Decimal.Parse(txtCoHost3Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host3_amt", 0); }
        obj.AddParam("@co_host3_title", txtCoHost3Title.Text.Trim());

          
        try
        {
            obj.AddParam("@committee_host_amt", Decimal.Parse(txtCommitteeHostAmt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@committee_host_amt", 0); }
        if (listCommitteeOfHosts.Items.Count > 0)
        {
            foreach (ListItem li in listCommitteeOfHosts.Items)
            {
                committeeHostMembers = committeeHostMembers + li.Text + ", ";
            }
            obj.AddParam("@committee_host_members", committeeHostMembers.Remove(committeeHostMembers.Length - 2));
        }
        else
        {
            obj.AddParam("@committee_host_members", "");
        }


        // Registration Charges
               

        try
        {
            obj.AddParam("@cost1", Decimal.Parse(txtCost1.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost1", 0); }
        try
        {
            obj.AddParam("@dateFC1", DateTime.Parse(dateFC1.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC1", nullDate); }

        try
        {
            obj.AddParam("@dateFT1", DateTime.Parse(dateTC1.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT1", nullDate); }

        try
        {
            obj.AddParam("@cost2", Decimal.Parse(txtCost2.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost2", 0); }
        try
        {
            obj.AddParam("@dateFC2", DateTime.Parse(dateFC2.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC2", nullDate); }

        try
        {
            obj.AddParam("@dateFT2", DateTime.Parse(dateTC2.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT2", nullDate); }

        try
        {
            obj.AddParam("@cost3", Decimal.Parse(txtCost3.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost3", 0); }
        try
        {
            obj.AddParam("@dateFC3", DateTime.Parse(dateFC3.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC3", nullDate); }

        try
        {
            obj.AddParam("@dateFT3", DateTime.Parse(dateTC3.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT3", nullDate); }
        
        obj.AddParam("@account_details", txtAccountName.Text.Trim().ToString());

        obj.AddParam("@send_payment_address", txtPayAddress.Content);

        int exe = obj.ExecuteNonQuery();
        if (exe != 0)
        {
            Clear();
            string jv = "<script>alert('Record has been added successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

    private void UpdateEvents(int id)
    {
        string leadHostClubs = "";
        string coHost1Clubs = "";
        string coHost2Clubs = "";
        string coHost3Clubs = "";
        string committeeHostMembers = "";

        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_update_upcoming_events";
        obj.AddParam("@id", id);
        obj.AddParam("@year", rbtnYear.SelectedItem.Text.Trim().ToString());
        obj.AddParam("@event_name", txtEventName.Text.Trim().ToString());

        try
        {
            obj.AddParam("@event_date", DateTime.Parse(eventDate.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@event_date", nullDate); }

        try
        {
            obj.AddParam("@event_time", DateTime.Parse(eventTime.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@event_time", nullDate); }

        obj.AddParam("@venue1", txtVenue1.Text.Trim().ToString());
        obj.AddParam("@venue2", txtVenue2.Text.Trim().ToString());
        obj.AddParam("@venue3", txtVenue3.Text.Trim().ToString());

        obj.AddParam("@event_description", txtEventDesc.Content);
        obj.AddParam("@dress_code", rbtnDressCode.SelectedItem.Text.Trim().ToString());

        obj.AddParam("@gps_latitude", txtGPSLati.Text.Trim().ToString());
        obj.AddParam("@gps_longitude", txtGPSLongi.Text.Trim().ToString());

        if (Session["DirectionMap"] != null)
            obj.AddParam("@direction_map", Session["DirectionMap"].ToString());
        else
            obj.AddParam("@direction_map", "");

        if (Session["EventImage"] != null)
            obj.AddParam("@image", Session["EventImage"].ToString());
        else
            obj.AddParam("@image", "");

        obj.AddParam("@registration_facility", rbtnRegister.SelectedItem.Text.Trim().ToString());
        obj.AddParam("@registration_charges", rbtnRegCharge.SelectedItem.Text.Trim().ToString());

        // Event Registration  ---   Lead Host Club Details


        try
        {
            obj.AddParam("@lead_host_amt", Decimal.Parse(txtLeadHostAmt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@lead_host_amt", 0); }

        if (listHostLubs.Items.Count > 0)
        {

            foreach (ListItem li in listHostLubs.Items)
            {
                leadHostClubs = leadHostClubs + li.Text + ", ";
            }
            obj.AddParam("@lead_host_club", leadHostClubs.Remove(leadHostClubs.Length - 2));
        }
        else
        {
            obj.AddParam("@lead_host_club", "");
        }

        // Co Host Club Details 


        try
        {
            obj.AddParam("@co_host1_amt", Decimal.Parse(txtCoHost1Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host1_amt", 0); }
        obj.AddParam("@co_host1_title", txtCoHost1Title.Text.Trim());
        if (listCoHost1.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost1.Items)
            {
                coHost1Clubs = coHost1Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host1_clubs", coHost1Clubs.Remove(coHost1Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host1_clubs", "");
        }


        try
        {
            obj.AddParam("@co_host2_amt", Decimal.Parse(txtCoHost2Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host2_amt", 0); }
        obj.AddParam("@co_host2_title", txtCoHost2Title.Text.Trim());
        if (listCoHost2.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost2.Items)
            {
                coHost2Clubs = coHost2Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host2_clubs", coHost2Clubs.Remove(coHost2Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host2_clubs", "");
        }


        if (listCoHost3.Items.Count > 0)
        {
            foreach (ListItem li in listCoHost3.Items)
            {
                coHost3Clubs = coHost3Clubs + li.Text + ", ";
            }
            obj.AddParam("@co_host3_clubs", coHost3Clubs.Remove(coHost3Clubs.Length - 2));
        }
        else
        {
            obj.AddParam("@co_host3_clubs", "");
        }


        try
        {
            obj.AddParam("@co_host3_amt", Decimal.Parse(txtCoHost3Amt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@co_host3_amt", 0); }
        obj.AddParam("@co_host3_title", txtCoHost3Title.Text.Trim());


        try
        {
            obj.AddParam("@committee_host_amt", Decimal.Parse(txtCommitteeHostAmt.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@committee_host_amt", 0); }
        if (listCommitteeOfHosts.Items.Count > 0)
        {
            foreach (ListItem li in listCommitteeOfHosts.Items)
            {
                committeeHostMembers = committeeHostMembers + li.Text + ", ";
            }
            obj.AddParam("@committee_host_members", committeeHostMembers.Remove(committeeHostMembers.Length - 2));
        }
        else
        {
            obj.AddParam("@committee_host_members", "");
        }


        // Registration Charges


        try
        {
            obj.AddParam("@cost1", Decimal.Parse(txtCost1.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost1", 0); }
        try
        {
            obj.AddParam("@dateFC1", DateTime.Parse(dateFC1.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC1", nullDate); }

        try
        {
            obj.AddParam("@dateFT1", DateTime.Parse(dateTC1.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT1", nullDate); }

        try
        {
            obj.AddParam("@cost2", Decimal.Parse(txtCost2.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost2", 0); }
        try
        {
            obj.AddParam("@dateFC2", DateTime.Parse(dateFC2.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC2", nullDate); }

        try
        {
            obj.AddParam("@dateFT2", DateTime.Parse(dateTC2.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT2", nullDate); }

        try
        {
            obj.AddParam("@cost3", Decimal.Parse(txtCost3.Text.Trim().ToString()));
        }
        catch { obj.AddParam("@cost3", 0); }
        try
        {
            obj.AddParam("@dateFC3", DateTime.Parse(dateFC3.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFC3", nullDate); }

        try
        {
            obj.AddParam("@dateFT3", DateTime.Parse(dateTC3.SelectedDate.ToString()));
        }
        catch { obj.AddParam("@dateFT3", nullDate); }

        obj.AddParam("@account_details", txtAccountName.Text.Trim().ToString());

        obj.AddParam("@send_payment_address", txtPayAddress.Content);

        int exe = obj.ExecuteNonQuery();
        if (exe != 0)
        {
            showmsg("Record has been updated successfully", "view_upcoming_events.aspx");
            //string jv = "<script>alert('Record has been updated successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "EventImages";
            string fileName = "";
            string ext = "";
            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = fileName.Substring(0, fileName.LastIndexOf("."));
            fileName = fileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["DirectionMap"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void RadAsyncUpload2_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "EventImages";
            string fileName = "";
            string ext = "";
            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = fileName.Substring(0, fileName.LastIndexOf("."));
            fileName = fileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["EventImage"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    private void Clear()
    {
        txtCoHost1Amt.Text = "";
        txtCoHost1Title.Text = "";
        txtCoHost2Amt.Text = "";
        txtCoHost2Title.Text = "";
        txtCoHost3Amt.Text = "";
        txtCoHost3Title.Text = "";
        txtCommitteeHostAmt.Text = "";
        txtCost1.Text = "";
        txtCost2.Text = "";
        txtCost3.Text = "";
        txtEventDesc.Content = "";
        txtEventName.Text = "";
        txtGPSLati.Text = "";
        txtGPSLongi.Text = "";
        txtLeadHostAmt.Text = "";
        txtVenue1.Text = "";
        txtVenue2.Text = "";
        txtVenue3.Text = "";
               
        ddlLeadHostClub.SelectedIndex = 0;
        ddlCohost1Clubs.SelectedIndex = 0;
        ddlCohost2Clubs.SelectedIndex = 0;
        ddlCohost3Clubs.SelectedIndex = 0;
        ddlCommitteeHOfHost.SelectedIndex = 0;

        eventDate.Clear();
        eventTime.Clear();

        trCoHost1.Visible = false;
        trCoHost2.Visible = false;
        trCoHost3.Visible = false;
        trCommitteeHost.Visible = false;
        txtPayAddress.Content = "";
        txtAccountName.Text = "";
    }
    protected void btnPartnerClub_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string strClub = ddlLeadHostClub.SelectedItem.Text.ToString();
            if (strClub == "Select Club Name")
            {
                trLeadHost.Visible = false;
            }
            else
            {
                trLeadHost.Visible = true;
                ListItem li = new ListItem();
                li.Text = strClub;
                listHostLubs.Items.Add(li);
            }
        }
    }
    protected void btnPartnerClubRemove_Click(object sender, EventArgs e)
    {
        try
        {
            if (listHostLubs.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listHostLubs.SelectedItem.Text.ToString();

                listHostLubs.Items.Remove(li);
            }
            else
            {
                trLeadHost.Visible = false;
                listHostLubs.Visible = false;
            }
        }
        catch
        {
        }
    }
    protected void btnAddCohost_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            trCoHost1.Visible = true;
            ListItem li = new ListItem();
            li.Text = ddlCohost1Clubs.SelectedItem.Text.ToString();
            listCoHost1.Items.Add(li);
        }
    }
    protected void btnRemoveCohost_Click(object sender, EventArgs e)
    {
        try
        {
            if (listCoHost1.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listCoHost1.SelectedItem.Text.ToString();

                listCoHost1.Items.Remove(li);
            }
            else
            {
                listCoHost1.Visible = false;
            }
        }
        catch
        {
        }

    }
    protected void btnAddCommitteeOfHosts_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            trCommitteeHost.Visible = true;
            ListItem li = new ListItem();
            li.Text = ddlCommitteeHOfHost.SelectedItem.Text.ToString();
            listCommitteeOfHosts.Items.Add(li);
        }
    }
    protected void btnRemoveCommitteeOfHosts_Click(object sender, EventArgs e)
    {
        try
        {
            if (listCommitteeOfHosts.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listCommitteeOfHosts.SelectedItem.Text.ToString();

                listCommitteeOfHosts.Items.Remove(li);
            }
            else
            {
                listCommitteeOfHosts.Visible = false;
            }
        }
        catch
        {
        }
    }
    protected void rbtnRegister_SelectedIndexChanged(object sender, EventArgs e)
    {
        RegistrationPanel.Visible = false;

        if(rbtnRegister.SelectedIndex==0)
            trRegister.Visible = false;
        else
            trRegister.Visible = true;
    }
    protected void btnAddCohost2_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            trCoHost2.Visible = true;
            ListItem li = new ListItem();
            li.Text = ddlCohost2Clubs.SelectedItem.Text.ToString();
            listCoHost2.Items.Add(li);
        }
    }
    protected void btnRemoveCohost2_Click(object sender, EventArgs e)
    {
        try
        {
            if (listCoHost2.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listCoHost2.SelectedItem.Text.ToString();
                listCoHost2.Items.Remove(li);
            }
            else
            {
                listCoHost2.Visible = false;
            }
        }
        catch
        {
        }
    }
    protected void btnAddCohost3_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            trCoHost3.Visible = true;
            ListItem li = new ListItem();
            li.Text = ddlCohost3Clubs.SelectedItem.Text.ToString();
            listCoHost3.Items.Add(li);
        }
    }
    protected void btnRemoveCohost3_Click(object sender, EventArgs e)
    {
        try
        {
            if (listCoHost3.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listCoHost3.SelectedItem.Text.ToString();
                listCoHost3.Items.Remove(li);
            }
            else
            {
                listCoHost3.Visible = false;
            }
        }
        catch
        {
        }
    }

    protected void rbtnRegCharge_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnRegCharge.SelectedIndex == 0)
            RegistrationPanel.Visible = false;
        else
            RegistrationPanel.Visible = true;


    }
}


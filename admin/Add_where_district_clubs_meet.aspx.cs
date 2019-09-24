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

public partial class Admin_Add_where_district_clubs_meet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["user"] != null)
        //{
        //    if (!IsPostBack)
        //    {
        //        BindDays();
        //        BindMonth();
        //        BindYear();
        //        BindTime();

        //        if (Request.QueryString["id"] != null)
        //        {
        //            int id = int.Parse(Request.QueryString["id"].ToString());
        //            Getdistrict_club(id);
        //        }
        //    }
        //}
        //else
        //{
        //    Session.Abandon();
        //    Response.Redirect("Default.aspx");
        //}
    }

    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    if (Page.IsValid)
    //    {
    //        try
    //        {
    //            if (Request.QueryString["id"] != null)
    //            {
    //                int id = int.Parse(Request.QueryString["id"].ToString());
    //                UpdateDistClub(id);
    //            }
    //            else
    //            {
    //                AddDistClub();
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //        }
    //    }
    //}

    //private void Getdistrict_club(int id)
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "m_get_district_club";
    //    obj.AddParam("@id", id);
    //    DataTable dt = new DataTable();
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        txtTitle.Text = dt.Rows[0]["club_name"].ToString();
    //        txtClubNo.Text = dt.Rows[0]["club_no"].ToString();

    //        string[] charterDate = dt.Rows[0]["charter_date"].ToString().Split('/');
    //        if (charterDate.Length > 1)
    //        {
    //            DDLDays.SelectedValue = charterDate[0].ToString();
    //            DDLMonth.SelectedItem.Text = charterDate[1].ToString();
    //            DDLYear.SelectedValue = charterDate[2].ToString();
    //        }

    //        //txtNoOfMembers.Text = dt.Rows[0]["no_of_members"].ToString();

    //        DDLDay.SelectedItem.Text = dt.Rows[0]["meet_days"].ToString();
    //        string[] time = dt.Rows[0]["time"].ToString().Split(':');
    //        DDLTimeH.SelectedValue = time[0].ToString();
    //        DDLTimeM.SelectedValue = time[1].ToString();
    //        DDLTime2.SelectedValue = time[2].ToString();
    //        txtVenue1.Text = dt.Rows[0]["venue1"].ToString();
    //        txtVenue2.Text = dt.Rows[0]["venue2"].ToString();
    //        txtLandmark.Text = dt.Rows[0]["landmark"].ToString();
    //        txtCity.Text = dt.Rows[0]["city"].ToString();
    //        txtPin.Text = dt.Rows[0]["pin"].ToString();
    //        txtState.Text = dt.Rows[0]["state"].ToString();
    //        txtCountry.Text = dt.Rows[0]["country"].ToString();
    //        txtLatitude.Text = dt.Rows[0]["gps_latitude"].ToString();
    //        txtLongitude.Text = dt.Rows[0]["gps_longitude"].ToString();

    //        txtWebsite.Text = dt.Rows[0]["website"].ToString();
    //        txtAltWebsite.Text = dt.Rows[0]["alternate_website"].ToString();

    //        string location_map = dt.Rows[0]["location_map"].ToString();
    //        Session["locationmap"] = location_map;

    //        string club_logo = dt.Rows[0]["club_logo"].ToString();
    //        Session["ClubLogo"] = club_logo;
    //    }
    //}

    //private void AddDistClub()
    //{
    //    if (Page.IsValid)
    //    {
    //        string h, m, am, time = "";
    //        h = DDLTimeH.SelectedItem.Text;
    //        m = DDLTimeM.SelectedItem.Text;
    //        am = DDLTime2.SelectedItem.Text;

    //        time = h + ":" + m + ":" + am;

    //        DistrictClub dc = new DistrictClub();

    //        dc.ClubName = txtTitle.Text.ToString();
    //        try
    //        {
    //            dc.ClubNo = int.Parse(txtClubNo.Text.ToString());
    //        }
    //        catch
    //        {
    //            dc.ClubNo = 0;
    //        }
    //        dc.CharterDate = DDLDays.SelectedItem.Text + "/" + DDLMonth.SelectedItem.Text + "/" + DDLYear.SelectedItem.Text;
    //        dc.Days = DDLDay.SelectedItem.Text;
    //        dc.Time = time;

    //        //try { dc.No_of_members = int.Parse(txtNoOfMembers.Text.ToString()); }
    //        //catch { dc.No_of_members = 0; }

    //        dc.Venu1 = txtVenue1.Text.Trim();
    //        dc.Venu2 = txtVenue2.Text.Trim();
    //        dc.Landmark = txtLandmark.Text.Trim();
    //        dc.City = txtCity.Text.Trim();
    //        dc.Pin = txtPin.Text.Trim();
    //        dc.State = txtState.Text.Trim();
    //        dc.Country = txtCountry.Text.Trim();
    //        dc.GpsLatitude = txtLatitude.Text.Trim();
    //        dc.GpsLongitude = txtLongitude.Text.Trim();

    //        dc.Website = txtWebsite.Text.Trim();           

    //        SaveImages upImg = new SaveImages();
    //        string mapPath = upImg.AddImages(FileUpload1.PostedFile, "DistrictLocationMaps");
    //        dc.LocationMap = mapPath;

    //        SaveImages upLogo = new SaveImages();
    //        string club_Logo = upLogo.AddImages(FileUpload2.PostedFile, "DistrictLocationMaps");
    //        dc.Logo = club_Logo;

    //        int exe = dc.AddClub();
    //        if (exe > 0)
    //        {
    //            clear();
    //            string jv = "<script>alert('Record Added Successfully');</script>";
    //            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
    //        }
    //    }
    //}

    //private void UpdateDistClub(int id)
    //{
    //    try
    //    {
    //        string h, m, am, time = "";
    //        h = DDLTimeH.SelectedItem.Text;
    //        m = DDLTimeM.SelectedItem.Text;
    //        am = DDLTime2.SelectedItem.Text;

    //        time = h + ":" + m + ":" + am;

    //        DistrictClub dc = new DistrictClub();
    //        dc.Id = id;
    //        dc.ClubName = txtTitle.Text.ToString();
    //        dc.ClubNo = int.Parse(txtClubNo.Text.ToString());
    //        dc.CharterDate = DDLDays.SelectedItem.Text + "/" + DDLMonth.SelectedItem.Text + "/" + DDLYear.SelectedItem.Text;
    //        dc.Days = DDLDay.SelectedItem.Text;
    //        dc.Time = time;

    //        // dc.No_of_members = int.Parse(txtNoOfMembers.Text.ToString());

    //        dc.Venu1 = txtVenue1.Text.Trim();
    //        dc.Venu2 = txtVenue2.Text.Trim();
    //        dc.Landmark = txtLandmark.Text.Trim();
    //        dc.City = txtCity.Text.Trim();
    //        dc.Pin = txtPin.Text.Trim();
    //        dc.State = txtState.Text.Trim();
    //        dc.Country = txtCountry.Text.Trim();
    //        dc.GpsLatitude = txtLatitude.Text.Trim();
    //        dc.Website = txtWebsite.Text.Trim();
           
    //        if (FileUpload1.FileName != "")
    //        {
    //            SaveImages upImg = new SaveImages();
    //            string mapPath = upImg.AddImages(FileUpload1.PostedFile, "DistrictLocationMaps");
    //            dc.LocationMap = mapPath;
    //        }
    //        else 
    //        {
    //            dc.LocationMap = Session["locationmap"].ToString();
    //        }

    //        if (FileUpload2.FileName != "")
    //        {
    //            SaveImages upLogo = new SaveImages();
    //            string club_Logo = upLogo.AddImages(FileUpload2.PostedFile, "DistrictLocationMaps");
    //            dc.Logo = club_Logo;
    //        }
    //        else
    //        {
    //            dc.Logo = Session["ClubLogo"].ToString();
    //        }

    //        int exe = dc.UpdateDistrictClub();
    //        if (exe > 0)
    //        {
    //            showmsg("Record updated successfully !", "View_where_district_clubs_meet.aspx");
    //        }
    //    }
    //    catch
    //    {
    //    }
    //}

    //private void clear()
    //{
    //    txtTitle.Text = "Rotary Club of ";
    //    txtCity.Text = "";
    //    txtClubNo.Text = "";
    //    txtCountry.Text = "India";
    //    txtLandmark.Text = "";
    //    txtLatitude.Text = "";
    //    txtLongitude.Text = "";
    //    txtPin.Text = "";
    //    txtState.Text = "Maharashtra";        
    //    txtVenue1.Text = "";
    //    txtVenue2.Text = "";
    //    DDLDays.ClearSelection();
    //    DDLMonth.ClearSelection();
    //    DDLYear.ClearSelection();
    //    DDLDays.ClearSelection();
    //    DDLTimeH.ClearSelection();
    //    DDLTimeM.ClearSelection();
    //    DDLDay.ClearSelection();
    //    txtWebsite.Text = "http://www.";        
    //}

    //protected void btncancel_Click(object sender, EventArgs e)
    //{
    //    clear();
    //}

    //#region Bind Time Day Month Year & Show Message
    //private void BindDays()
    //{
    //    string s = "";
    //    try
    //    {
    //        for (int i = 1; i <= 31; i++)
    //        {
    //            if (i <= 9)
    //            {
    //                s = "0" + i;
    //                //i = int.Parse(s.ToString());
    //            }
    //            else
    //            {
    //                s = i.ToString();
    //            }
    //            DDLDays.Items.Add(s.ToString());
    //        }
    //        DDLDays.Items.Insert(0, "Day");
    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}

    //private void BindMonth()
    //{
    //    try
    //    {
    //        for (int i = 1; i <= 12; i++)
    //        {
    //            ListItem item = new ListItem();
    //            item.Text = new DateTime(1900, i, 1).ToString("MMMM");
    //            item.Value = i.ToString();
    //            DDLMonth.Items.Add(item);
    //        }

    //        DDLMonth.Items.Insert(0, "Month");
    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}

    //private void BindYear()
    //{
    //    try
    //    {
    //        for (Int32 i = 1920; i <= Convert.ToInt32(DateTime.Now.Year); i++)
    //        {
    //            DDLYear.Items.Add(i.ToString());
    //        }
    //        DDLYear.Items.Insert(0, "Year");
    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}

    //private void BindTime()
    //{
    //    string s = "";
    //    for (int i = 1; i <= 12; i++)
    //    {
    //        if (i <= 9)
    //        {
    //            s = "0" + i;
    //        }
    //        else
    //        {
    //            s = i.ToString();
    //        }
    //        DDLTimeH.Items.Add(s.ToString());
    //    }
    //    DDLTimeH.Items.Insert(0, "HH");
    //    DDLTimeH.Items.Insert(1, "00");
    //    for (int i = 5; i <= 55; i = i + 5)
    //    {
    //        if (i <= 9)
    //        {
    //            s = "0" + i;
    //        }
    //        else
    //        {
    //            s = i.ToString();
    //        }
    //        DDLTimeM.Items.Add(s.ToString());
    //    }
    //    DDLTimeM.Items.Insert(0, "MM");
    //    DDLTimeM.Items.Insert(1, "00");
    //}

    //public void showmsg(string msg, string RedirectUrl)
    //{
    //    try
    //    {
    //        string strScript = "<script>";
    //        strScript += "alert('" + msg + "');";
    //        strScript += "window.location='" + RedirectUrl + "';";
    //        strScript += "</script>";
    //        Label lbl = new Label();
    //        lbl.Text = strScript;
    //        Page.Controls.Add(lbl);
    //    }
    //    catch
    //    {
    //    }
    //}

    //#endregion

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
    //            obj.SetCommandQry = "select club_name from DistrictClubsMeets_tbl where club_name='" + txtTitle.Text.Trim().ToString() + "'";
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_add_clubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DeleteAllTempData();
                imgLogo.Visible = false;
                imgMap.Visible = false;
                imgFlagship.Visible = false;

                trIW.Visible = false;
                trRCC.Visible = false;
                trSrCi.Visible = false;
                trIntr.Visible = false;
                trRtr.Visible = false;
                trBEN.Visible = false;

                GetAllDist3141Members();

                //BindDays();
                // BindMonth();
                // BindYear();
                //BindTime();

                if (Request.QueryString["id"] != null)
                {
                    trIW.Visible = true;
                    trRCC.Visible = true;
                    trSrCi.Visible = true;
                    trIntr.Visible = true;
                    trRtr.Visible = true;
                    trBEN.Visible = true;
                    rbtnIW.SelectedIndex = 0;
                    rbtnRCC.SelectedIndex = 0;
                    rbtnSrCi.SelectedIndex = 0;
                    rbtnRotaract.SelectedIndex = 0;
                    rbtnInteract.SelectedIndex = 0;

                    int id = int.Parse(Request.QueryString["id"].ToString());
                   // BindIW(id);
                    GetClub(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdateDistClub(id);
                    UpdateIWClubId(id);
                }
                else
                {
                    AddDistClub();
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    private void GetClub(int id)
    {

        DistrictClub dc = new DistrictClub();
        DataTable dt = new DataTable();


        dc.Id = id;
        dt = dc.GetClubById();

        //dc.RiClubNo = id;
        //dt = dc.GetClubByClubId();

        if (dt.Rows.Count > 0)
        {
            ddlDistNo.SelectedItem.Text = dt.Rows[0]["district_no"].ToString();
            txtTitle.Text = dt.Rows[0]["club_name"].ToString();
            txtClubNo.Text = dt.Rows[0]["ri_club_no"].ToString();
            DDLClubName.SelectedItem.Text = dt.Rows[0]["sponsored_club"].ToString();

            charterDate.SelectedDate = DateTime.Parse(dt.Rows[0]["charter_date"].ToString());
            DDLDay.SelectedItem.Text = dt.Rows[0]["meeting_day"].ToString();
            meetingTime.SelectedDate = DateTime.Parse(dt.Rows[0]["meeting_time"].ToString());

            txtVenue1.Text = dt.Rows[0]["venue1"].ToString();
            txtVenue2.Text = dt.Rows[0]["venue2"].ToString();
            txtLandmark.Text = dt.Rows[0]["landmark"].ToString();
            txtCity.Text = dt.Rows[0]["city"].ToString();
            txtPin.Text = dt.Rows[0]["pin"].ToString();
            txtState.Text = dt.Rows[0]["state"].ToString();
            txtCountry.Text = dt.Rows[0]["country"].ToString();
            txtLatitude.Text = dt.Rows[0]["gps_latitude"].ToString();
            txtLongitude.Text = dt.Rows[0]["gps_longitude"].ToString();
            txtWebsite.Text = dt.Rows[0]["website"].ToString();


            string strImgLogo = dt.Rows[0]["club_logo"].ToString();
            if (strImgLogo != "")
            {
                Session["ImageLogo"] = strImgLogo;
                imgLogo.Visible = true;
                imgLogo.ImageUrl = "../ClubsLogo/" + strImgLogo;
            }

            string strImgMap = dt.Rows[0]["location_map"].ToString();
            if (strImgMap != "")
            {
                Session["ImageMap"] = strImgMap;
                imgMap.Visible = true;
                imgMap.ImageUrl = "../ClubsLogo/" + strImgMap;
            }


            DDLMem1.SelectedItem.Text = dt.Rows[0]["ds"].ToString();
            DDLMem2.SelectedItem.Text = dt.Rows[0]["ag"].ToString();
            DDLMem3.SelectedItem.Text = dt.Rows[0]["at"].ToString();
            DDLMem4.SelectedItem.Text = dt.Rows[0]["gc"].ToString();

            txtPHF.Text = dt.Rows[0]["phf"].ToString();
            txtTRFSM.Text = dt.Rows[0]["trfsm"].ToString();
            txtMD.Text = dt.Rows[0]["md"].ToString();
            txtPHSM.Text = dt.Rows[0]["phsm"].ToString();
            txtArchKlump.Text = dt.Rows[0]["arch_klump"].ToString();

            try
            {
                installationDate.SelectedDate = DateTime.Parse(dt.Rows[0]["installation_date"].ToString());
            }
            catch { }
            //try
            //{
            //    installationTime.SelectedDate = DateTime.Parse(dt.Rows[0]["installation_time"].ToString());
            //}
            //catch { }

            string strTime = dt.Rows[0]["installation_time"].ToString();
            if (strTime == "Morning")
                rbtnTime.SelectedIndex = 0;
            if (strTime == "Afternoon")
                rbtnTime.SelectedIndex = 1;
            if (strTime == "Evening")
                rbtnTime.SelectedIndex = 2;



            txtChiefGuest.Text = dt.Rows[0]["installation_chief_guest"].ToString();
            txtInstallationVenue.Text = dt.Rows[0]["installation_venue"].ToString();

            try
            {
                ocvDate.SelectedDate = DateTime.Parse(dt.Rows[0]["ocv_date"].ToString());
            }
            catch { }
            try
            {
                ocvTime.SelectedDate = DateTime.Parse(dt.Rows[0]["ocv_time"].ToString());
            }
            catch { }

            string strTrfStatus = dt.Rows[0]["club_trf_status"].ToString();
            if (strTrfStatus == "N/A")
                rbtnClubTrfStatus.SelectedIndex = 0;
            if (strTrfStatus == "100% PHFSM Club")
                rbtnClubTrfStatus.SelectedIndex = 1;
            if (strTrfStatus == "100% PHF Club")
                rbtnClubTrfStatus.SelectedIndex = 2;
            if (strTrfStatus == "100% EREY Club")
                rbtnClubTrfStatus.SelectedIndex = 3;
            if (strTrfStatus == "100% MD Club")
                rbtnClubTrfStatus.SelectedIndex = 4;

            txtFlagshipProject.Text = dt.Rows[0]["flagship_text"].ToString();
            string strFlagshipImg = dt.Rows[0]["flagship_image"].ToString();
            if (strFlagshipImg != "")
            {
                Session["FlagshipImg"] = strFlagshipImg;
                imgFlagship.Visible = true;
                imgFlagship.ImageUrl = "../ProjectFlagship/" + strFlagshipImg;
            }

        }
    }
    private int GetClubId()
    {
        int id = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetClubId";
        object o = obj.ExecuteScalar().ToString();
        id = int.Parse(o.ToString());
        return id;
    }
    private void AddDistClub()
    {
        if (Page.IsValid)
        {
            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            int? nullInt = null;
            
            //string h, m, am, time = "";
            //h = DDLTimeH.SelectedItem.Text;
            //m = DDLTimeM.SelectedItem.Text;
            //am = DDLTime2.SelectedItem.Text;

            //time = h + ":" + m + ":" + am;

            //string ih, im, iam, iTime = "";
            //ih = DDLInstallationTimeH.SelectedItem.Text;
            //im = DDLInstallationTimeM.SelectedItem.Text;
            //iam = DDLInstallationTimeM.SelectedItem.Text;

            //iTime = ih + ":" + im + ":" + iam;

            DistrictClub dc = new DistrictClub();

            dc.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            dc.ClubName = txtTitle.Text.ToString();
            try
            {
                dc.RiClubNo = int.Parse(txtClubNo.Text.ToString());
            }
            catch
            {
                dc.RiClubNo = 0;
            }

            string sponsorClub = DDLClubName.SelectedItem.Text.Trim();
            if (sponsorClub == "Select")
                dc.SponsoredClub = "";
            else
                dc.SponsoredClub = DDLClubName.SelectedItem.Text.Trim();

            try
            {
                dc.CharterDate = DateTime.Parse(charterDate.SelectedDate.ToString());// DDLDays.SelectedItem.Text + "/" + DDLMonth.SelectedItem.Text + "/" + DDLYear.SelectedItem.Text; 
            }
            catch { dc.CharterDate = nullDate; }
            dc.MeetingDay = DDLDay.SelectedItem.Text;
            try
            {
                dc.MeetingTime = DateTime.Parse(meetingTime.SelectedDate.ToString());
            }
            catch { dc.MeetingTime = nullDate; }

            dc.Venu1 = txtVenue1.Text.Trim();
            dc.Venu2 = txtVenue2.Text.Trim();
            dc.Landmark = txtLandmark.Text.Trim();
            dc.City = txtCity.Text.Trim();
            dc.Pin = txtPin.Text.Trim();
            dc.State = txtState.Text.Trim();
            dc.Country = txtCountry.Text.Trim();
            dc.GpsLatitude = txtLatitude.Text.Trim();
            dc.GpsLongitude = txtLongitude.Text.Trim();

            dc.Website = txtWebsite.Text.Trim();
            dc.FacebookLink = txtFacebookLink.Text.Trim();
            if (Session["ImageLogo"] != null)
                dc.Logo = Session["ImageLogo"].ToString();
            else
                dc.Logo = "";

            if (Session["ImageMap"] != null)
                dc.LocationMap = Session["ImageMap"].ToString();
            else
                dc.LocationMap = "";

            try
            {
                dc.InstallationDate = DateTime.Parse(installationDate.SelectedDate.ToString());
            }
            catch { dc.InstallationDate = nullDate; }
            //try
            //{
            //    dc.InstallationTime = DateTime.Parse(installationTime.SelectedDate.ToString());
            //}
            //catch { dc.InstallationTime = nullDate; }

            try
            {
                dc.InstallationTime = rbtnTime.SelectedItem.Text.ToString();
            }
            catch { dc.InstallationTime = ""; }


            dc.InstallationChiefGuest = txtChiefGuest.Text.Trim();
            dc.InstallationVenue = txtInstallationVenue.Text.Trim();

            try
            {
                dc.OcvDate = DateTime.Parse(ocvDate.SelectedDate.ToString());
            }
            catch { dc.OcvDate = nullDate; }
            try
            {
                dc.OcvTime = DateTime.Parse(ocvTime.SelectedDate.ToString());
            }
            catch { dc.OcvTime = nullDate; }

            try
            {
                dc.Phf = int.Parse(txtPHF.Text.Trim());
            }
            //catch { dc.Phf = nullInt.Value; }
            catch { dc.Phf = 0; }

            try
            {
                dc.Trfsm = int.Parse(txtTRFSM.Text.Trim());
            }
            catch { dc.Trfsm = 0; }
            try
            {
                dc.Md = int.Parse(txtMD.Text.Trim());
            }
            catch { dc.Md = 0; }
            try
            {
                dc.Phsm = int.Parse(txtPHSM.Text.Trim());
            }
            catch { dc.Phsm = 0; }
            try
            {
                dc.ArchKlump = int.Parse(txtArchKlump.Text.Trim());
            }
            catch { dc.ArchKlump = 0; }

            dc.DS = DDLMem1.SelectedItem.Text.Trim();
            dc.AG = DDLMem2.SelectedItem.Text.Trim();
            dc.AT = DDLMem3.SelectedItem.Text.Trim();
            dc.GC = DDLMem4.SelectedItem.Text.Trim();

            dc.ClubTrfStatus = rbtnClubTrfStatus.SelectedItem.Text.Trim();

            dc.FlagshipText = txtFlagshipProject.Text.Trim();

            if (Session["FlagshipImg"] != null)
                dc.FlagshipImage = Session["FlagshipImg"].ToString();
            else
                dc.FlagshipImage = "";


            int exe = dc.AddClub();
            if (exe > 0)
            {
                int pid = GetClubId();
                UpdateIWClubId(pid);

                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
    }
    private void UpdateDistClub(int id)
    {
        try
        {
            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            int? nullInt = null;

            DistrictClub dc = new DistrictClub();

            dc.Id = id;

            dc.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            dc.ClubName = txtTitle.Text.ToString();
            try
            {
                dc.RiClubNo = int.Parse(txtClubNo.Text.ToString());
            }
            catch
            {
                dc.RiClubNo = 0;
            }

            string sponsorClub = DDLClubName.SelectedItem.Text.Trim();
            if (sponsorClub == "Select")
                dc.SponsoredClub = "";
            else
                dc.SponsoredClub = DDLClubName.SelectedItem.Text.Trim();

            try
            {
                dc.CharterDate = DateTime.Parse(charterDate.SelectedDate.ToString());// DDLDays.SelectedItem.Text + "/" + DDLMonth.SelectedItem.Text + "/" + DDLYear.SelectedItem.Text; 
            }
            catch { dc.CharterDate = nullDate; }
            dc.MeetingDay = DDLDay.SelectedItem.Text;
            try
            {
                dc.MeetingTime = DateTime.Parse(meetingTime.SelectedDate.ToString());
            }
            catch { dc.MeetingTime = nullDate; }

            dc.Venu1 = txtVenue1.Text.Trim();
            dc.Venu2 = txtVenue2.Text.Trim();
            dc.Landmark = txtLandmark.Text.Trim();
            dc.City = txtCity.Text.Trim();
            dc.Pin = txtPin.Text.Trim();
            dc.State = txtState.Text.Trim();
            dc.Country = txtCountry.Text.Trim();
            dc.GpsLatitude = txtLatitude.Text.Trim();
            dc.GpsLongitude = txtLongitude.Text.Trim();

            dc.Website = txtWebsite.Text.Trim();
            dc.FacebookLink = txtFacebookLink.Text.Trim();
            if (Session["ImageLogo"] != null)
                dc.Logo = Session["ImageLogo"].ToString();
            else
                dc.Logo = "";

            if (Session["ImageMap"] != null)
                dc.LocationMap = Session["ImageMap"].ToString();
            else
                dc.LocationMap = "";

            try
            {
                dc.InstallationDate = DateTime.Parse(installationDate.SelectedDate.ToString());
            }
            catch { dc.InstallationDate = nullDate; }
            //try
            //{
            //    dc.InstallationTime = DateTime.Parse(installationTime.SelectedDate.ToString());
            //}
            //catch { dc.InstallationTime = nullDate; }

            try
            {
                dc.InstallationTime = rbtnTime.SelectedItem.Text.ToString();
            }
            catch { dc.InstallationTime = ""; }


            dc.InstallationChiefGuest = txtChiefGuest.Text.Trim();
            dc.InstallationVenue = txtInstallationVenue.Text.Trim();

            try
            {
                dc.OcvDate = DateTime.Parse(ocvDate.SelectedDate.ToString());
            }
            catch { dc.OcvDate = nullDate; }
            try
            {
                dc.OcvTime = DateTime.Parse(ocvTime.SelectedDate.ToString());
            }
            catch { dc.OcvTime = nullDate; }

            try
            {
                dc.Phf = int.Parse(txtPHF.Text.Trim());
            }
            //catch { dc.Phf = nullInt.Value; }
            catch { dc.Phf = 0; }

            try
            {
                dc.Trfsm = int.Parse(txtTRFSM.Text.Trim());
            }
            catch { dc.Trfsm = 0; }
            try
            {
                dc.Md = int.Parse(txtMD.Text.Trim());
            }
            catch { dc.Md = 0; }
            try
            {
                dc.Phsm = int.Parse(txtPHSM.Text.Trim());
            }
            catch { dc.Phsm = 0; }
            try
            {
                dc.ArchKlump = int.Parse(txtArchKlump.Text.Trim());
            }
            catch { dc.ArchKlump = 0; }

            dc.DS = DDLMem1.SelectedItem.Text.Trim();
            dc.AG = DDLMem2.SelectedItem.Text.Trim();
            dc.AT = DDLMem3.SelectedItem.Text.Trim();
            dc.GC = DDLMem4.SelectedItem.Text.Trim();

            dc.ClubTrfStatus = rbtnClubTrfStatus.SelectedItem.Text.Trim();

            dc.FlagshipText = txtFlagshipProject.Text.Trim();

            if (Session["FlagshipImg"] != null)
                dc.FlagshipImage = Session["FlagshipImg"].ToString();
            else
                dc.FlagshipImage = "";

            int exe = dc.UpdateDistrictClub();
            if (exe > 0)
            {
                showmsg("Record updated successfully !", "view_clubs.aspx");
            }
        }
        catch
        {
        }
    }
    private void clear()
    {
        txtTitle.Text = "";
        txtCity.Text = "";
        txtClubNo.Text = "";
        txtCountry.Text = "India";
        txtLandmark.Text = "";
        txtLatitude.Text = "";
        txtLongitude.Text = "";
        txtPin.Text = "";
        txtState.Text = "Maharashtra";
        txtVenue1.Text = "";
        txtVenue2.Text = "";
        //DDLDays.ClearSelection();
        //DDLMonth.ClearSelection();
        //DDLYear.ClearSelection();
        //DDLDays.ClearSelection();       
        DDLDay.ClearSelection();
        txtWebsite.Text = "http://www.";

    }

    #region Bind Time Day Month Year & Show Message
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
    //        for (Int32 i = Convert.ToInt32(DateTime.Now.Year); i >= 1920; i--)
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
    //       DLTimeH.Items.Add(s.ToString());
    //        //DDLInstallationTimeH.Items.Add(s.ToString());
    //        //ddlOcvTimeH.Items.Add(s.ToString());

    //    }
    //    DDLTimeH.Items.Insert(0, "HH");
    //    DDLTimeH.Items.Insert(1, "00");
    //    //DDLInstallationTimeH.Items.Insert(0, "HH");
    //    //DDLInstallationTimeH.Items.Insert(1, "00");
    //    //ddlOcvTimeH.Items.Insert(0, "HH");
    //    //ddlOcvTimeH.Items.Insert(1, "00");
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
    //        //DDLInstallationTimeM.Items.Add(s.ToString());
    //        //ddlOcvTimeM.Items.Add(s.ToString());
    //    }
    //    DDLTimeM.Items.Insert(0, "MM");
    //    DDLTimeM.Items.Insert(1, "00");
    //    //DDLInstallationTimeM.Items.Insert(0, "MM");
    //    //DDLInstallationTimeM.Items.Insert(1, "00");
    //    //ddlOcvTimeM.Items.Insert(0, "MM");
    //    //ddlOcvTimeM.Items.Insert(1, "00");
    //}

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
        catch
        {
        }
    }   
    
    #endregion
    protected void rbtnIW_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnIW.SelectedValue == "Yes")
        {
            trIW.Visible = true;
        }
        else
        {
            trIW.Visible = false;
        }
    }
    protected void rbtnRCC_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnRCC.SelectedValue == "Yes")
        {
            trRCC.Visible = true;
        }
        else
        {
            trRCC.Visible = false;
        }
    }
    protected void rbtnSrCi_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnSrCi.SelectedValue == "Yes")
        {
            trSrCi.Visible = true;
        }
        else
        {
            trSrCi.Visible = false;
        }
    }
    protected void rbtnInteract_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnInteract.SelectedValue == "Yes")
        {
            trIntr.Visible = true;
        }
        else
        {
            trIntr.Visible = false;
        }
    }
    protected void rbtnRotaract_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnRotaract.SelectedValue == "Yes")
        {
            trRtr.Visible = true;
        }
        else
        {
            trRtr.Visible = false;
        }
    }
    protected void rbtnBEN_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnBEN.SelectedValue == "Yes")
        {
            trBEN.Visible = true;
        }
        else
        {
            trBEN.Visible = false;
        }
    }
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "ClubsLogo";

            string fileName, strFileName = "";
            string ext = "";
            strFileName = txtTitle.Text.Trim().Replace(" ", "").ToString();
            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");            

            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = strFileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["ImageLogo"] = fileName;
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
            string strPath = "ClubsLogo";

            string fileName, strFileName = "";
            string ext = "";
            strFileName = txtTitle.Text.Trim().Replace(" ", "").ToString();
            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");            

            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = strFileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["ImageMap"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void RadAsyncUpload3_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "ProjectFlagship";

            string fileName, strFileName = "";
            string ext = "";

            strFileName = txtTitle.Text.Trim().Replace(" ", "").ToString();


            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");          

            ext = fileName.Substring(fileName.LastIndexOf("."));            
            fileName = strFileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["FlagshipImg"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
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
                obj.SetCommandQry = "select club_name from clubs_tbl where club_name='" + txtTitle.Text.Trim().ToString() + "'";
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
    private void GetAllDist3141Members()
    {
        MembersBll dc = new MembersBll();
        DataTable dt = new DataTable();

        dt = dc.GetAllDist3141Members();
        if (dt.Rows.Count > 0)
        {
            DDLMem1.DataTextField = "Name";
            DDLMem1.DataValueField = "MemberId";
            DDLMem1.DataSource = dt;
            DDLMem1.DataBind();

            // DDLMem1.Items.Insert(0, "Select");

            DDLMem2.DataTextField = "Name";
            DDLMem2.DataValueField = "MemberId";
            DDLMem2.DataSource = dt;
            DDLMem2.DataBind();

            DDLMem3.DataTextField = "Name";
            DDLMem3.DataValueField = "MemberId";
            DDLMem3.DataSource = dt;
            DDLMem3.DataBind();


            DDLMem4.DataTextField = "Name";
            DDLMem4.DataValueField = "MemberId";
            DDLMem4.DataSource = dt;
            DDLMem4.DataBind();
        }
    }

    //private void BindIW(int id)
    //{
    //    DataTable dt = new DataTable();

    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "SELECT * FROM distclub_iw_tbl where club_id=" + id;

    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        //GridView1.DataSourceID = "SqlDataSource1";
    //        rbtnIW.SelectedIndex = 0;
    //        trIW.Visible = true;

    //        GridView1.DataSource = dt;
    //        GridView1.DataBind();
    //    }

    //    else
    //    {
    //        rbtnIW.SelectedIndex = 1;
    //        trIW.Visible = false;
    //    }
    //}
    private void DeleteAllTempData()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteTempClubData";
            int exe = obj.ExecuteNonQuery();
        }
        catch { }
        
    }
    private void UpdateIWClubId(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            //obj.SetCommandSP = "z_UpdateIWClubId";
            obj.SetCommandSP = "z_UpdateAllClubData";

            obj.AddParam("@club_id", id);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }
    }
    protected void Insert(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource1.Insert();
            txtIwClubname.Text = "";
        }
    }
    protected void btnAddRcc_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource2.Insert();
            txtRccClubname.Text = "";
        }
    }
    protected void btnAddCtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource3.Insert();
            txtCtnClubname.Text = "";
        }
    }
    protected void btnAddRtr_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource4.Insert();
            txtRtrClub.Text = "";
        }
    }
    protected void btnAddIntr_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource5.Insert();
            txtIntrClub.Text = "";
        }
    }
}
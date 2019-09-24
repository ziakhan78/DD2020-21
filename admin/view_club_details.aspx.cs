using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_club_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //imgLogo.Visible = false;
           // imgMap.Visible = false;
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetClubDetails(id);
                GetIw(id);
                GetRotaract(id);
                GetInteract(id);
                GetSrCitizen(id);
                GetRcc(id);
                GetBodDetails(id);
                GetNoOfMembers(id);
            }
        }
    }

    private void GetIw(int id)
    {
        string strIw = "";
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_iw_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblInnerWheelClubs.Text = dt.Rows.Count.ToString();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    strIw = strIw + dr["club_name"].ToString() + ", ";
            //}
            //lblInnerWheelClubs.Text = strIw.Remove(strIw.Length - 2);
        } 
        else
        { lblInnerWheelClubs.Text = "0"; }           
    }
    private void GetRotaract(int id)
    {
        string strRtr = "";
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_rotaract_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblRotaractClubs.Text = dt.Rows.Count.ToString();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    strRtr = strRtr + dr["club_name"].ToString() + ", ";
            //}
            //lblRotaractClubs.Text = strRtr.Remove(strRtr.Length - 2);
        }
        else
        { lblRotaractClubs.Text = "0"; }
    }
    private void GetInteract(int id)
    {
        string strIntr = "";
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_interact_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblInteractClubs.Text = dt.Rows.Count.ToString();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    strIntr = strIntr + dr["club_name"].ToString() + ", ";
            //}
            //lblInteractClubs.Text = strIntr.Remove(strIntr.Length - 2);
        }
        else
        { lblInteractClubs.Text = "0"; }
    }
    private void GetSrCitizen(int id)
    {
        string strSrCtzn = "";
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_sr_citizen_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblSrCitizenClubs.Text = dt.Rows.Count.ToString();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    strSrCtzn = strSrCtzn + dr["club_name"].ToString() + ", ";
            //}
            //lblSrCitizenClubs.Text = strSrCtzn.Remove(strSrCtzn.Length - 2);
        }
        else
        { lblSrCitizenClubs.Text = "0"; }
    }
    private void GetRcc(int id)
    {
        string strRcc = "";
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select club_name from distclub_rcc_tbl where club_id =" + id;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblRccClubs.Text = dt.Rows.Count.ToString();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    strRcc = strRcc + dr["club_name"].ToString() + ", ";
            //}
            //lblRccClubs.Text = strRcc.Remove(strRcc.Length - 2);
        }
        else
        { lblRccClubs.Text = "0"; }
    }
    private void GetClubDetails(int id)
    {
        try
        {
            DistrictClub obj = new DistrictClub();
            obj.Id = id;

            DataTable dt = new DataTable();
            dt = obj.GetClubById();
            if (dt.Rows.Count > 0)
            {

                // Club Details

                lblClubName.Text = dt.Rows[0]["club_name"].ToString();
                lblClubNo.Text = dt.Rows[0]["ri_club_No"].ToString();               

                DateTime chrterdate = DateTime.Parse(dt.Rows[0]["charter_date"].ToString());
                lblCharterDate.Text = chrterdate.ToString("dd-MMMM-yyyy");

                lblMeetingDay.Text = dt.Rows[0]["meeting_day"].ToString();
                // lblMeetingTime.Text = dt.Rows[0]["meeting_time"].ToString();

                try
                {
                    DateTime meetingTime = DateTime.Parse(dt.Rows[0]["meeting_time"].ToString());
                    lblMeetingTime.Text = meetingTime.ToString("hh:mm tt");
                }
                catch
                {
                    lblMeetingTime.Text = "-";
                }


                lblVenue.Text = dt.Rows[0]["venue1"].ToString() + " " + dt.Rows[0]["venue2"].ToString() + " " + dt.Rows[0]["city"].ToString();

                lblDS.Text = dt.Rows[0]["ds"].ToString();
                lblAT.Text = dt.Rows[0]["at"].ToString();
                lblAG.Text = dt.Rows[0]["ag"].ToString();

                lblFlagship.Text = dt.Rows[0]["flagship_text"].ToString();

                string strFlagship = dt.Rows[0]["flagship_image"].ToString();
                if (strFlagship != "")
                {
                    imgFlagship.Visible = true;
                    imgFlagship.ImageUrl = "../ProjectFlagship/" + strFlagship;
                }
                else
                {
                    imgFlagship.Visible = false;
                }

                DateTime instDate = DateTime.Parse(dt.Rows[0]["installation_date"].ToString());
                lblInstallation.Text = instDate.ToString("dd-MMMM-yyyy");

                DateTime ocvDate = DateTime.Parse(dt.Rows[0]["ocv_date"].ToString());
                lblOcv.Text = ocvDate.ToString("dd-MMMM-yyyy");

                //string gps = dt.Rows[0]["gps_latitude"].ToString();
                //if (gps != "")
                //{
                //    lblGPS.Text = "Latitude : " + dt.Rows[0]["gps_latitude"].ToString() + "    " + "Longitude : " + dt.Rows[0]["gps_longitude"].ToString();
                //}
                //else
                //{
                //    lblGPS.Text = "";
                //}



                //lblInstTime.Text = dt.Rows[0]["installation_time"].ToString();
                //lblInstChiefGuest.Text = dt.Rows[0]["installation_chief_guest"].ToString();
                //lblInstVenue.Text = dt.Rows[0]["installation_venue"].ToString();




                //lblOcvTime.Text = dt.Rows[0]["ocv_time"].ToString();

                //lblTrfStatus.Text = dt.Rows[0]["club_trf_status"].ToString();

                //string strLogo = dt.Rows[0]["club_logo"].ToString();
                //if(strLogo!="")
                //{
                //    imgLogo.Visible = true;
                //    imgLogo.ImageUrl = "../ClubsLogo/" + strLogo;
                //}
                //else
                //{
                //    imgLogo.Visible = false;
                //}


                //string strLocationMap = dt.Rows[0]["location_map"].ToString();
                //if (strLocationMap != "")
                //{
                //    imgMap.Visible = true;
                //    imgMap.ImageUrl = "../ClubsLogo/" + strLocationMap;
                //}
                //else
                //{
                //    imgMap.Visible = false;
                //}




            }
        }
        catch { }
    }
    private void GetBodDetails(int id)
    {  

        DataTable dt = new DataTable();
        BodBll obj = new BodBll();
        obj.ClubId = id;
        dt = obj.GetAllBodByDist3141ClubId();

        if (dt.Rows.Count > 0)
        {
            string desi = "";
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                try
                {
                    desi = dt.Rows[i]["designation"].ToString();

                    if (desi == "President")
                    {
                        lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
                        try
                        {
                            DateTime dojDt = DateTime.Parse(dt.Rows[0]["DOJ"].ToString());
                            lblJr.Text = dojDt.ToString("yyyy");
                        }
                        catch { lblJr.Text = "-"; }

                        string strClassification= dt.Rows[i]["classification"].ToString();
                        if (strClassification != "")
                        {
                            lblClassification.Text = strClassification;
                        }
                        else { lblClassification.Text = "-"; }

                        lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
                        lblEmail.Text = dt.Rows[i]["EmailId"].ToString();

                        lblPhResi.Text = dt.Rows[i]["RPhoneCc1"].ToString() + "-" + dt.Rows[i]["RPhoneAc1"].ToString() + "-" + dt.Rows[i]["RPhone1"].ToString();
                        lblPhOffice.Text = dt.Rows[i]["OPhoneCc1"].ToString() + "-" + dt.Rows[i]["OPhoneAc1"].ToString() + "-" + dt.Rows[i]["OPhone1"].ToString();

                        string strAdd1 = dt.Rows[i]["RAdd1"].ToString();
                        string strAdd2 = dt.Rows[i]["RAdd2"].ToString();
                        string strCity = dt.Rows[i]["RCity"].ToString();
                        string strPin = dt.Rows[i]["RPin"].ToString();

                        string strAddress = "";

                        if (strAdd1 != "")
                            strAddress = dt.Rows[i]["RAdd1"].ToString();
                        if (strAdd2 != "")
                            strAddress = strAddress + "<br />" + dt.Rows[i]["RAdd2"].ToString();
                        if (strCity != "")
                            strAddress = strAddress + "<br />" + dt.Rows[i]["RCity"].ToString();
                        if (strPin != "")
                            lblAddress.Text = strAddress + "-" + dt.Rows[i]["RPin"].ToString();
                        else
                            lblAddress.Text = strAddress;

                        try
                        {
                            DateTime dobDt = DateTime.Parse(dt.Rows[i]["DOB"].ToString());
                            lblDob.Text = dobDt.ToString("dd MMMM");
                        }
                        catch { lblDob.Text = "-"; }

                        string strBg = dt.Rows[i]["BG"].ToString().Trim();
                        string strRhf = dt.Rows[i]["RHF"].ToString();

                        if (strBg != "Select")
                        {
                            if (strBg != "")
                            {
                                lblBg.Text = strBg +strRhf;
                            }
                        }
                        else
                        {
                            lblBg.Text = "-";
                        }
                           

                        try
                        {
                            DateTime sdoDt = DateTime.Parse(dt.Rows[i]["SDOB"].ToString());
                            lblSdob.Text = sdoDt.ToString("dd MMMM");
                        }
                        catch { lblSdob.Text = "-"; }

                        //lblSbg.Text = dt.Rows[i]["SBG"].ToString() + " " + dt.Rows[i]["SRHF"].ToString();

                        string strSBg = dt.Rows[i]["SBG"].ToString().Trim();
                        string strSRhf = dt.Rows[i]["SRHF"].ToString();

                        if (strSBg != "Select")
                        {
                            if (strSBg != "")
                            {
                                lblSbg.Text = strSBg + strSRhf;
                            }
                        }
                        else
                        {
                            lblSbg.Text = "-";
                        }


                        string strSpouse = dt.Rows[i]["SName"].ToString();
                        if (strSpouse != "")
                        {
                            lblSpouseName.Text = strSpouse;
                        }
                        else { lblSpouseName.Text = "-"; }



                        try
                        {
                            DateTime anniDt = DateTime.Parse(dt.Rows[i]["Anniversary"].ToString());
                            lblAnni.Text = anniDt.ToString("dd MMMM");
                        }
                        catch { lblAnni.Text = "-"; }

                        //string email = dt.Rows[i]["EmailId"].ToString();
                        //emaillink.HRef = "mailto:" + email;

                        string strImg = dt.Rows[i]["MemberImage"].ToString();
                        if (strImg != "")
                        {                           
                            imgPresident.Visible = true;
                            imgPresident.ImageUrl = "../MemberImages/" + strImg;
                        }

                        string strSImg = dt.Rows[i]["SImage"].ToString();
                        if (strSImg != "")
                        {                          
                            imgPresidentSpouse.Visible = true;
                            imgPresidentSpouse.ImageUrl = "../MemberImages/" + strSImg;
                        }

                    }

                    if (desi == "Secretary")
                    {
                        lblSecretaryName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
                        try
                        {
                            DateTime dojDt = DateTime.Parse(dt.Rows[i]["DOJ"].ToString());
                            lblSecJr.Text = dojDt.ToString("yyyy");
                        }
                        catch { lblSecJr.Text = "-"; }

                        // lblSecClassi.Text = dt.Rows[i]["classification"].ToString();
                        string strClassification = dt.Rows[i]["classification"].ToString();
                        if (strClassification != "")
                        {
                            lblSecClassi.Text = strClassification;
                        }
                        else { lblSecClassi.Text = "-"; }


                        lblSecMobile.Text = dt.Rows[i]["Mobile1"].ToString();
                        lblSecEmail.Text = dt.Rows[i]["EmailId"].ToString();

                        lblSecPhResi.Text = dt.Rows[i]["RPhoneCc1"].ToString()+"-"+ dt.Rows[i]["RPhoneAc1"].ToString()+"-"+dt.Rows[i]["RPhone1"].ToString();
                        lblSecPhOffice.Text = dt.Rows[i]["OPhoneCc1"].ToString() + "-" + dt.Rows[i]["OPhoneAc1"].ToString() + "-" + dt.Rows[i]["OPhone1"].ToString();

                        string strAdd1 = dt.Rows[i]["RAdd1"].ToString();
                        string strAdd2 = dt.Rows[i]["RAdd2"].ToString();
                        string strCity = dt.Rows[i]["RCity"].ToString();
                        string strPin = dt.Rows[i]["RPin"].ToString();

                        string strAddress = "";

                        if (strAdd1 != "")
                            strAddress = dt.Rows[i]["RAdd1"].ToString();
                        if (strAdd2 != "")
                            strAddress = strAddress + "<br />" + dt.Rows[i]["RAdd2"].ToString();
                        if (strCity != "")
                            strAddress = strAddress + "<br />" + dt.Rows[i]["RCity"].ToString();
                        if (strPin != "")
                            lblSecAddress.Text = strAddress + "-" + dt.Rows[i]["RPin"].ToString();
                        else
                            lblSecAddress.Text = strAddress;


                        string strSecSpouse = dt.Rows[i]["SName"].ToString();
                        if (strSecSpouse != "")
                        {
                            lblSecSpouse.Text = strSecSpouse;
                        }
                        else { lblSecSpouse.Text = "-"; }


                        try
                        {
                            DateTime dobDt = DateTime.Parse(dt.Rows[i]["DOB"].ToString());
                            lblSecDob.Text = dobDt.ToString("dd MMMM");
                        }
                        catch { lblSecDob.Text = "-"; }

                        // lblSecBg.Text = dt.Rows[i]["BG"].ToString() + " " + dt.Rows[i]["RHF"].ToString();

                        string strSecBg = dt.Rows[i]["BG"].ToString().Trim();
                        string strSecRhf = dt.Rows[i]["RHF"].ToString();

                        if (strSecBg != "Select")
                        {
                            if (strSecBg != "")
                            {
                                lblSecBg.Text = strSecBg +strSecRhf;
                            }
                        }
                        else
                        {
                            lblSecBg.Text = "-";
                        }

                        try
                        {
                            DateTime sdoDt = DateTime.Parse(dt.Rows[i]["SDOB"].ToString());
                            lblSecSdob.Text = sdoDt.ToString("dd MMMM");
                        }
                        catch { lblSecSdob.Text = "-"; }

                        // lblSecSbg.Text = dt.Rows[i]["SBG"].ToString() + " " + dt.Rows[i]["SRHF"].ToString();

                        string strSecSBg = dt.Rows[i]["BG"].ToString().Trim();
                        string strSecSRhf = dt.Rows[i]["RHF"].ToString();

                        if (strSecSBg != "Select")
                        {
                            if (strSecSBg != "")
                            {
                                lblSecSbg.Text = strSecSBg + strSecSRhf;
                            }
                        }
                        else
                        {
                            lblSecSbg.Text = "-";
                        }


                        try
                        {
                            DateTime anniDt = DateTime.Parse(dt.Rows[i]["Anniversary"].ToString());
                            lblSecAnni.Text = anniDt.ToString("dd MMMM");
                        }
                        catch { lblSecAnni.Text = "-"; }


                        string strSecImg = dt.Rows[i]["MemberImage"].ToString();
                        if (strSecImg != "")
                        {                           
                            imgSecretary.Visible = true;
                            imgSecretary.ImageUrl = "../MemberImages/" + strSecImg;
                        }

                        string strSesSImg = dt.Rows[i]["SImage"].ToString();
                        if (strSesSImg != "")
                        {                          
                            imgSecretarySpouse.Visible = true;
                            imgSecretarySpouse.ImageUrl = "../MemberImages/" + strSesSImg;
                        }


                    }

                    //if (desi == "President Elect")
                    //{
                    //    lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();                       
                    //    lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
                    //    lblEmail.Text = dt.Rows[i]["EmailId"].ToString();                    
                    //}

                    //if (desi == "Hon. Treasurer")
                    //{
                    //    lblPresidentName.Text = "Rtn. " + dt.Rows[i]["Name"].ToString();
                    //    lblMobile.Text = dt.Rows[i]["Mobile1"].ToString();
                    //    lblEmail.Text = dt.Rows[i]["EmailId"].ToString();
                    //}

                }
                catch { }
            }
        }
    }
    private void GetNoOfMembers(int id)
    {      
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetMaleFemaleMembersByClubId";
        obj.AddParam("@club_id", id);
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //lblMembers.Text = dt.Rows[0]["Members"].ToString();
            lblMembers.Text = dt.Rows[0]["Total"].ToString();
            lblWomensMembers.Text = dt.Rows[0]["WomenMembers"].ToString();

        }
        else
        { lblMembers.Text = "-";
            lblWomensMembers.Text = "-";
        }
    }
}
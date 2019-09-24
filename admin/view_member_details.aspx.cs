using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_member_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetProfile(id);
            }
        }
    }
    private void GetProfile(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetMemberDetails";
            obj.AddParam("@MemberId", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {

                lblClubName.Text = dt.Rows[0]["club_name"].ToString();
                lblClubNo.Text = dt.Rows[0]["ri_club_No"].ToString();

                DateTime chrterdate = DateTime.Parse(dt.Rows[0]["charter_date"].ToString());
                lblCharterDate.Text = chrterdate.ToString("dd-MMMM-yyyy");

                lblMeetingDay.Text = dt.Rows[0]["meeting_day"].ToString();
                lblMeetingTime.Text = dt.Rows[0]["meeting_time"].ToString();
                lblVenue.Text = dt.Rows[0]["venue1"].ToString() + " " + dt.Rows[0]["venue2"].ToString() + " " + dt.Rows[0]["city"].ToString();
                string gps = dt.Rows[0]["gps_latitude"].ToString();
                if (gps != "")
                {
                    lblGPS.Text = "Latitude : " + dt.Rows[0]["gps_latitude"].ToString() + "    " + "Longitude : " + dt.Rows[0]["gps_longitude"].ToString();
                }
                else
                {
                    lblGPS.Text = "";
                }

                // Members Details

                lblCharterMember.Text = dt.Rows[0]["CharterMember"].ToString();
                lblName.Text = dt.Rows[0]["Title"].ToString() + " " + dt.Rows[0]["FName"].ToString() + " " + dt.Rows[0]["MName"].ToString() + " " + dt.Rows[0]["LName"].ToString();// +" " + dt.Rows[0]["Suffix"].ToString();
                lblCallName.Text = dt.Rows[0]["CallName"].ToString();
                lblHobbies.Text = dt.Rows[0]["Hobbies"].ToString();
                lblFood.Text = dt.Rows[0]["FoodPreference"].ToString();
                lblDrink.Text = dt.Rows[0]["DrinkPreference"].ToString();
                lblMembershipNo.Text = dt.Rows[0]["MembershipNo"].ToString();
                lblMembershipType.Text = dt.Rows[0]["MemType"].ToString();
                lblGender.Text = dt.Rows[0]["Gender"].ToString();
                lblClassification.Text = dt.Rows[0]["Classification"].ToString();
                lblQualification.Text = dt.Rows[0]["Qualification"].ToString();
                lblEmail.Text = dt.Rows[0]["EmailId"].ToString();
                //lblAltEmail.Text = dt.Rows[0]["AltEmailId"].ToString();
                string strAltEmailId = dt.Rows[0]["AltEmailId"].ToString();
                if (strAltEmailId != "")
                    lblEmail.Text = dt.Rows[0]["EmailId"].ToString() + " / " + strAltEmailId;
                
                lblmob1.Text = dt.Rows[0]["Mobile1"].ToString();

                string strMobile2 = dt.Rows[0]["Mobile2"].ToString();
                if (strMobile2 != "")
                    lblmob1.Text = dt.Rows[0]["Mobile1"].ToString() + " / " + strMobile2;

               
                //lblMob2.Text = dt.Rows[0]["Mobile2"].ToString();

                try
                {
                    DateTime m_dob = DateTime.Parse(dt.Rows[0]["DOB"].ToString());
                    lblDOB.Text = m_dob.ToString("dd MMMM");
                }
                catch { }


                try
                {
                    lblTRF.Text = dt.Rows[0]["TrfAmt"].ToString();
                    lblTrfStatus.Text = dt.Rows[0]["TRF"].ToString();
                }
                catch { }
                try
                {
                    DateTime dtt = DateTime.Parse(dt.Rows[0]["DOJ"].ToString());
                    if (dtt.Year == 1900 && dtt.Month == 1 && dtt.Day == 1)
                    {
                        lblDOJ.Text = "";
                    }
                    else
                    {
                        lblDOJ.Text = dtt.ToString("dd MMMM, yyyy");
                    }
                }
                catch { }

                lblProposed.Text = "Rtn. " + dt.Rows[0]["ProposedBy"].ToString();

                string mornigTime = dt.Rows[0]["MorningBTTC"].ToString();
                string noonTime = dt.Rows[0]["NoonBTTC"].ToString();
                string eveningTime = dt.Rows[0]["EveningBTTC"].ToString();


                string bg = dt.Rows[0]["BG"].ToString().Trim();
                if (bg == "Select")
                {
                    lblBG.Text = "";
                }
                else
                {
                    lblBG.Text = bg + " " + dt.Rows[0]["RHF"].ToString();
                }

                // Spouse Details

                lblSHobbies.Text = dt.Rows[0]["SHobbies"].ToString();
                lblSFood.Text = dt.Rows[0]["SFoodPreference"].ToString();
                lblSDrink.Text = dt.Rows[0]["SDrinkPreference"].ToString();
                lblSpouseName.Text = dt.Rows[0]["SName"].ToString();

                try
                {
                    DateTime s_dob = DateTime.Parse(dt.Rows[0]["SDOB"].ToString());
                    lblSDOB.Text = s_dob.ToString("dd MMMM");
                }
                catch { }

                try
                {
                    DateTime anni = DateTime.Parse(dt.Rows[0]["Anniversary"].ToString());
                    lblAnni.Text = anni.ToString("dd MMMM");
                }
                catch { }

                lblSMob.Text = dt.Rows[0]["SMobile"].ToString();
                lblSEmail.Text = dt.Rows[0]["SEmailId"].ToString();

                string sbg = dt.Rows[0]["SBG"].ToString().Trim();
                if (sbg == "Select")
                {
                    lblSBG.Text = "";
                }
                else
                {
                    lblSBG.Text = sbg + " " + dt.Rows[0]["SRHF"].ToString();
                }

                //Address

                lblAddress.Text = dt.Rows[0]["RAdd1"].ToString() + " <br/>" + dt.Rows[0]["RAdd2"].ToString();
                lblCity.Text = dt.Rows[0]["RCity"].ToString();
                
                lblPhone1.Text = dt.Rows[0]["RPhoneCc1"].ToString() + " " + dt.Rows[0]["RPhoneAc1"].ToString() + " " + dt.Rows[0]["RPhone1"].ToString();
                lblPhone2.Text = dt.Rows[0]["RPhoneCc2"].ToString() + " " + dt.Rows[0]["RPhoneAc2"].ToString() + " " + dt.Rows[0]["RPhone2"].ToString();
                lblFax.Text = dt.Rows[0]["RFaxCc"].ToString() + " " + dt.Rows[0]["RFaxAc"].ToString() + " " + dt.Rows[0]["RFax"].ToString();
                lblPin.Text = dt.Rows[0]["RPin"].ToString();
                lblState.Text = dt.Rows[0]["RState"].ToString();
                lblCountry.Text = dt.Rows[0]["RCountry"].ToString();

                // Compnay Address

                lblCompany.Text = dt.Rows[0]["CompanyName"].ToString();
                lblCompDesig.Text = dt.Rows[0]["CompanyDesignation"].ToString();
                lblCompAdd.Text = dt.Rows[0]["OAdd1"].ToString() + " <br />" + dt.Rows[0]["OAdd2"].ToString();
                lblCompCity.Text = dt.Rows[0]["OCity"].ToString();
                lblCompPin.Text = dt.Rows[0]["OPin"].ToString();
                lblCompPhone1.Text = dt.Rows[0]["OPhoneCc1"].ToString() + " " + dt.Rows[0]["OPhoneAc1"].ToString() + " " + dt.Rows[0]["OPhone1"].ToString();
                lblCompPhone2.Text = dt.Rows[0]["OPhoneCc2"].ToString() + " " + dt.Rows[0]["OPhoneAc2"].ToString() + " " + dt.Rows[0]["OPhone2"].ToString();
                lblCompFax.Text = dt.Rows[0]["OFaxCc"].ToString() + " " + dt.Rows[0]["OFaxAc"].ToString() + " " + dt.Rows[0]["OFax"].ToString();
                lblCompEmail.Text = dt.Rows[0]["OMail"].ToString();

                lblCompState.Text = dt.Rows[0]["OState"].ToString();
                lblCompCountry.Text = dt.Rows[0]["OCountry"].ToString();
                string website = dt.Rows[0]["Website"].ToString();
                if (website == "http://www.")
                {
                    lblWebsite.Text = "";
                }
                else
                {
                    lblWebsite.Text = website;
                }


                // Childrens Details

                lblChildName1.Text = dt.Rows[0]["C1Name"].ToString();
                lblChildGender1.Text = dt.Rows[0]["GenderC1"].ToString();


                try
                {
                    DateTime c1 = DateTime.Parse(dt.Rows[0]["C1DOB_D"].ToString());
                    lblChildDOB1.Text = c1.ToString("dd-MMMM-yyyy");
                }
                catch { }

                lblChildName2.Text = dt.Rows[0]["C2Name"].ToString();
                lblChildGender2.Text = dt.Rows[0]["GenderC2"].ToString();

                try
                {
                    DateTime c2 = DateTime.Parse(dt.Rows[0]["C2DOB_D"].ToString());
                    lblChildDOB2.Text = c2.ToString("dd-MMMM-yyyy");
                }
                catch { }
                lblChildName3.Text = dt.Rows[0]["C3Name"].ToString();
                lblChildGender3.Text = dt.Rows[0]["GenderC3"].ToString();

                try
                {
                    DateTime c3 = DateTime.Parse(dt.Rows[0]["C3DOB_D"].ToString());
                    lblChildDOB3.Text = c3.ToString("dd-MMMM-yyyy");
                }
                catch { }

                // Communication Prefrence

                lblMailRef.Text = dt.Rows[0]["AddressPreference"].ToString();
                lblFaxRef.Text = dt.Rows[0]["FaxPreference"].ToString();
                lblEmailRef.Text = dt.Rows[0]["MailPreference"].ToString();

                string strImg = dt.Rows[0]["MemberImage"].ToString();
                if (strImg != "")
                {
                    Session["Image"] = strImg;
                    MemImage.Visible = true;
                    MemImage.ImageUrl = "../MemberImages/" + strImg;
                }


                string strSImg = dt.Rows[0]["SImage"].ToString();
                if (strSImg != "")
                {
                    Session["SImage"] = strSImg;
                    SpouseImage.Visible = true;
                    SpouseImage.ImageUrl = "../MemberImages/" + strSImg;
                }
            }
        }
        catch { }
    }
}
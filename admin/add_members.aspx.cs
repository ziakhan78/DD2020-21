using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_add_members : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetValidUntilExpires(false);

        if (!IsPostBack)
        {
            //trHeld.Visible = false;
            // trAward.Visible = false;
            // RadGrid1.Visible = false;
            // RadGrid2.Visible = false;   

            RadGrid1.Visible = false;
            RadGrid2.Visible = false;

            rbtnPrefAlcohol.Visible = false;
            rbtnSpousePreferAlcohol.Visible = false;

            Session["SImage"] = null;
            Session["Image"] = null;

            TrPass.Visible = false;
            btncancel.Visible = true;
            TrProposed.Visible = false;

            SpouseImage.Visible = false;
            MemImage.Visible = false;
            BindYearForAwardsPositions(1920);
            BindTime();
            daybind();
            monthbind();
            yearbind();
            BindTitle();
            //GetClubDetails();
            if (Request.QueryString["id"] != null)
            {
                TrPass.Visible = true;
                btncancel.Visible = false;
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetProfile(id);
                BindGrid2(id);
                BindGrid(id);

            }
        }
    }
    private void BindMembers(int clubid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from ViewMembers where DistrictClubID='" + clubid + "' and Status='True' order by Name asc";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLproposed.DataTextField = "Name";
        DDLproposed.DataValueField = "MemberId";

        DDLproposed.DataSource = dt;
        DDLproposed.DataBind();
        //DDLMember.Items.Insert(0, "Select");
    }
    private void GetProfile(int id)
    {
        try
        {

            MembersBll obj = new MembersBll();
            DataTable dt = new DataTable();
            obj.Id = id;
            dt = obj.GetMemberById();
            if (dt.Rows.Count > 0)
            {

                // Club details


                DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
                DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();
                try
                {
                    BindMembers(int.Parse(dt.Rows[0]["DistrictClubID"].ToString()));
                }
                catch { }

                lblClubNo.Text = dt.Rows[0]["ri_club_no"].ToString();

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


                // Member Details

                txtmno.Text = dt.Rows[0]["MembershipNo"].ToString();
                string mType = dt.Rows[0]["MemType"].ToString();
                if (mType == "Active")
                    rbtnMtype.SelectedIndex = 0;
                else
                    rbtnMtype.SelectedIndex = 1;

                drtitle.SelectedItem.Text = dt.Rows[0]["Title"].ToString();
                txtfname.Text = dt.Rows[0]["FName"].ToString();
                txtmname.Text = dt.Rows[0]["MName"].ToString();
                txtlname.Text = dt.Rows[0]["LName"].ToString();

                string gender = dt.Rows[0]["Gender"].ToString();
                if (gender == "Male")
                    rbtnGender.SelectedIndex = 0;
                else
                    rbtnGender.SelectedIndex = 1;

                txtclasi.Text = dt.Rows[0]["Classification"].ToString();
                txtquali.Text = dt.Rows[0]["Qualification"].ToString();
                txtpemail.Text = dt.Rows[0]["EmailId"].ToString();
                txtpemail2.Text = dt.Rows[0]["AltEmailId"].ToString();
                txtoldp.Text = dt.Rows[0]["Password"].ToString();

                txtmob1cc.Text = dt.Rows[0]["MobileCc1"].ToString();
                try
                {
                    txtmob1.Text = dt.Rows[0]["Mobile1"].ToString();
                }
                catch
                { }

                txtmob2cc.Text = dt.Rows[0]["MobileCc2"].ToString();
                txtmob2.Text = dt.Rows[0]["Mobile2"].ToString();


                try
                {
                    DateTime dob = DateTime.Parse(dt.Rows[0]["DOB"].ToString());
                    drpbday.SelectedItem.Text = dob.Day.ToString();
                    drpbmonth.SelectedItem.Text = dob.ToString("MMMM");
                    //drpbyear.SelectedItem.Text = dob.Year.ToString();
                }
                catch { }

                //string strBg=dt.Rows[0]["BG"].ToString();
                //if (strBg!="")
                //    drpbg.SelectedItem.Text = dt.Rows[0]["BG"].ToString();
                //else
                //    drpbg.SelectedItem.Text = "Select";

                drpbg.SelectedItem.Text = dt.Rows[0]["BG"].ToString();
                drprhf.SelectedItem.Text = dt.Rows[0]["RHF"].ToString();

                string strDonateBlood = dt.Rows[0]["DonateBlood"].ToString();
                if (strDonateBlood == "No")
                    rbtnDonateBlood.SelectedIndex = 0;
                else
                    rbtnDonateBlood.SelectedIndex = 1;

                txtTRFAmt.Text = dt.Rows[0]["TrfAmt"].ToString();
                lblTRFStatus.Text = dt.Rows[0]["TRF"].ToString();
                try
                {
                    DOJ.DbSelectedDate = dt.Rows[0]["DOJ"].ToString();
                }
                catch { }

                string strImg = dt.Rows[0]["MemberImage"].ToString();
                if (strImg != "")
                {
                    Session["Image"] = strImg;
                    MemImage.Visible = true;
                    MemImage.ImageUrl = "../MemberImages/" + strImg;
                }

                string charterMember = dt.Rows[0]["CharterMember"].ToString();
                if (charterMember == "No")
                {
                    rbtnCharterMem.SelectedIndex = 0;
                }
                if (charterMember == "Yes")
                {
                    rbtnCharterMem.SelectedIndex = 1;
                }

                string pb = dt.Rows[0]["ProposedBy"].ToString();
                if (pb != "")
                {
                    DDLproposed.SelectedItem.Text = dt.Rows[0]["ProposedBy"].ToString();
                }


                DDLSuffix.SelectedItem.Text = dt.Rows[0]["Suffix"].ToString();
                txtCallname.Text = dt.Rows[0]["CallName"].ToString();
                txtMemHobbies.Text = dt.Rows[0]["Hobbies"].ToString();

                if (dt.Rows[0]["FoodPreference"].ToString() == "Vegetarian")
                    rdpreferfoodp.SelectedIndex = 0;
                else if (dt.Rows[0]["FoodPreference"].ToString() == "Jain")
                    rdpreferfoodp.SelectedIndex = 1;
                else
                    rdpreferfoodp.SelectedIndex = 2;


                if (dt.Rows[0]["DrinkPreference"].ToString() == "Prefer Alcohol")
                {
                    string strDrinkType = dt.Rows[0]["type_of_drink"].ToString();
                    if (strDrinkType == "Whisky")
                        rbtnPrefAlcohol.SelectedIndex = 0;
                    if (strDrinkType == "Vodka")
                        rbtnPrefAlcohol.SelectedIndex = 1;
                    if (strDrinkType == "Rum")
                        rbtnPrefAlcohol.SelectedIndex = 2;
                    if (strDrinkType == "Red Wine")
                        rbtnPrefAlcohol.SelectedIndex = 3;
                    if (strDrinkType == "White Wine")
                        rbtnPrefAlcohol.SelectedIndex = 4;

                    rdpreferdrink.SelectedIndex = 1;
                    rbtnPrefAlcohol.Visible = true;
                }
                else
                {
                    rdpreferdrink.SelectedIndex = 0;
                    rbtnPrefAlcohol.Visible = false;
                }



                string mornigTime = dt.Rows[0]["MorningBTTC"].ToString();
                string noonTime = dt.Rows[0]["NoonBTTC"].ToString();
                string eveningTime = dt.Rows[0]["EveningBTTC"].ToString();

                if (mornigTime != "")
                {
                    string[] mt = mornigTime.Split('-');
                    string[] mtf = mt[0].Split(':');
                    string[] mtt = mt[1].Split(':');

                    DDLh1.SelectedItem.Text = mtf[0].ToString();
                    DDLm1.SelectedItem.Text = mtf[1].ToString();
                    DDLf1.SelectedItem.Text = mtf[2].ToString();

                    DDLh2.SelectedItem.Text = mtt[0].ToString();
                    DDLm2.SelectedItem.Text = mtt[1].ToString();
                    DDLf2.SelectedItem.Text = mtt[2].ToString();
                }
                if (noonTime != "")
                {
                    string[] nt = noonTime.Split('-');
                    string[] ntf = nt[0].Split(':');
                    string[] ntt = nt[1].Split(':');

                    DDLh3.SelectedItem.Text = ntf[0].ToString();
                    DDLm3.SelectedItem.Text = ntf[1].ToString();
                    DDLf3.SelectedItem.Text = ntf[2].ToString();

                    DDLh4.SelectedItem.Text = ntt[0].ToString();
                    DDLm4.SelectedItem.Text = ntt[1].ToString();
                    DDLf4.SelectedItem.Text = ntt[2].ToString();
                }
                if (eveningTime != "")
                {
                    string[] et = eveningTime.Split('-');
                    string[] etf = et[0].Split(':');
                    string[] ett = et[1].Split(':');

                    DDLh5.SelectedItem.Text = etf[0].ToString();
                    DDLm5.SelectedItem.Text = etf[1].ToString();
                    DDLf5.SelectedItem.Text = etf[2].ToString();

                    DDLh6.SelectedItem.Text = ett[0].ToString();
                    DDLm6.SelectedItem.Text = ett[1].ToString();
                    DDLf6.SelectedItem.Text = ett[2].ToString();
                }




                // Spouse Details

                string strSImg = dt.Rows[0]["SImage"].ToString();
                if (strSImg != "")
                {
                    Session["SImage"] = strSImg;
                    SpouseImage.Visible = true;
                    SpouseImage.ImageUrl = "../MemberImages/" + strSImg;
                }

                txtsname.Text = dt.Rows[0]["SName"].ToString();

                try
                {
                    DateTime sdob = DateTime.Parse(dt.Rows[0]["SDOB"].ToString());
                    DDLSpDOBDay.SelectedItem.Text = sdob.Day.ToString();
                    DDLSpDOBMonth.SelectedItem.Text = sdob.ToString("MMMM");
                   // DDLSpDOBYear.SelectedItem.Text = sdob.Year.ToString();
                }
                catch { }

                DDLsBG.SelectedItem.Text = dt.Rows[0]["SBG"].ToString();
                DDLsRH.SelectedItem.Text = dt.Rows[0]["SRHF"].ToString();

                string strSDonateBlood = dt.Rows[0]["SDonateBlood"].ToString();
                if (strSDonateBlood == "No")
                    rbtnSpouseDonateBlood.SelectedIndex = 0;
                else
                    rbtnSpouseDonateBlood.SelectedIndex = 1;

                try
                {
                    DateTime anni = DateTime.Parse(dt.Rows[0]["Anniversary"].ToString());
                    drannivday.SelectedItem.Text = anni.Day.ToString();
                    drannivmonth.SelectedItem.Text = anni.ToString("MMMM");
                   // drannivyear.SelectedItem.Text = anni.Year.ToString();
                }
                catch { }

                txtSmobileCc.Text = dt.Rows[0]["SMobileCc"].ToString();
                txtSmobile.Text = dt.Rows[0]["SMobile"].ToString();
                txtSEmail.Text = dt.Rows[0]["SEmailId"].ToString();
                txtShobbies.Text = dt.Rows[0]["SHobbies"].ToString();

                if (dt.Rows[0]["SFoodPreference"].ToString() == "Vegetarian")
                    rdpreferfoods.SelectedIndex = 0;
                else if (dt.Rows[0]["SFoodPreference"].ToString() == "Jain")
                    rdpreferfoods.SelectedIndex = 1;
                else
                    rdpreferfoods.SelectedIndex = 2;


                if (dt.Rows[0]["SDrinkPreference"].ToString() == "Prefer Alcohol")
                {
                    string strDrinkType = dt.Rows[0]["spouse_type_of_drink"].ToString();
                    if (strDrinkType == "Whisky")
                        rbtnSpousePreferAlcohol.SelectedIndex = 0;
                    if (strDrinkType == "Vodka")
                        rbtnSpousePreferAlcohol.SelectedIndex = 1;
                    if (strDrinkType == "Rum")
                        rbtnSpousePreferAlcohol.SelectedIndex = 2;
                    if (strDrinkType == "Red Wine")
                        rbtnSpousePreferAlcohol.SelectedIndex = 3;
                    if (strDrinkType == "White Wine")
                        rbtnSpousePreferAlcohol.SelectedIndex = 4;

                    rbtnDrinkPrefSpouse.SelectedIndex = 1;
                    rbtnSpousePreferAlcohol.Visible = true;
                }
                else
                {
                    rbtnDrinkPrefSpouse.SelectedIndex = 0;
                    rbtnSpousePreferAlcohol.Visible = false;
                }

                // Residense address

                txtradd1.Text = dt.Rows[0]["RAdd1"].ToString();
                txtradd2.Text = dt.Rows[0]["RAdd2"].ToString();
                txtrcity.Text = dt.Rows[0]["RCity"].ToString();
                txtrstate.Text = dt.Rows[0]["RState"].ToString();
                txtrcountry.Text = dt.Rows[0]["RCountry"].ToString();

                //txtRFax1.Text = dt.Rows[0]["RFax"].ToString();
                string[] rfax = dt.Rows[0]["RFax"].ToString().Split('-');
                try
                {
                    txtRFaxCC1.Text = rfax[0];
                    txtRFaxAC1.Text = rfax[1];
                    txtRFax1.Text = rfax[2];
                }
                catch { }

                try
                {
                    txtRPhCC1.Text = dt.Rows[0]["RPhoneCc1"].ToString();
                    txtRPhAC1.Text = dt.Rows[0]["RPhoneAc1"].ToString();
                    txtRPh1.Text = dt.Rows[0]["RPhone1"].ToString();
                }
                catch
                {
                    string[] rPhone1 = dt.Rows[0]["RPhone1"].ToString().Split('-');
                    try
                    {
                        txtRPhCC1.Text = rPhone1[0];
                        txtRPhAC1.Text = rPhone1[1];
                        txtRPh1.Text = rPhone1[2];
                    }
                    catch { }
                }

                try
                {

                    txtRPhCC2.Text = dt.Rows[0]["RPhoneCc2"].ToString();
                    txtRPhAC2.Text = dt.Rows[0]["RPhoneAc2"].ToString();
                    txtRPh2.Text = dt.Rows[0]["RPhone2"].ToString();
                }
                catch
                { }
               

                txtrpin.Text = dt.Rows[0]["RPin"].ToString();

                // Office Details

                txtcompany.Text = dt.Rows[0]["CompanyName"].ToString();
                txtdesign.Text = dt.Rows[0]["CompanyDesignation"].ToString();
                txtcadd1.Text = dt.Rows[0]["OAdd1"].ToString();
                txtcadd2.Text = dt.Rows[0]["OAdd2"].ToString();
                txtcompcity.Text = dt.Rows[0]["OCity"].ToString();
                txtcpin.Text = dt.Rows[0]["OPin"].ToString();
                txtcstate.Text = dt.Rows[0]["OState"].ToString();
                txtccountry.Text = dt.Rows[0]["OCountry"].ToString();

                try
                {
                    txtBPhCC1.Text = dt.Rows[0]["OPhoneCc1"].ToString();
                    txtBPhAC1.Text = dt.Rows[0]["OPhoneAc1"].ToString();
                    txtBPh1.Text = dt.Rows[0]["OPhone1"].ToString();
}
                catch
                {
                    string[] oPhone1 = dt.Rows[0]["OPhone1"].ToString().Split('-');
                    try
                    {
                        txtBPhCC1.Text = oPhone1[0];
                        txtBPhAC1.Text = oPhone1[1];
                        txtBPh1.Text = oPhone1[2];
                    }
                    catch { }
                }

                try
                {
                    txtBPhCC2.Text = dt.Rows[0]["OPhoneCc2"].ToString();
                    txtBPhAC2.Text = dt.Rows[0]["OPhoneAc2"].ToString();
                    txtBPh2.Text = dt.Rows[0]["OPhone2"].ToString();

                    txtBFaxCC1.Text = dt.Rows[0]["OFaxCc"].ToString();
                    txtBFaxAC1.Text = dt.Rows[0]["OFaxAc"].ToString();
                    txtBFax1.Text = dt.Rows[0]["OFax"].ToString();
                }
                catch
                { }
                



                txtbemail.Text = dt.Rows[0]["OMail"].ToString();
                txtwebsite.Text = dt.Rows[0]["Website"].ToString();

                // Children Details

                txtc1name.Text = dt.Rows[0]["C1Name"].ToString();

                string gc1 = dt.Rows[0]["GenderC1"].ToString();
                if (gc1 == "Male")
                    genderC1.SelectedIndex = 0;
                if (gc1 == "Female")
                    genderC1.SelectedIndex = 1;

                if (dt.Rows[0]["C1DOB_D"].ToString() == "") { }
                else
                {
                    DateTime c1dob = DateTime.Parse(dt.Rows[0]["C1DOB_D"].ToString());

                    try
                    {
                        drc1bday.SelectedItem.Text = c1dob.Day.ToString();
                        drc1bmonth.SelectedItem.Text = c1dob.ToString("MMMM");
                        drc1byear.SelectedItem.Text = c1dob.Year.ToString();
                    }
                    catch { }
                }
                txtc2name.Text = dt.Rows[0]["C2Name"].ToString();

                string gc2 = dt.Rows[0]["GenderC2"].ToString();
                if (gc2 == "Male")
                    genderC2.SelectedIndex = 0;
                if (gc2 == "Female")
                    genderC2.SelectedIndex = 1;

                if (dt.Rows[0]["C2DOB_D"].ToString() == "") { }
                else
                {
                    DateTime c2dob = DateTime.Parse(dt.Rows[0]["C2DOB_D"].ToString());

                    try
                    {
                        drc2bday.SelectedItem.Text = c2dob.Day.ToString();
                        drc2bmonth.SelectedItem.Text = c2dob.ToString("MMMM");
                        drc2byear.SelectedItem.Text = c2dob.Year.ToString();
                    }
                    catch { }
                }
                txtc3name.Text = dt.Rows[0]["C3Name"].ToString();

                string gc3 = dt.Rows[0]["GenderC3"].ToString();
                if (gc3 == "Male")
                    genderC3.SelectedIndex = 0;
                if (gc3 == "Female")
                    genderC3.SelectedIndex = 1;

                if (dt.Rows[0]["C3DOB_D"].ToString() == "") { }
                else
                {
                    DateTime c3dob = DateTime.Parse(dt.Rows[0]["C3DOB_D"].ToString());

                    try
                    {
                        drc3bday.SelectedItem.Text = c3dob.Day.ToString();
                        drc3bmonth.SelectedItem.Text = c3dob.ToString("MMMM");
                        drc3bYear.SelectedItem.Text = c3dob.Year.ToString();
                    }
                    catch { }
                }


                // Communication Preferences

                if (dt.Rows[0]["AddressPreference"].ToString() == "Residence")
                    rdprefermail.SelectedIndex = 0;
                else
                    rdprefermail.SelectedIndex = 1;

                if (dt.Rows[0]["FaxPreference"].ToString() == "Residence")
                    rdpreferfax.SelectedIndex = 0;
                else
                    rdpreferfax.SelectedIndex = 1;


                if (dt.Rows[0]["MailPreference"].ToString() == "Personal")
                    rdpreferemail.SelectedIndex = 0;
                else
                    rdpreferemail.SelectedIndex = 1;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Clear();
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
                    UpdateProfile(id);
                }
                else
                {
                    AddNewMember();
                }
            }

            catch (Exception ex)
            {

            }
        }
    }
    private void UpdateProfile(int id)
    {
        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;


        MembersBll obj = new MembersBll();

        obj.Id = id;
        obj.ClubId = Int32.Parse(DDLClubName.SelectedValue.ToString());
        obj.MembershipNo = Int32.Parse(txtmno.Text.Trim().ToString());
        obj.MembershipType = rbtnMtype.SelectedItem.Text;
        obj.CharterMember = rbtnCharterMem.SelectedItem.Text;
        obj.Title = drtitle.SelectedItem.Text;
        obj.FirstName = ToTitleCase(txtfname.Text.Trim());
        obj.MiddleName = ToTitleCase(txtmname.Text.Trim());
        obj.LastName = ToTitleCase(txtlname.Text.Trim());
        obj.CallName = ToTitleCase(txtCallname.Text.Trim());
        obj.Suffix = DDLSuffix.Text.Trim();
        obj.Gender = rbtnGender.SelectedItem.Text.Trim();
        obj.Classification = ToTitleCase(txtclasi.Text.Trim());
        obj.Qualification = ToTitleCase(txtquali.Text.Trim());
        obj.EmailId = txtpemail.Text.Trim().ToLower();
        obj.AltEmailId = txtpemail2.Text.Trim().ToLower();

        obj.MobileNoCc1 = txtmob1cc.Text.Trim();
        obj.MobileNo1 = txtmob1.Text.Trim();
        obj.MobileNoCc2 = txtmob2cc.Text.Trim();
        obj.MobileNo2 = txtmob2.Text.Trim();

        try
        {
            obj.MemberImage = Session["Image"].ToString();
        }
        catch { obj.MemberImage = ""; }
        try
        {
            //obj.Dob = DateTime.Parse(drpbday.SelectedItem.Text.Trim() + "/" + drpbmonth.SelectedItem.Text.Trim() + "/" + drpbyear.SelectedItem.Text.Trim());
            obj.Dob = DateTime.Parse("1900-" + drpbmonth.SelectedItem.Text.Trim() + "-" + drpbday.SelectedItem.Text.Trim());
        }
        catch { obj.Dob = nullDate; }
        if (drpbg.SelectedItem.Text == "Select")
            obj.BloodGroup = "";
        else
            obj.BloodGroup = drpbg.SelectedItem.Text.Trim();

        if (drprhf.SelectedItem.Text == "Select")
            obj.Rhf = "";
        else
            obj.Rhf = drprhf.SelectedItem.Text.Trim();

        obj.DonateBlood = rbtnDonateBlood.SelectedItem.Text.Trim();

        obj.Hobbies = ToTitleCase(txtMemHobbies.Text.Trim());
        try
        {
            obj.TrfAmt = Convert.ToDecimal(txtTRFAmt.Text.Trim());
        }
        catch
        { obj.TrfAmt = 0; }
        obj.TrfStatus = lblTRFStatus.Text.ToString();
        try
        {
            obj.JoiningDate = DateTime.Parse(DOJ.SelectedDate.ToString());
        }
        catch { obj.JoiningDate = nullDate; }

        obj.FoodPreference = rdpreferfoodp.SelectedItem.Text.Trim();

        string strDrinkPref = rdpreferdrink.SelectedItem.Text.Trim();
        if (strDrinkPref == "Prefer Alcohol")
        {
            obj.DrinkPreference = strDrinkPref;
            obj.TypeOfDrink = rbtnPrefAlcohol.SelectedItem.Text.Trim();
        }
        else
        {
            obj.DrinkPreference = strDrinkPref;
            obj.TypeOfDrink = "";
        }

        string pb = DDLproposed.SelectedItem.Text.ToString();
        if (pb == "Select")
        {
            if (chkIfOther.Checked)
            {
                obj.ProposedBy = txtProposedOther.Text.ToString();
            }
            else
            {
                obj.ProposedBy = "";
            }
        }
        else
        {
            obj.ProposedBy = DDLproposed.SelectedItem.Text.ToString();
        }


        string mornigTime = "";
        if (DDLh1.SelectedItem.Text != "HH")
        {
            mornigTime = DDLh1.SelectedItem.Text.Trim().ToString() + ":" + DDLm1.SelectedItem.Text.Trim().ToString() + ":" + DDLf1.SelectedItem.Text.Trim().ToString();
            mornigTime = mornigTime + "-" + DDLh2.SelectedItem.Text.Trim().ToString() + ":" + DDLm2.SelectedItem.Text.Trim().ToString() + ":" + DDLf2.SelectedItem.Text.Trim().ToString();
        }

        obj.MorningBttc = mornigTime;

        string noonTime = "";
        if (DDLh3.SelectedItem.Text != "HH")
        {
            noonTime = DDLh3.SelectedItem.Text.Trim().ToString() + ":" + DDLm3.SelectedItem.Text.Trim().ToString() + ":" + DDLf3.SelectedItem.Text.Trim().ToString();
            noonTime = noonTime + "-" + DDLh4.SelectedItem.Text.Trim().ToString() + ":" + DDLm4.SelectedItem.Text.Trim().ToString() + ":" + DDLf4.SelectedItem.Text.Trim().ToString();
        }
        obj.NoonBttc = noonTime;


        string eveningTime = "";
        if (DDLh5.SelectedItem.Text != "HH")
        {
            eveningTime = DDLh5.SelectedItem.Text.Trim().ToString() + ":" + DDLm5.SelectedItem.Text.Trim().ToString() + ":" + DDLf5.SelectedItem.Text.Trim().ToString();
            eveningTime = eveningTime + "-" + DDLh6.SelectedItem.Text.Trim().ToString() + ":" + DDLm6.SelectedItem.Text.Trim().ToString() + ":" + DDLf6.SelectedItem.Text.Trim().ToString();
        }

        obj.EveningBttc = eveningTime;



        //// Spouse Details

        obj.SFirstName = ToTitleCase(txtsname.Text.Trim());
        try
        {
            //obj.SDob = DateTime.Parse(DDLSpDOBDay.SelectedItem.Text.Trim() + "/" + DDLSpDOBMonth.SelectedItem.Text.Trim() + "/" + DDLSpDOBYear.SelectedItem.Text.Trim());
            obj.SDob = DateTime.Parse("1900-" + DDLSpDOBMonth.SelectedItem.Text.Trim() + "-" + DDLSpDOBDay.SelectedItem.Text.Trim());
        }
        catch { obj.SDob = nullDate; }

        if (DDLsBG.SelectedItem.Text == "Select")
            obj.SBg = "";
        else
            obj.SBg = DDLsBG.SelectedItem.Text.Trim();

        if (DDLsRH.SelectedItem.Text == "Select")
            obj.SRhf = "";
        else
            obj.SRhf = DDLsRH.SelectedItem.Text.Trim();

        obj.SDonateBlood = rbtnDonateBlood.SelectedItem.Text.Trim();
        try
        {
            //obj.Anniversary = DateTime.Parse(drannivday.SelectedItem.Text.Trim() + "/" + drannivmonth.SelectedItem.Text.Trim() + "/" + drannivyear.SelectedItem.Text.Trim());
            obj.Anniversary = DateTime.Parse("1900-" + drannivmonth.SelectedItem.Text.Trim() + "-" + drannivday.SelectedItem.Text.Trim());
        }
        catch { obj.Anniversary = nullDate; }
        obj.SMobileCc = txtSmobileCc.Text.Trim();
        obj.SMobile = txtSmobile.Text.Trim();
        obj.SEmailId = txtSEmail.Text.Trim();
        obj.SHobbies = ToTitleCase(txtShobbies.Text.Trim());
        obj.SMobile = txtSmobile.Text.Trim();
        obj.SFoodPreference = rdpreferfoods.SelectedItem.Text.Trim();

        obj.SDrinkPreference = rbtnDrinkPrefSpouse.SelectedItem.Text.Trim();
        obj.STypeOfDrink = rbtnSpousePreferAlcohol.SelectedItem.Text.Trim();

        string strSDrinkPref = rbtnDrinkPrefSpouse.SelectedItem.Text.Trim();
        obj.SDrinkPreference = strDrinkPref;
        if (strSDrinkPref == "Prefer Alcohol")
        {
            obj.STypeOfDrink = rbtnSpousePreferAlcohol.SelectedItem.Text.Trim();
        }
        else
        {
            obj.STypeOfDrink = "";
        }


        try
        {
            obj.SImage = Session["SImage"].ToString();
        }
        catch { obj.SImage = ""; }

        //// Residence Address

        obj.RAdd1 = ToTitleCase(txtradd1.Text.Trim());
        obj.RAdd2 = ToTitleCase(txtradd2.Text.Trim());
        obj.RCity = ToTitleCase(txtrcity.Text.Trim());
        obj.RPin = txtrpin.Text.Trim();
        obj.RState = ToTitleCase(txtrstate.Text.Trim());
        obj.RCountry = ToTitleCase(txtrcountry.Text.Trim());
        obj.RPhoneCc1 = txtRPhCC1.Text.Trim();
        obj.RPhoneAc1 = txtRPhAC1.Text.Trim();
        obj.RPhone1 = txtRPh1.Text.Trim();

        obj.RPhoneCc2 = txtRPhCC2.Text.Trim();
        obj.RPhoneAc2 = txtRPhAC2.Text.Trim();
        obj.RPhone2 = txtRPh2.Text.Trim();

        obj.RFaxCc = txtRFaxCC1.Text.Trim();
        obj.RFaxAc = txtRFaxAC1.Text.Trim();
        obj.RFax = txtRFax1.Text.Trim();


        //// Company Address

        obj.CompanyName = ToTitleCase(txtcompany.Text.Trim());
        obj.CompanyDesignation = txtdesign.Text.Trim();
        obj.OAdd1 = ToTitleCase(txtcadd1.Text.Trim());
        obj.OAdd2 = ToTitleCase(txtcadd2.Text.Trim());
        obj.OCity = ToTitleCase(txtcompcity.Text.Trim());
        obj.OPin = txtcpin.Text.Trim();
        obj.OState = ToTitleCase(txtcstate.Text.Trim());
        obj.OCountry = ToTitleCase(txtccountry.Text.Trim());
        obj.OPhoneCc1 = txtBPhCC1.Text.Trim();
        obj.OPhoneAc1 = txtBPhAC1.Text.Trim();
        obj.OPhone1 = txtBPh1.Text.Trim();

        obj.OPhoneCc2 = txtBPhCC2.Text.Trim();
        obj.OPhoneAc2 = txtBPhAC2.Text.Trim();
        obj.OPhone2 = txtBPh2.Text.Trim();

        obj.OFaxCc = txtBFaxCC1.Text.Trim();
        obj.OFaxAc = txtBFaxAC1.Text.Trim();
        obj.OFax = txtBFax1.Text.Trim();
        obj.OEmail = txtbemail.Text.Trim().ToLower();
        obj.Website = txtwebsite.Text.Trim().ToLower();


        //// Children Details


        obj.NameC1 = ToTitleCase(txtc1name.Text.Trim());
        if (txtc1name.Text == "")
            obj.GenderC1 = "";
        else
            obj.GenderC1 = genderC1.SelectedItem.Text.Trim();


        try
        {
            obj.DobC1 = DateTime.Parse(drc1bday.SelectedItem.Text.Trim() + "/" + drc1bmonth.SelectedItem.Text.Trim() + "/" + drc1byear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC1 = nullDate; }

        obj.NameC2 = ToTitleCase(txtc2name.Text.Trim());
        if (txtc2name.Text == "")
            obj.GenderC2 = "";
        else
            obj.GenderC2 = genderC2.SelectedItem.Text.Trim();


        try
        {
            obj.DobC2 = DateTime.Parse(drc2bday.SelectedItem.Text.Trim() + "/" + drc2bmonth.SelectedItem.Text.Trim() + "/" + drc2byear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC2 = nullDate; }

        obj.NameC3 = ToTitleCase(txtc3name.Text.Trim());

        if (txtc3name.Text == "")
            obj.GenderC3 = "";
        else
            obj.GenderC3 = genderC3.SelectedItem.Text.Trim();

        try
        {
            obj.DobC3 = DateTime.Parse(drc3bday.SelectedItem.Text.Trim() + "/" + drc3bmonth.SelectedItem.Text.Trim() + "/" + drc3bYear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC3 = nullDate; }


        // Communication Preferences

        obj.MailPrefrence = rdpreferemail.SelectedItem.Text.Trim();
        obj.FaxPrefrence = rdpreferfax.SelectedItem.Text.Trim();
        obj.AddressPrefrence = rdprefermail.SelectedItem.Text.Trim();


        int i = obj.UpdateMember();
        if (i > 0)
        {
            Clear();
            showmsg("Member Details Has Been Updated Successfully !", "view_members.aspx");
        }
    }
    private void AddNewMember()
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;

        string password = GetRandomPasswordUsingGUID(8);

        MembersBll obj = new MembersBll();

        obj.ClubId = Int32.Parse(Session["distClubid"].ToString());
        obj.MembershipNo = Int32.Parse(txtmno.Text.Trim().ToString());
        obj.MembershipType = rbtnMtype.SelectedItem.Text;
        obj.CharterMember = rbtnCharterMem.SelectedItem.Text;
        obj.Title = drtitle.SelectedItem.Text;
        obj.FirstName = ToTitleCase(txtfname.Text.Trim());
        obj.MiddleName = ToTitleCase(txtmname.Text.Trim());
        obj.LastName = ToTitleCase(txtlname.Text.Trim());
        obj.CallName = ToTitleCase(txtCallname.Text.Trim());
        obj.Suffix = DDLSuffix.Text.Trim();
        obj.Gender = rbtnGender.SelectedItem.Text.Trim();
        obj.Classification = ToTitleCase(txtclasi.Text.Trim());
        obj.Qualification = ToTitleCase(txtquali.Text.Trim());
        obj.EmailId = txtpemail.Text.Trim().ToLower();
        obj.AltEmailId = txtpemail2.Text.Trim().ToLower();
        obj.Password = password;

        obj.MobileNoCc1 = txtmob1cc.Text.Trim();
        obj.MobileNo1 = txtmob1.Text.Trim();
        obj.MobileNoCc2 = txtmob2cc.Text.Trim();
        obj.MobileNo2 = txtmob2.Text.Trim();

        try
        {
            obj.MemberImage = Session["Image"].ToString();
        }
        catch { obj.MemberImage = ""; }
        try
        {
            obj.Dob = DateTime.Parse("1900-" + drpbmonth.SelectedItem.Text.Trim() + "-" + drpbday.SelectedItem.Text.Trim());
        }
        catch { obj.Dob = nullDate; }

        if (drpbg.SelectedItem.Text == "Select")
            obj.BloodGroup = "";
        else
            obj.BloodGroup = drpbg.SelectedItem.Text.Trim();

        if (drprhf.SelectedItem.Text == "Select")
            obj.Rhf = "";
        else
            obj.Rhf = drprhf.SelectedItem.Text.Trim();

        obj.DonateBlood = rbtnDonateBlood.SelectedItem.Text.Trim();
        obj.Hobbies = ToTitleCase(txtMemHobbies.Text.Trim());
        try
        {
            obj.TrfAmt = Convert.ToDecimal(txtTRFAmt.Text.Trim());
        }
        catch { obj.TrfAmt = 0; }
        obj.TrfStatus = lblTRFStatus.Text.ToString();
        try
        {
            obj.JoiningDate = DateTime.Parse(DOJ.SelectedDate.ToString());
        }
        catch { obj.JoiningDate = nullDate; }

        obj.FoodPreference = rdpreferfoodp.SelectedItem.Text.Trim();

        string strDrinkPref = rdpreferdrink.SelectedItem.Text.Trim();
        if (strDrinkPref == "Prefer Alcohol")
        {
            obj.DrinkPreference = strDrinkPref;
            obj.TypeOfDrink = rbtnPrefAlcohol.SelectedItem.Text.Trim();
        }
        else
        {
            obj.DrinkPreference = strDrinkPref;
            obj.TypeOfDrink = "";
        }

        string pb = DDLproposed.SelectedItem.Text.ToString();
        if (pb == "Select")
        {
            if (chkIfOther.Checked)
            {
                obj.ProposedBy = txtProposedOther.Text.ToString();
            }
            else
            {
                obj.ProposedBy = "";
            }
        }
        else
        {
            obj.ProposedBy = DDLproposed.SelectedItem.Text.ToString();
        }


        string mornigTime = "";
        if (DDLh1.SelectedItem.Text != "HH")
        {
            mornigTime = DDLh1.SelectedItem.Text.Trim().ToString() + ":" + DDLm1.SelectedItem.Text.Trim().ToString() + ":" + DDLf1.SelectedItem.Text.Trim().ToString();
            mornigTime = mornigTime + "-" + DDLh2.SelectedItem.Text.Trim().ToString() + ":" + DDLm2.SelectedItem.Text.Trim().ToString() + ":" + DDLf2.SelectedItem.Text.Trim().ToString();
        }

        obj.MorningBttc = mornigTime;


        string noonTime = "";
        if (DDLh3.SelectedItem.Text != "HH")
        {
            noonTime = DDLh3.SelectedItem.Text.Trim().ToString() + ":" + DDLm3.SelectedItem.Text.Trim().ToString() + ":" + DDLf3.SelectedItem.Text.Trim().ToString();
            noonTime = noonTime + "-" + DDLh4.SelectedItem.Text.Trim().ToString() + ":" + DDLm4.SelectedItem.Text.Trim().ToString() + ":" + DDLf4.SelectedItem.Text.Trim().ToString();
        }
        obj.NoonBttc = noonTime;


        string eveningTime = "";
        if (DDLh5.SelectedItem.Text != "HH")
        {
            eveningTime = DDLh5.SelectedItem.Text.Trim().ToString() + ":" + DDLm5.SelectedItem.Text.Trim().ToString() + ":" + DDLf5.SelectedItem.Text.Trim().ToString();
            eveningTime = eveningTime + "-" + DDLh6.SelectedItem.Text.Trim().ToString() + ":" + DDLm6.SelectedItem.Text.Trim().ToString() + ":" + DDLf6.SelectedItem.Text.Trim().ToString();
        }

        obj.EveningBttc = eveningTime;



        //// Spouse Details

        obj.SFirstName = ToTitleCase(txtsname.Text.Trim());
        try
        {
           // obj.SDob = DateTime.Parse(DDLSpDOBDay.SelectedItem.Text.Trim() + "/" + DDLSpDOBMonth.SelectedItem.Text.Trim() + "/" + DDLSpDOBYear.SelectedItem.Text.Trim());
            obj.SDob = DateTime.Parse("1900-" + DDLSpDOBMonth.SelectedItem.Text.Trim() + "-" + DDLSpDOBDay.SelectedItem.Text.Trim());
        }
        catch { obj.SDob = nullDate; }

        if (DDLsBG.SelectedItem.Text == "Select")
            obj.SBg = "";
        else
            obj.SBg = DDLsBG.SelectedItem.Text.Trim();

        if (DDLsRH.SelectedItem.Text == "Select")
            obj.SRhf = "";
        else
            obj.SRhf = DDLsRH.SelectedItem.Text.Trim();

        obj.SDonateBlood = rbtnDonateBlood.SelectedItem.Text.Trim();
        try
        {
            // obj.Anniversary = DateTime.Parse(drannivday.SelectedItem.Text.Trim() + "/" + drannivmonth.SelectedItem.Text.Trim() + "/" + drannivyear.SelectedItem.Text.Trim());
            obj.Anniversary = DateTime.Parse("1900-" + drannivmonth.SelectedItem.Text.Trim() + "-" + drannivday.SelectedItem.Text.Trim());
        }
        catch { obj.Anniversary = nullDate; }
        obj.SMobileCc = txtSmobileCc.Text.Trim();
        obj.SMobile = txtSmobile.Text.Trim();
        obj.SEmailId = txtSEmail.Text.Trim();
        obj.SHobbies = ToTitleCase(txtShobbies.Text.Trim());
        obj.SMobile = txtSmobile.Text.Trim();
        obj.SFoodPreference = rdpreferfoods.SelectedItem.Text.Trim();

        string strSDrinkPref = rbtnDrinkPrefSpouse.SelectedItem.Text.Trim();
        obj.SDrinkPreference = strDrinkPref;
        if (strSDrinkPref == "Prefer Alcohol")
        {
            obj.STypeOfDrink = rbtnSpousePreferAlcohol.SelectedItem.Text.Trim();
        }
        else
        {
            obj.STypeOfDrink = "";
        }

        try
        {
            obj.SImage = Session["SImage"].ToString();
        }
        catch { obj.SImage = ""; }

        //// Residence Address

        obj.RAdd1 = ToTitleCase(txtradd1.Text.Trim());
        obj.RAdd2 = ToTitleCase(txtradd2.Text.Trim());
        obj.RCity = ToTitleCase(txtrcity.Text.Trim());
        obj.RPin = txtrpin.Text.Trim();
        obj.RState = ToTitleCase(txtrstate.Text.Trim());
        obj.RCountry = ToTitleCase(txtrcountry.Text.Trim());
        obj.RPhoneCc1 = txtRPhCC1.Text.Trim();
        obj.RPhoneAc1 = txtRPhAC1.Text.Trim();
        obj.RPhone1 = txtRPh1.Text.Trim();

        obj.RPhoneCc2 = txtRPhCC2.Text.Trim();
        obj.RPhoneAc2 = txtRPhAC2.Text.Trim();
        obj.RPhone2 = txtRPh2.Text.Trim();

        obj.RFaxCc = txtRFaxCC1.Text.Trim();
        obj.RFaxAc = txtRFaxAC1.Text.Trim();
        obj.RFax = txtRFax1.Text.Trim();


        //// Company Address

        obj.CompanyName = ToTitleCase(txtcompany.Text.Trim());
        obj.CompanyDesignation = txtdesign.Text.Trim();
        obj.OAdd1 = ToTitleCase(txtcadd1.Text.Trim());
        obj.OAdd2 = ToTitleCase(txtcadd2.Text.Trim());
        obj.OCity = ToTitleCase(txtcompcity.Text.Trim());
        obj.OPin = txtcpin.Text.Trim();
        obj.OState = ToTitleCase(txtcstate.Text.Trim());
        obj.OCountry = ToTitleCase(txtccountry.Text.Trim());
        obj.OPhoneCc1 = txtBPhCC1.Text.Trim();
        obj.OPhoneAc1 = txtBPhAC1.Text.Trim();
        obj.OPhone1 = txtBPh1.Text.Trim();

        obj.OPhoneCc2 = txtBPhCC2.Text.Trim();
        obj.OPhoneAc2 = txtBPhAC2.Text.Trim();
        obj.OPhone2 = txtBPh2.Text.Trim();

        obj.OFaxCc = txtBFaxCC1.Text.Trim();
        obj.OFaxAc = txtBFaxAC1.Text.Trim();
        obj.OFax = txtBFax1.Text.Trim();
        obj.OEmail = txtbemail.Text.Trim().ToLower();
        obj.Website = txtwebsite.Text.Trim().ToLower();


        //// Children Details


        obj.NameC1 = ToTitleCase(txtc1name.Text.Trim());
        if (txtc1name.Text == "")
            obj.GenderC1 = "";
        else
            obj.GenderC1 = genderC1.SelectedItem.Text.Trim();


        try
        {
            obj.DobC1 = DateTime.Parse(drc1bday.SelectedItem.Text.Trim() + "/" + drc1bmonth.SelectedItem.Text.Trim() + "/" + drc1byear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC1 = nullDate; }

        obj.NameC2 = ToTitleCase(txtc2name.Text.Trim());
        if (txtc2name.Text == "")
            obj.GenderC2 = "";
        else
            obj.GenderC2 = genderC2.SelectedItem.Text.Trim();


        try
        {
            obj.DobC2 = DateTime.Parse(drc2bday.SelectedItem.Text.Trim() + "/" + drc2bmonth.SelectedItem.Text.Trim() + "/" + drc2byear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC2 = nullDate; }

        obj.NameC3 = ToTitleCase(txtc3name.Text.Trim());

        if (txtc3name.Text == "")
            obj.GenderC3 = "";
        else
            obj.GenderC3 = genderC3.SelectedItem.Text.Trim();

        try
        {
            obj.DobC3 = DateTime.Parse(drc3bday.SelectedItem.Text.Trim() + "/" + drc3bmonth.SelectedItem.Text.Trim() + "/" + drc3bYear.SelectedItem.Text.Trim());
        }
        catch { obj.DobC3 = nullDate; }


        // Communication Preferences

        obj.MailPrefrence = rdpreferemail.SelectedItem.Text.Trim();
        obj.FaxPrefrence = rdpreferfax.SelectedItem.Text.Trim();
        obj.AddressPrefrence = rdprefermail.SelectedItem.Text.Trim();

        obj.Ipaddress = ipaddress;

        int i = obj.AddMember();
        if (i > 0)
        {
            Clear();
            string jv = "<script>alert('Member Details Has Been Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }



        //SqlParameter sqp = new SqlParameter("@mem_id", SqlDbType.Int);
        //sqp.Direction = ParameterDirection.Output;
        //obj.AddParam(sqp);

        //if (obj.ExecuteNonQuery() > 0)
        //{
        //    int memid = int.Parse(sqp.Value.ToString());
        //    //obj.AddParam("@mem_id", ipaddress);
        //    try
        //    {
        //        UpdatePositionHeld(memid);
        //        // UpdateAwardWon();
        //    }
        //    catch { }

        //    clear();
        //    string jv = "<script>alert('Record Added Successfully');</script>";
        //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        //}
    }
    private void BindTitle()
    {
        try
        {
            string[] strTitle = { "Dr.", "Miss", "Mrs.", "Mr.", "Ms.", "Prof." };

            for (int i = 0; i <= strTitle.Length - 1; i++)
            {
                ListItem item = new ListItem();
                item.Text = strTitle[i];
                item.Value = strTitle[i];
                drtitle.Items.Add(item);
            }
            // drtitle.Items.Insert(0, "Select");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
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
            DDLh1.Items.Add(s.ToString());
            DDLh2.Items.Add(s.ToString());
            DDLh3.Items.Add(s.ToString());
            DDLh4.Items.Add(s.ToString());
            DDLh5.Items.Add(s.ToString());
            DDLh6.Items.Add(s.ToString());
        }

        DDLh1.Items.Insert(0, "HH");
        DDLh1.Items.Insert(1, "00");

        DDLh2.Items.Insert(0, "HH");
        DDLh2.Items.Insert(1, "00");

        DDLh3.Items.Insert(0, "HH");
        DDLh3.Items.Insert(1, "00");

        DDLh4.Items.Insert(0, "HH");
        DDLh4.Items.Insert(1, "00");

        DDLh5.Items.Insert(0, "HH");
        DDLh5.Items.Insert(1, "00");

        DDLh6.Items.Insert(0, "HH");
        DDLh6.Items.Insert(1, "00");

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
            DDLm1.Items.Add(s.ToString());
            DDLm2.Items.Add(s.ToString());
            DDLm3.Items.Add(s.ToString());
            DDLm4.Items.Add(s.ToString());
            DDLm5.Items.Add(s.ToString());
            DDLm6.Items.Add(s.ToString());
        }
        DDLm1.Items.Insert(0, "MM");
        DDLm1.Items.Insert(1, "00");

        DDLm2.Items.Insert(0, "MM");
        DDLm2.Items.Insert(1, "00");

        DDLm3.Items.Insert(0, "MM");
        DDLm3.Items.Insert(1, "00");

        DDLm4.Items.Insert(0, "MM");
        DDLm4.Items.Insert(1, "00");

        DDLm5.Items.Insert(0, "MM");
        DDLm5.Items.Insert(1, "00");

        DDLm6.Items.Insert(0, "MM");
        DDLm6.Items.Insert(1, "00");
    }
    private void daybind()
    {
        string s = "";
        try
        {
            for (int i = 1; i <= 31; i++)
            {
                if (i <= 9)
                {
                    s = "0" + i;
                }
                else
                {
                    s = i.ToString();
                }
                drpbday.Items.Add(s.ToString());
                drannivday.Items.Add(s.ToString());
                DDLSpDOBDay.Items.Add(s.ToString());
                drc1bday.Items.Add(s.ToString());
                drc2bday.Items.Add(s.ToString());
                drc3bday.Items.Add(s.ToString());

            }
            drpbday.Items.Insert(0, "Day");
            drannivday.Items.Insert(0, "Day");
            DDLSpDOBDay.Items.Insert(0, "Day");
            drc1bday.Items.Insert(0, "Day");
            drc2bday.Items.Insert(0, "Day");
            drc3bday.Items.Insert(0, "Day");
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void monthbind()
    {
        try
        {

            for (int i = 1; i <= 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                item.Value = i.ToString();
                drpbmonth.Items.Add(item);
                drannivmonth.Items.Add(item);
                DDLSpDOBMonth.Items.Add(item);
                drc1bmonth.Items.Add(item);
                drc2bmonth.Items.Add(item);
                drc3bmonth.Items.Add(item);
            }
            drpbmonth.Items.Insert(0, "Month");
            drannivmonth.Items.Insert(0, "Month");
            DDLSpDOBMonth.Items.Insert(0, "Month");
            drc1bmonth.Items.Insert(0, "Month");
            drc2bmonth.Items.Insert(0, "Month");
            drc3bmonth.Items.Insert(0, "Month");
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void yearbind()
    {
        try
        {
            for (Int32 i = 1930; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                //drpbyear.Items.Add(i.ToString());
                //drannivyear.Items.Add(i.ToString());
                //DDLSpDOBYear.Items.Add(i.ToString());
                drc1byear.Items.Add(i.ToString());
                drc2byear.Items.Add(i.ToString());
                drc3bYear.Items.Add(i.ToString());
            }
            //drpbyear.Items.Insert(0, "Year");
            //drannivyear.Items.Insert(0, "Year");
            //DDLSpDOBYear.Items.Insert(0, "Year");
            drc1byear.Items.Insert(0, "Year");
            drc2byear.Items.Insert(0, "Year");
            drc3bYear.Items.Insert(0, "Year");
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    public string GetRandomPasswordUsingGUID(int length)
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);

        if (length <= 0 || length > guidResult.Length)
        {
            throw new ArgumentException("Length must be between 1 and " + guidResult.Length);
        }
        else
        {
            return guidResult.Substring(0, 8);
        }
    }
    public void Clear()
    {
        Session["SImage"] = null;
        Session["Image"] = null;

        txtbemail.Text = "";
        txtBFax1.Text = "";
        txtBFaxAC1.Text = "";
        txtBFaxCC1.Text = "";
        txtBPh1.Text = "";
        txtBPh2.Text = "";
        txtBPhAC1.Text = "";
        txtBPhAC2.Text = "";
        txtBPhCC1.Text = "";
        txtBPhCC2.Text = "";
        txtc1name.Text = "";
        txtc2name.Text = "";
        txtc3name.Text = "";
        txtcadd1.Text = "";
        txtcadd2.Text = "";
        txtCallname.Text = "";
        txtccountry.Text = "";
        txtclasi.Text = "";
        txtcompany.Text = "";
        txtcompcity.Text = "";
        txtcp.Text = "";
        txtcpin.Text = "";
        txtcstate.Text = "";
        txtdesign.Text = "";
        txtfname.Text = "";
        txtlname.Text = "";
        txtMemHobbies.Text = "";
        txtmname.Text = "";
        txtmno.Text = "";
        txtmob1.Text = "";
        txtmob1.Text = "";
        txtmob1cc.Text = "";
        txtmob2.Text = "";
        txtmob2cc.Text = "";
        txtnewp.Text = "";
        txtnewp.Text = "";
        txtnewp.Text = "";
        txtoldp.Text = "";
        txtpemail.Text = "";
        txtpemail2.Text = "";
        txtProposedOther.Text = "";
        txtquali.Text = "";
        txtradd1.Text = "";
        txtradd2.Text = "";
        txtrcity.Text = "";
        txtrcountry.Text = "";
        txtRFax1.Text = "";
        txtRFaxAC1.Text = "";
        txtRFaxCC1.Text = "";
        txtRPh1.Text = "";
        txtRPh2.Text = "";
        txtRPhAC1.Text = "";
        txtRPhAC2.Text = "";
        txtRPhCC1.Text = "";
        txtRPhCC2.Text = "";
        txtrpin.Text = "";
        txtrstate.Text = "";
        txtSEmail.Text = "";
        txtShobbies.Text = "";
        txtSmobile.Text = "";
        txtSmobileCc.Text = "";
        txtsname.Text = "";
        txtTRFAmt.Text = "";
        txtwebsite.Text = "";


        DDLClubName.ClearSelection();
        drtitle.ClearSelection();
        drpbday.ClearSelection();
        drpbmonth.ClearSelection();
        //drpbyear.ClearSelection();
        drpbg.ClearSelection();
        drprhf.ClearSelection();
        DDLSpDOBDay.ClearSelection();
        DDLSpDOBMonth.ClearSelection();
        //DDLSpDOBYear.ClearSelection();
        drannivday.ClearSelection();
        drannivmonth.ClearSelection();
       // drannivyear.ClearSelection();
        txtpemail2.Text = "";
        txtTRFAmt.Text = "";
        lblTRFStatus.Text = "";
        DOJ.Clear();

        DDLsBG.ClearSelection();
        DDLsRH.ClearSelection();
        // DDLDisttDesig.ClearSelection();

        //RadGrid1.Visible = false;       
        chkIfOther.Checked = false;
        TrProposed.Visible = false;

        rdpreferfoodp.SelectedIndex = 0;
        rdpreferdrink.SelectedIndex = 0;
        rdpreferfoods.SelectedIndex = 0;
        rbtnSpousePreferAlcohol.SelectedIndex = 0;

        lblCharterDate.Text = "";
        lblClubNo.Text = "";
        lblGPS.Text = "";
        lblMeetingDay.Text = "";
        lblMeetingTime.Text = "";
        lblTRFStatus.Text = "";
        lblVenue.Text = "";

        rbtnCharterMem.SelectedIndex = 0;
        rbtnGender.SelectedIndex = 0;
        rbtnMtype.SelectedIndex = 0;
        rbtnSpousePreferAlcohol.SelectedIndex = 0;
        rdpreferdrink.SelectedIndex = 0;
        rdpreferemail.SelectedIndex = 0;
        rdpreferfax.SelectedIndex = 0;
        rdpreferfoodp.SelectedIndex = 0;
        rdpreferfoods.SelectedIndex = 0;
        rdprefermail.SelectedIndex = 0;

        //DDLAwardName.SelectedIndex = 0;
        //DDLAwardWon.SelectedIndex = 0;
        //DDLAwardYear.SelectedIndex = 0;
        //DDLClubName.SelectedIndex = 0;
        //DDLDisttDesig.SelectedIndex = 0;
        DDLf1.SelectedIndex = 0;
        DDLf2.SelectedIndex = 0;
        DDLf3.SelectedIndex = 0;
        DDLf4.SelectedIndex = 0;
        DDLf5.SelectedIndex = 0;
        DDLf6.SelectedIndex = 0;
        DDLh1.SelectedIndex = 0;
        DDLh2.SelectedIndex = 0;
        DDLh3.SelectedIndex = 0;
        DDLh4.SelectedIndex = 0;
        DDLh5.SelectedIndex = 0;
        DDLh6.SelectedIndex = 0;
        DDLm1.SelectedIndex = 0;
        DDLm2.SelectedIndex = 0;
        DDLm3.SelectedIndex = 0;
        DDLm4.SelectedIndex = 0;
        DDLm5.SelectedIndex = 0;
        DDLm6.SelectedIndex = 0;
        //DDLPHeld.SelectedIndex = 0;
        //DDLPHYear.SelectedIndex = 0;
        //DDLPosition.SelectedIndex = 0;
        DDLproposed.SelectedIndex = 0;
        DDLsBG.SelectedIndex = 0;
        DDLSpDOBDay.SelectedIndex = 0;
        DDLSpDOBMonth.SelectedIndex = 0;
        //DDLSpDOBYear.SelectedIndex = 0;
        DDLsRH.SelectedIndex = 0;
        DDLSuffix.SelectedIndex = 0;


        txtc1name.Text = "";
        txtc2name.Text = "";
        txtc3name.Text = "";

        drc1bday.SelectedIndex = 0;
        drc1bmonth.SelectedIndex = 0;
        drc1byear.SelectedIndex = 0;

        drc2bday.SelectedIndex = 0;
        drc2bmonth.SelectedIndex = 0;
        drc2byear.SelectedIndex = 0;

        drc3bday.SelectedIndex = 0;
        drc3bmonth.SelectedIndex = 0;
        drc3bYear.SelectedIndex = 0;

        genderC1.SelectedIndex = 0;
        genderC2.SelectedIndex = 0;
        genderC3.SelectedIndex = 0;


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
            int id = int.Parse(DDLClubName.SelectedValue.ToString());
            GetDistrictClubDetails(id);
            GetClubDetails(id);
            BindMembers(id);
        }
        catch { }
    }
    private void GetDistrictClubDetails(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetClubById";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            Session["distClubid"] = id.ToString();
            Session["clubno"] = dt.Rows[0]["ri_club_no"].ToString();
            Session["clubname"] = dt.Rows[0]["club_name"].ToString();
            Session["charterdate"] = dt.Rows[0]["charter_date"].ToString();
            Session["meetingday"] = dt.Rows[0]["meeting_day"].ToString();
            Session["meetingtime"] = dt.Rows[0]["meeting_time"].ToString();
            Session["venue"] = dt.Rows[0]["venue1"].ToString() + " " + dt.Rows[0]["venue2"].ToString() + " " + dt.Rows[0]["city"].ToString();
        }
    }
    private void GetClubDetails(int id)
    {

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetClubById";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            Session["distClubid"] = id.ToString();
            lblClubNo.Text = dt.Rows[0]["ri_club_no"].ToString();

            //try
            //{
            //    string[] cdt = dt.Rows[0]["charter_date"].ToString().Split('/');
            //    lblCharterDate.Text = cdt[0] + " " + cdt[1] + ", " + cdt[2];
            //}
            //catch { }

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
        }


        //lblClubNo.Text = Session["clubno"].ToString();
        ////lblClubName.Text = Session["clubname"].ToString();
        //lblCharterDate.Text = Session["charterdate"].ToString();
        //lblMeetingDay.Text = Session["meetingday"].ToString();
        //lblMeetingTime.Text = Session["meetingtime"].ToString();
        //lblVenue.Text = Session["venue"].ToString();
    }
    protected void txtTRFAmt_TextChanged(object sender, EventArgs e)
    {
        try
        {
            float amt = float.Parse(txtTRFAmt.Text.Trim().ToString());

            if (amt <= 0 || amt == 0.0)
            {
                lblTRFStatus.Text = "NILL";
            }
            if (amt >= 1 && amt <= 999.99)
            {
                lblTRFStatus.Text = "TRFSM";
            }
            if (amt >= 1000 && amt <= 1999.99)
            {
                lblTRFStatus.Text = "PHF";
            }
            if (amt >= 2000 && amt <= 2999.99)
            {
                lblTRFStatus.Text = "PHF + 1";
            }
            if (amt >= 3000 && amt <= 3999.99)
            {
                lblTRFStatus.Text = "PHF + 2";
            }
            if (amt >= 4000 && amt <= 4999.99)
            {
                lblTRFStatus.Text = "PHF + 3";
            }
            if (amt >= 5000 && amt <= 5999.99)
            {
                lblTRFStatus.Text = "PHF + 4";
            }
            if (amt >= 6000 && amt <= 6999.99)
            {
                lblTRFStatus.Text = "PHF + 5";
            }
            if (amt >= 7000 && amt <= 7999.99)
            {
                lblTRFStatus.Text = "PHF + 6";
            }
            if (amt >= 8000 && amt <= 8999.99)
            {
                lblTRFStatus.Text = "PHF + 7";
            }
            if (amt >= 9000 && amt <= 9999.99)
            {
                lblTRFStatus.Text = "PHF + 8";
            }
            if (amt >= 10000)
            {
                lblTRFStatus.Text = "MD";
            }
        }
        catch { }
    }
    private string MakePassword(int length)
    {
        Random ran = new Random(DateTime.Now.Second);
        char[] password = new char[length];

        for (int i = 0; i < length; i++)
        {
            int[] n = { ran.Next(48, 57), ran.Next(65, 90), ran.Next(97, 122) };
            int picker = ran.Next(0, 3);
            if (picker == 3)//if i make the maxvalue 2 it "never" appears... dunno whats going on there 
                picker = 2;
            password[i] = (char)n[picker];
        }

        return new string(password);
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string email = "";
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AccessMemberPassword";
            obj.AddParam("@oldpass", txtoldp.Text.Trim());

            email = txtpemail.Text.Trim();
            obj.AddParam("@emailid", email);

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count == 0)
            {
                //show("Wrong old password!");
                string jv = "<script>alert('Wrong old password!');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                Clear();
            }
            else
            {
                if (dt.Rows[0]["Password"].ToString() == txtoldp.Text.Trim())
                {
                    DBconnection con = new DBconnection();
                    con.SetCommandQry = "update club_members_tbl set Password='" + txtnewp.Text.Trim() + "' where EmailId='" + email + "'";
                    if (con.ExecuteNonQuery() > 0)
                    {
                        txtoldp.Text = txtnewp.Text;
                        txtnewp.Text = "";
                        txtcp.Text = "";

                        // lblMsg.Text = "Your password has been changed";
                        string jv = "<script>alert('Your password has been changed succeessfully!');</script>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    }
                    else { }
                }
                else
                {
                    //show("Wrong Password");
                    string jv = "<script>alert('Wrong Password!');</script>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    clearfield();
                }
            }
        }
    }
    public void clearfield()
    {
        txtoldp.Text = "";
        txtnewp.Text = "";
        txtcp.Text = "";
        txtoldp.Focus();
        //lblMsg.Text = "";
    }
    protected void btnCreatePass_Click(object sender, EventArgs e)
    {
        string pass = MakePassword(8);
        txtnewp.Text = pass;
        txtcp.Text = pass;
    }
    protected void CVRImemNo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVRImemNo.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select MembershipNo from club_members_tbl where MembershipNo='" + txtmno.Text.Trim().ToString() + "'";
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
    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }
    protected void CVEmailid_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVEmailid.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select emailid from club_members_tbl where emailid='" + txtpemail.Text.Trim().ToString() + "'";
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

    //protected void CVMember_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Request.QueryString["id"] != null)
    //    {
    //        CVMember.Enabled = false;
    //    }
    //    else
    //    {
    //        try
    //        {
    //            DBconnection obj = new DBconnection();
    //            obj.SetCommandQry = "select emailid from district3140_members_tbl where fname='" + txtfname.Text.Trim().ToString() + "' and lname='" + txtlname.Text.Trim().ToString() + "' and emailid='" + txtpemail.Text.Trim().ToString() + "'";

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
    //protected void MemImg_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    try
    //    {
    //        if (FileUpload1.HasFile)
    //        {
    //            int fileSize = FileUpload1.PostedFile.ContentLength;
    //            if (fileSize > 512000)
    //            {
    //                args.IsValid = false;
    //            }
    //            else
    //            {
    //                args.IsValid = true;
    //            }
    //        }
    //    }
    //    catch
    //    {
    //        args.IsValid = true;
    //    }
    //}
    //protected void CVSpouseImg_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    try
    //    {
    //        if (FileUpload2.HasFile)
    //        {
    //            int fileSize = FileUpload2.PostedFile.ContentLength;
    //            if (fileSize > 512000)
    //            {
    //                args.IsValid = false;
    //            }
    //            else
    //            {
    //                args.IsValid = true;
    //            }
    //        }
    //    }
    //    catch
    //    {
    //        args.IsValid = true;
    //    }
    //}
    protected void chkIfOther_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIfOther.Checked == true)
        {
            TrProposed.Visible = true;
            DDLproposed.SelectedIndex = 0;
            txtProposedOther.Text = "";
        }
        else
        {
            TrProposed.Visible = false;
        }
    }
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "MemberImages";

            string fileName, strFileName = "";
            string ext = "";

            strFileName = txtfname.Text.Trim().Replace(" ", "").ToString() + txtlname.Text.Trim().Replace(" ", "").ToString() + "_" + DDLClubName.SelectedItem.Text.Trim().Replace(" ", "").ToString();

            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            //fileName = fileName.Substring(0, fileName.LastIndexOf("."));
            fileName = strFileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["Image"] = fileName;
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
            string strPath = "MemberImages";

            string fileName, strFileName = "";
            string ext = "";

            strFileName = txtsname.Text.Trim().Replace(" ", "").ToString()+"_" + DDLClubName.SelectedItem.Text.Trim().Replace(" ", "").ToString();

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
            Session["SImage"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void rdpreferdrink_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdpreferdrink.SelectedItem.Text == "Prefer Alcohol")
            rbtnPrefAlcohol.Visible = true;
        else
            rbtnPrefAlcohol.Visible = false;
    }
    protected void rbtnDrinkPrefSpouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnDrinkPrefSpouse.SelectedItem.Text == "Prefer Alcohol")
            rbtnSpousePreferAlcohol.Visible = true;
        else
            rbtnSpousePreferAlcohol.Visible = false;
    }
    protected void btnPHAdd_Click(object sender, EventArgs e)
    {
        try
        {
            int memId = int.Parse(Request.QueryString["id"].ToString());

            DBconnection obj = new DBconnection();
           
            obj.SetCommandSP = "z_AddPositionHeld";
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@member_id", memId);
            obj.AddParam("@years", DDLPHYear.SelectedItem.Text.Trim());
            obj.AddParam("@position_held_on", DDLPHeld.SelectedItem.Text.Trim());
            obj.AddParam("@avenue", DDLAvenue.SelectedItem.Text.ToString().Trim());
            obj.AddParam("@position", DDLPosition.SelectedItem.Text.ToString().Trim());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                DDLPHeld.ClearSelection();
                DDLPHYear.ClearSelection();
                DDLPosition.ClearSelection();
                BindGrid(memId);
            }
        }
        catch { }
    }
    private void BindGrid(int memid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * FROM [View_PositionsHeld] where member_id='" + memid + "' order by years desc ";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }

        else
        {
            RadGrid1.Visible = false;
        }
    }
    protected void btnAward_Click(object sender, EventArgs e)
    {
        try
        {
           // int memId = 0;

            int memId = int.Parse(Request.QueryString["id"].ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddAwardsWinner";
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@member_id", memId);           
            obj.AddParam("@years", DDLAwardYear.SelectedItem.Text.Trim());
            //obj.AddParam("@award_id", int.Parse(DDLAwardName.SelectedValue.ToString()));
            obj.AddParam("@award_won", DDLAwardWon.SelectedItem.Text.Trim());
            obj.AddParam("@award_name", DDLAwardName.SelectedItem.Text.Trim());
                     


            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                DDLAwardWon.ClearSelection();
                DDLAwardYear.ClearSelection();
                DDLAwardName.ClearSelection();
                BindGrid2(memId);
            }
        }
        catch { }
    }
    private void BindGrid2(int memId)
    {
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "select  ROW_NUMBER () OVER (ORDER BY [id] asc) AS RowNumber, * FROM View_AwardWonMem where temp_id='0' order by id asc";
        obj.SetCommandQry = "select  * FROM View_AwardsWinners where member_id=" + memId;
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadGrid2.Visible = true;
            RadGrid2.DataSource = dt;
            RadGrid2.DataBind();
        }

        else
        {
            RadGrid2.Visible = false;
        }
    }
    private void UpdatePositionHeld(int mem_id)
    {
        if (Request.QueryString["id"] != null)
        {
            try
            {
                mem_id = int.Parse(Request.QueryString["id"].ToString().Trim());
            }
            catch
            {
            }
        }

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateTempPH";
        obj.AddParam("@Member_id", mem_id);

        int exe = obj.ExecuteNonQuery();

        if (exe > 0)
        {
        }
    }
    private void UpdateAwardWon()
    {
        int mem_id = int.Parse(Request.QueryString["pid"].ToString().Trim());
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateTempAwardWon";
        obj.AddParam("@mem_id", mem_id);

        int exe = obj.ExecuteNonQuery();

        if (exe > 0)
        {
        }
    }
    protected void DDLPHYear_SelectedIndexChanged(object sender, EventArgs e)
    {

        string phin = DDLPHeld.SelectedItem.Text.Trim();
        //if (phin == "Club")
        //{
        //    GetClubDesignation(int.Parse(DDLClubName.SelectedValue.ToString()));
        //}
        if (phin == "District")
        {
            GetDistAvenue(DDLPHYear.SelectedItem.Text.Trim());
        }
        //if (phin == "RI")
        //{
        //    GetRiDesignation();
        //}

    }
    private void GetClubDesignation(int clubId)
    {
       // year = null;
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years is null ORDER BY [designation]";
        obj.SetCommandQry = "select * from dbo.bod_designation_tbl where  DistrictClubId='0' or DistrictClubID ='" + clubId + "' ORDER BY [designation]";


        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLPosition.Items.Clear();
            DDLPosition.DataTextField = "designation";
            DDLPosition.DataValueField = "id";
            DDLPosition.DataSource = dt;
            DDLPosition.DataBind();
            DDLPosition.Items.Insert(0, "Select");
        }

        else
        {
            DDLPosition.Items.Clear();
            DDLPosition.Items.Insert(0, "Select");
        }
    }
    private void GetDistAvenue(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";

        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLAvenue.Items.Clear();
            DDLAvenue.DataTextField = "designation";
            DDLAvenue.DataValueField = "id";
            DDLAvenue.DataSource = dt;
            DDLAvenue.DataBind();
            DDLAvenue.Items.Insert(0, "Select");
        }

        else
        {
            DDLPosition.Items.Clear();
            DDLPosition.Items.Insert(0, "Select");
        }
    }
    private void GetDistDesignation(int avenueId)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_SubDesignations] where desig_id='" + avenueId + "' ORDER BY [sub_designation] ";

        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLPosition.Items.Clear();
            DDLPosition.DataTextField = "sub_designation";
            DDLPosition.DataValueField = "id";
            DDLPosition.DataSource = dt;
            DDLPosition.DataBind();
            DDLPosition.Items.Insert(0, "Select");
        }

        else
        {
            DDLPosition.Items.Clear();
            DDLPosition.Items.Insert(0, "Select");
        }
    }
    private void GetRiDesignation()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [ri_designation_tbl] ORDER BY [designation] ";

        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLPosition.Items.Clear();
            DDLPosition.DataTextField = "designation";
            DDLPosition.DataValueField = "id";
            DDLPosition.DataSource = dt;
            DDLPosition.DataBind();
            DDLPosition.Items.Insert(0, "Select");
        }

        else
        {
            DDLPosition.Items.Clear();
            DDLPosition.Items.Insert(0, "Select");
        }
    }
    private void BindYearForAwardsPositions(int year)
    {
        //try
        //{
        //    DDLPHYear.Items.Clear();
        //    DDLAwardYear.Items.Clear();

        //    for (Int32 i = year; i <= Convert.ToInt32(DateTime.Now.Year); i++)
        //    {
        //        string dt = i + " - " + (i + 1);
        //        DDLPHYear.Items.Add(dt.ToString());
        //        DDLAwardYear.Items.Add(dt.ToString());

        //    }
        //    DDLPHYear.Items.Insert(0, "Select");
        //    DDLAwardYear.Items.Insert(0, "Select");

        //}
        //catch (Exception E)
        //{
        //    Response.Write(E.Message.ToString());
        //}

        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt); i >= 1920; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLPHYear.Items.Add(dtt.ToString());
                DDLAwardYear.Items.Add(dtt.ToString());
            }           

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void DDLPHeld_SelectedIndexChanged(object sender, EventArgs e)
    {        
        DDLPHYear.SelectedIndex = 0;
        DDLPosition.Items.Clear();
        DDLPosition.Items.Insert(0,"Select");
        // DDLPosition.SelectedIndex = 0;
        string strP= DDLPHeld.SelectedItem.Text.Trim().ToString();
        if(strP=="RI")
            GetRiDesignation();
        if (strP == "Club")
            GetClubDesignation(int.Parse(DDLClubName.SelectedValue.ToString()));
    }
    protected void DDLAwardWon_SelectedIndexChanged(object sender, EventArgs e)
    {
        //trAward.Visible = true;
     
        DDLAwardYear.SelectedIndex = 0;
        DDLAwardName.Items.Clear();
        DDLAwardName.Items.Insert(0, "Select");

        string type = DDLAwardWon.SelectedItem.Text.Trim().ToString();
        BindAwardsName(type);
    }
    private void BindAwardsName(string type)
    {
        try
        {
            DBconnection obj = new DBconnection();
            if (type == "Club")
            {
                obj.SetCommandQry = "select id, award_name as name  from club_awards_tbl where DistrictClubID='" + int.Parse(DDLClubName.SelectedValue.ToString()) + "' order by award_name"; // Club Awards
            }
            if (type == "District")
            {
                obj.SetCommandQry = "select award_id as id, award_name as name  from award_master_tbl order by award_name"; // District Awards
            }
            if (type == "RI")
            {
                obj.SetCommandQry = "select * from ri_awards_tbl order by name"; // RI Awards
            }


            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                DDLAwardName.Items.Clear();

                DDLAwardName.DataTextField = "name";
                DDLAwardName.DataValueField = "id";
                DDLAwardName.DataSource = dt;
                DDLAwardName.DataBind();
                DDLAwardName.Items.Insert(0, "Select");
            }

            else
            {
                DDLAwardName.Items.Clear();
                DDLAwardName.Items.Insert(0, "Select");
            }
        }
        catch { }
    }
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeletePositionHeld";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //RadGrid1.Rebind();
                int memid = int.Parse(Request.QueryString["id"].ToString());
                BindGrid(memid);
            }
        }
    }
    protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteAwardsWinner";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                int memId = int.Parse(Request.QueryString["id"].ToString());
                BindGrid2(memId);
            }
        }
    }
    protected void DDLAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        int avenueId = int.Parse(DDLAvenue.SelectedValue.ToString());       
        GetDistDesignation(avenueId);
    }
}
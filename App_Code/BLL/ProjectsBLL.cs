using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ProjectsBLL
/// </summary>
public class ProjectsBLL
{
    public ProjectsBLL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region --- Declared Variables ---


    private string clubName, clubPresident, project_year, project_title, project_type, project_location, project_description, avenue_of_covered,
                   project_chairperson, committee_members, beneficiaries, project_images, partner_club_district_no, partner_club_name, district_grant_no, district_global_no, add1,
                   add2, city, state, country, ph1_cc, ph1_ac, phone1, ph2_cc, ph2_ac, phone2, fax_cc, fax_ac, fax, website, geo_latitude, geo_longitude, direction_project_site, ipaddress = "";

    private string title, fname, mname, lname, designation, emailId, mobile_cc, mobile = ""; // For project contact

    private int project_id, pin = 0;
    public int Project_id { set { project_id = value; } get { return project_id; } }

    public string Title { set { title = value; } get { return title; } }
    public string Fname { set { fname = value; } get { return fname; } }
    public string Mname { set { mname = value; } get { return mname; } }
    public string Lname { set { lname = value; } get { return lname; } }
    public string Designation { set { designation = value; } get { return designation; } }
    public string EmailId { set { emailId = value; } get { return emailId; } }
    public string Mobile { set { mobile = value; } get { return mobile; } }
    public string Mobile_cc { set { mobile_cc = value; } get { return mobile_cc; } }

    private int id, club_id, clubNo = 0;
    private decimal project_cost = 0;
    private DateTime start_date, end_date;
    private bool status = true;

    public int ID { set { id = value; } get { return id; } }
    public int Club_Id { set { club_id = value; } get { return club_id; } }
    public int ClubNo { set { clubNo = value; } get { return clubNo; } }

    public string Project_Year { set { project_year = value; } get { return project_year; } }
    public string ClubName { set { clubName = value; } get { return clubName; } }
    public string ClubPresident { set { clubPresident = value; } get { return clubPresident; } }

    public DateTime Start_Date { set { start_date = value; } get { return start_date; } }
    public DateTime End_Date { set { end_date = value; } get { return end_date; } }

    public string Project_Title { set { project_title = value; } get { return project_title; } }
    public string Project_Type { set { project_type = value; } get { return project_type; } }
    public string Project_Location { set { project_location = value; } get { return project_location; } }
    public string Project_Description { set { project_description = value; } get { return project_description; } }

    public decimal Project_Cost { set { project_cost = value; } get { return project_cost; } }
    public bool Status { set; get; }

    public string Avenue_of_Covered { set { avenue_of_covered = value; } get { return avenue_of_covered; } }

    public string Project_Chairperson { set { project_chairperson = value; } get { return project_chairperson; } }
    public string Committee_Members { set { committee_members = value; } get { return committee_members; } }
    public string Beneficiaries { set { beneficiaries = value; } get { return beneficiaries; } }
    public string Project_Images { set { project_images = value; } get { return project_images; } }

    public string Partner_Club_District_no { set { partner_club_district_no = value; } get { return partner_club_district_no; } }
    public string Partner_Club_Name { set { partner_club_name = value; } get { return partner_club_name; } }
    public string District_Grant_no { set { district_grant_no = value; } get { return district_grant_no; } }
    public string District_Global_no { set { district_global_no = value; } get { return district_global_no; } }

    public string Address1 { set { add1 = value; } get { return add1; } }
    public string Address2 { set { add2 = value; } get { return add2; } }

    public string Ph1_CC { set { ph1_cc = value; } get { return ph1_cc; } }
    public string Ph1_AC { set { ph1_ac = value; } get { return ph1_ac; } }
    public string Phone1 { set { phone1 = value; } get { return phone1; } }

    public string Ph2_CC { set { ph2_cc = value; } get { return ph2_cc; } }
    public string Ph2_AC { set { ph2_ac = value; } get { return ph2_ac; } }
    public string Phone2 { set { phone2 = value; } get { return phone2; } }

    public string Fax_CC { set { fax_cc = value; } get { return fax_cc; } }
    public string Fax_AC { set { fax_ac = value; } get { return fax_ac; } }
    public string Fax { set { fax = value; } get { return fax; } }


    public string City { set { city = value; } get { return city; } }
    public int Pin { set { pin = value; } get { return pin; } }
    public string State { set { state = value; } get { return state; } }
    public string Country { set { country = value; } get { return country; } }

    public string Website { set { website = value; } get { return website; } }
    public string GEO_Latitude { set { geo_latitude = value; } get { return geo_latitude; } }
    public string GEO_longitude { set { geo_longitude = value; } get { return geo_longitude; } }
    public string Direction_Project_Site { set { direction_project_site = value; } get { return direction_project_site; } }

    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    #endregion

    #region --- Add Prtojects ---
    public int AddPrtoject()
    {

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddProject";

        obj.AddParam("@club_id", this.clubNo);
        obj.AddParam("@club_name", this.clubName);
        obj.AddParam("@club_president", this.clubPresident);
        obj.AddParam("@project_year", this.project_year);
        obj.AddParam("@project_title", this.project_title);
        obj.AddParam("@start_date", this.start_date);
        obj.AddParam("@end_date", this.end_date);
        obj.AddParam("@project_type", this.project_type);
        obj.AddParam("@project_location", this.project_location);
        obj.AddParam("@project_description", this.project_description);
        obj.AddParam("@project_cost", this.project_cost);
        obj.AddParam("@avenue_of_covered", this.avenue_of_covered);
        obj.AddParam("@project_chairperson", this.project_chairperson);
        obj.AddParam("@committee_members", this.committee_members);
        obj.AddParam("@beneficiaries", this.beneficiaries);
        obj.AddParam("@project_images", this.project_images);
        obj.AddParam("@partner_club_district_no", this.partner_club_district_no);
        obj.AddParam("@partner_club_name", this.partner_club_name);
        obj.AddParam("@district_grant_no", this.district_grant_no);
        obj.AddParam("@district_global_no", this.district_global_no);
        obj.AddParam("@add1", this.add1);
        obj.AddParam("@add2", this.add2);
        obj.AddParam("@city", this.city);
        obj.AddParam("@pin", this.pin);
        obj.AddParam("@state", this.state);
        obj.AddParam("@country", this.country);
        obj.AddParam("@ph1_cc", this.ph1_cc);
        obj.AddParam("@ph1_ac", this.ph1_ac);
        obj.AddParam("@phone1", this.phone1);
        obj.AddParam("@ph2_cc", this.ph2_cc);
        obj.AddParam("@ph2_ac", this.ph2_ac);
        obj.AddParam("@phone2", this.phone2);
        obj.AddParam("@fax_cc", this.fax_cc);
        obj.AddParam("@fax_ac", this.fax_ac);
        obj.AddParam("@fax", this.fax);
        obj.AddParam("@website", this.website);
        obj.AddParam("@geo_latitude", this.geo_latitude);
        obj.AddParam("@geo_longitude", this.geo_longitude);
        obj.AddParam("@direction_project_site", this.direction_project_site);
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();

        return i;
    }

    #endregion

    #region --- Update Prtojects ---
    public int UpdatePrtoject()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateProject";
        obj.AddParam("@id", this.id);
        obj.AddParam("@club_name", this.clubName);
        obj.AddParam("@club_president", this.clubPresident);
        obj.AddParam("@project_year", this.project_year);
        obj.AddParam("@project_title", this.project_title);
        obj.AddParam("@start_date", this.start_date);
        obj.AddParam("@end_date", this.end_date);
        obj.AddParam("@club_id", this.ClubNo);
        obj.AddParam("@project_type", this.project_type);
        obj.AddParam("@project_location", this.project_location);
        obj.AddParam("@project_description", this.project_description);
        obj.AddParam("@project_cost", this.project_cost);
        obj.AddParam("@avenue_of_covered", this.avenue_of_covered);
        obj.AddParam("@project_chairperson", this.project_chairperson);
        obj.AddParam("@committee_members", this.committee_members);
        obj.AddParam("@beneficiaries", this.beneficiaries);
        obj.AddParam("@project_images", this.project_images);
        obj.AddParam("@partner_club_district_no", this.partner_club_district_no);
        obj.AddParam("@partner_club_name", this.partner_club_name);
        obj.AddParam("@district_grant_no", this.district_grant_no);
        obj.AddParam("@district_global_no", this.district_global_no);
        obj.AddParam("@add1", this.add1);
        obj.AddParam("@add2", this.add2);
        obj.AddParam("@city", this.city);
        obj.AddParam("@pin", this.pin);
        obj.AddParam("@state", this.state);
        obj.AddParam("@country", this.country);
        obj.AddParam("@ph1_cc", this.ph1_cc);
        obj.AddParam("@ph1_ac", this.ph1_ac);
        obj.AddParam("@phone1", this.phone1);
        obj.AddParam("@ph2_cc", this.ph2_cc);
        obj.AddParam("@ph2_ac", this.ph2_ac);
        obj.AddParam("@phone2", this.phone2);
        obj.AddParam("@fax_cc", this.fax_cc);
        obj.AddParam("@fax_ac", this.fax_ac);
        obj.AddParam("@fax", this.fax);
        obj.AddParam("@website", this.website);
        obj.AddParam("@geo_latitude", this.geo_latitude);
        obj.AddParam("@geo_longitude", this.geo_longitude);
        obj.AddParam("@direction_project_site", this.direction_project_site);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get Prtojects ---


    public DataTable GetPrtojects()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetProject";
        obj.AddParam("@id", this.id);

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Delete Prtojects ---
    public int DeletePrtoject()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeletePrtoject";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    public int AddPrtojectContact()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddProjectContact";

        obj.AddParam("@project_id", this.project_id);
        obj.AddParam("@title", this.title);
        obj.AddParam("@fname", this.fname);
        obj.AddParam("@mname", this.mname);
        obj.AddParam("@lname", this.lname);
        obj.AddParam("@designation", this.designation);
        obj.AddParam("@emailId", this.emailId);
        obj.AddParam("@mobile_cc", this.mobile_cc);
        obj.AddParam("@mobile", this.mobile);

        i = obj.ExecuteNonQuery();
        return i;
    }
}
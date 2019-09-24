using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for DistrictClub
/// </summary>
public class DistrictClub
{
	public DistrictClub()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string  clubName, venu1, venu2, landmark, city, pin, state, country, gpsLatitude,meetingDay, sponsoredClub,
        gpsLongitude, locationMap,  iw, rcc, srCitizn, ben, ds, gc, ag, at, website, facebookLink, logo, installationChiefGuest,
        installationVenue, clubTrfStatus, installationTime, flagshipText, flagshipImage;
    private int id, districtNo, riClubNo, phf, trfsm, md, phsm, archKlump;
    private SqlDateTime charterDate, meetingTime, installationDate, ocvDate, ocvTime;

    public int Id { set { id = value; } get { return id; } }
    public int DistrictNo { set { districtNo = value; } get { return districtNo; } }
    public int RiClubNo { set { riClubNo = value; } get { return riClubNo; } }
    public string Iw { set { iw = value; } get { return iw; } }
    public string Rcc { set { rcc = value; } get { return rcc; } }
    public string SrCitizn { set { srCitizn = value; } get { return srCitizn; } }
    public string Ben { set { ben = value; } get { return ben; } }
    public int Phf { set { phf = value; } get { return phf; } }
    public int Trfsm { set { trfsm = value; } get { return trfsm; } }
    public int Md { set { md = value; } get { return md; } }
    public int Phsm { set { phsm = value; } get { return phsm; } }
    public int ArchKlump { set { archKlump = value; } get { return archKlump; } }
    public SqlDateTime CharterDate { set { charterDate = value; } get { return charterDate; } }
    public SqlDateTime MeetingTime { set { meetingTime = value; } get { return meetingTime; } }
    public string MeetingDay { set { meetingDay = value; } get { return meetingDay; } }
    public string ClubName { set { clubName = value; } get { return clubName; } }
    public string Venu1 { set { venu1 = value; } get { return venu1; } }
    public string Venu2 { set { venu2 = value; } get { return venu2; } }
    public string Landmark { set { landmark = value; } get { return landmark; } }
    public string City { set { city = value; } get { return city; } }
    public string Pin { set { pin = value; } get { return pin; } }
    public string State { set { state = value; } get { return state; } }
    public string Country { set { country = value; } get { return country; } }
    public string GpsLatitude { set { gpsLatitude = value; } get { return gpsLatitude; } }
    public string GpsLongitude { set { gpsLongitude = value; } get { return gpsLongitude; } }
    public string Website { set { website = value; } get { return website; } }
    public string FacebookLink { set { facebookLink = value; } get { return facebookLink; } }
    public string LocationMap { set { locationMap = value; } get { return locationMap; } }
    public string Logo { set { logo = value; } get { return logo; } }
    public string DS { set { ds = value; } get { return ds; } }
    public string GC { set { gc = value; } get { return gc; } }
    public string AG { set { ag = value; } get { return ag; } }
    public string AT { set { at = value; } get { return at; } }
    public SqlDateTime OcvDate { set { ocvDate = value; } get { return ocvDate; } }
    public SqlDateTime OcvTime { set { ocvTime = value; } get { return ocvTime; } }
    public SqlDateTime InstallationDate { set { installationDate = value; } get { return installationDate; } }
    public string InstallationTime { set { installationTime = value; } get { return installationTime; } }
    public string InstallationChiefGuest { set { installationChiefGuest = value; } get { return installationChiefGuest; } }
    public string InstallationVenue { set { installationVenue = value; } get { return installationVenue; } }
    public string ClubTrfStatus { set { clubTrfStatus = value; } get { return clubTrfStatus; } }

    public string FlagshipText { set { flagshipText = value; } get { return flagshipText; } }
    public string FlagshipImage { set { flagshipImage = value; } get { return flagshipImage; } }
    public string SponsoredClub { set { sponsoredClub = value; } get { return sponsoredClub; } }
    

    // Add

    //public int AddDistClubData()
    //{
    //    int i = 0;
    //    try
    //    {
    //        DBconnection obj = new DBconnection();
    //        obj.SetCommandSP = "sp_Add_Dist_Club_Data";
    //        obj.AddParam("@club_name", this.club_name);
    //        obj.AddParam("@club_no", this.club_no);
    //        obj.AddParam("@charter_date", this.charter_date);
    //        obj.AddParam("@no_of_members", this.no_of_members);
    //        obj.AddParam("@iw", this.iw);
    //        obj.AddParam("@rcc", this.rcc);
    //        obj.AddParam("@sr_citizn", this.srCitizn);
    //        obj.AddParam("@ben", this.ben);
    //        obj.AddParam("@phf", this.phf);
    //        obj.AddParam("@trfsm", this.trfsm);
    //        obj.AddParam("@md", this.md);
    //        obj.AddParam("@phsm", this.phsm);
    //        obj.AddParam("@meet_days", this.days);
    //        obj.AddParam("@time", this.time);
    //        obj.AddParam("@venue1", this.venu1);
    //        obj.AddParam("@venue2", this.venu2);
    //        obj.AddParam("@venue3", this.venu3);
    //        obj.AddParam("@city", this.city);
    //        obj.AddParam("@pin", this.pin);
    //        obj.AddParam("@state", this.state);
    //        obj.AddParam("@country", this.country);
    //        obj.AddParam("@gps_latitude", this.gps_latitude);
    //        obj.AddParam("@gps_longitude", this.gps_longitude);
    //        obj.AddParam("@location_map", this.location_map);

    //        i = obj.ExecuteNonQuery();

    //    }
    //    catch { }
    //    return i;
    //}
    public int AddClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDist3141Club";

            obj.AddParam("@district_no", this.districtNo);
            obj.AddParam("@club_name", this.clubName);
            obj.AddParam("@ri_club_no", this.riClubNo);
            obj.AddParam("@sponsored_club", this.sponsoredClub);
            obj.AddParam("@charter_date", this.charterDate);                
            obj.AddParam("@meeting_day", this.meetingDay);
            obj.AddParam("@meeting_time", this.meetingTime);
            obj.AddParam("@venue1", this.venu1);
            obj.AddParam("@venue2", this.venu2);
            obj.AddParam("@landmark", this.landmark);
            obj.AddParam("@city", this.city);
            obj.AddParam("@pin", this.pin);
            obj.AddParam("@state", this.state);
            obj.AddParam("@country", this.country);
            obj.AddParam("@gps_latitude", this.gpsLatitude);
            obj.AddParam("@gps_longitude", this.gpsLongitude);
            obj.AddParam("@website", this.website);
            obj.AddParam("@facebook_link", this.facebookLink);    
           
            obj.AddParam("@club_logo", this.logo);
            obj.AddParam("@location_map", this.locationMap);           
           
            obj.AddParam("@phf", this.phf);
            obj.AddParam("@trfsm", this.trfsm);
            obj.AddParam("@md", this.md);
            obj.AddParam("@phsm", this.phsm);
            obj.AddParam("@arch_klump", this.archKlump);

            obj.AddParam("@ds", this.ds);           
            obj.AddParam("@ag", this.ag);
            obj.AddParam("@at", this.at);
            obj.AddParam("@gc", this.gc);

            obj.AddParam("@installation_date", this.installationDate);
            obj.AddParam("@installation_time", this.installationTime);
            obj.AddParam("@installation_chief_guest", this.installationChiefGuest);
            obj.AddParam("@installation_venue", this.installationVenue);

            obj.AddParam("@ocv_date", this.ocvDate);
            obj.AddParam("@ocv_time", this.ocvTime);

            obj.AddParam("@club_trf_status", this.clubTrfStatus);

            obj.AddParam("@flagship_text", this.flagshipText);
            obj.AddParam("@flagship_image", this.flagshipImage);

            //obj.AddParam("@iw", this.iw);
            //obj.AddParam("@rcc", this.rcc);
            //obj.AddParam("@sr_citizn", this.srCitizn);
            //obj.AddParam("@ben", this.ben);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // update
    public int UpdateDistClubData()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_update_dist_club_data";
            obj.AddParam("@id", this.id);

            obj.AddParam("@ds", this.ds);
            obj.AddParam("@gc", this.gc);
            obj.AddParam("@ag", this.ag); 

            obj.AddParam("@phf", this.phf);
            obj.AddParam("@trfsm", this.trfsm);
            obj.AddParam("@md", this.md);
            obj.AddParam("@phsm", this.phsm);

            obj.AddParam("@ocv_date", this.ocvDate);
            obj.AddParam("@installation_date", this.installationDate);
            obj.AddParam("@installation_time", this.installationTime);
            obj.AddParam("@chief_guest", this.installationChiefGuest);
            obj.AddParam("@installation_venue", this.installationVenue);
            obj.AddParam("@club_trf", this.clubTrfStatus);
           
            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    public int UpdateDistrictClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDist3141Club";
            obj.AddParam("@id", this.id);
            obj.AddParam("@district_no", this.districtNo);
            obj.AddParam("@club_name", this.clubName);
            obj.AddParam("@ri_club_no", this.riClubNo);
            obj.AddParam("@sponsored_club", this.sponsoredClub);
            obj.AddParam("@charter_date", this.charterDate);
            obj.AddParam("@meeting_day", this.meetingDay);
            obj.AddParam("@meeting_time", this.meetingTime);
            obj.AddParam("@venue1", this.venu1);
            obj.AddParam("@venue2", this.venu2);
            obj.AddParam("@landmark", this.landmark);
            obj.AddParam("@city", this.city);
            obj.AddParam("@pin", this.pin);
            obj.AddParam("@state", this.state);
            obj.AddParam("@country", this.country);
            obj.AddParam("@gps_latitude", this.gpsLatitude);
            obj.AddParam("@gps_longitude", this.gpsLongitude);
            obj.AddParam("@website", this.website);
            obj.AddParam("@facebook_link", this.facebookLink);
            obj.AddParam("@club_logo", this.logo);
            obj.AddParam("@location_map", this.locationMap);
            obj.AddParam("@phf", this.phf);
            obj.AddParam("@trfsm", this.trfsm);
            obj.AddParam("@md", this.md);
            obj.AddParam("@phsm", this.phsm);
            obj.AddParam("@arch_klump", this.archKlump);
            obj.AddParam("@ds", this.ds);
            obj.AddParam("@ag", this.ag);
            obj.AddParam("@at", this.at);
            obj.AddParam("@gc", this.gc);
            obj.AddParam("@installation_date", this.installationDate);
            obj.AddParam("@installation_time", this.installationTime);
            obj.AddParam("@installation_chief_guest", this.installationChiefGuest);
            obj.AddParam("@installation_venue", this.installationVenue);
            obj.AddParam("@ocv_date", this.ocvDate);
            obj.AddParam("@ocv_time", this.ocvTime);
            obj.AddParam("@club_trf_status", this.clubTrfStatus);
            obj.AddParam("@flagship_text", this.flagshipText);
            obj.AddParam("@flagship_image", this.flagshipImage);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }


    #region --- Get Club ---


    public DataTable GetAllClubs()
    {
        int distNo = 3141;
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllClubList";
        obj.AddParam("@district_no", distNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetClubById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubById";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetClubByClubId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubDetailsByClubNo";
        obj.AddParam("@ri_club_no", this.riClubNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetClubByDistrictId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubByDistrictId";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }



    #endregion

}

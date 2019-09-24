using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BodBll
/// </summary>
public class BodBll
{  

    public BodBll()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private string year, designation, addedBy, ipaddress;
    private int id, memberId, clubId, designationId;

    public int Id
    {
        set { id = value; }
        get { return id; }
    }

    public int MemberId
    {
        set { memberId = value; }
        get { return memberId; }
    }

    public int ClubId
    {
        set { clubId = value; }
        get { return clubId; }
    }

    public int DesignationId
    {
        set { designationId = value; }
        get { return designationId; }
    }
    public string Designation
    {
        set { designation = value; }
        get { return designation; }
    }
    public string Year
    {
        set { year = value; }
        get { return year; }
    }

    public string AddedBy
    {
        set { addedBy = value; }
        get { return addedBy; }
    }
    public string Ipaddress
    {
        set { ipaddress = value; }
        get { return ipaddress; }
    }


    // Get


    public DataTable GetBodDesignationList()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetBodDesignationList";         

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable GetBodDesignationListByClubId()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetBodDesignationListByClubIdAndDefault";
            obj.AddParam("@DistrictClubID", this.clubId);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    public DataTable GetBodDesignationById()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetBodDesignation";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable IsDesignationAlreadyExist()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_IsDesignationAlreadyExist";
            obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@designation", this.designation);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add

    public int AddBodDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddBodDesignation";
            obj.AddParam("@DistrictClubID", clubId);
            obj.AddParam("@designation", this.designation);
            obj.AddParam("@ipaddress", this.ipaddress);
            i = obj.ExecuteNonQuery(); 
        }
        catch { }
        return i;
    }

    public int AddBod()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddBodMember";
            obj.AddParam("@member_id",this.memberId);
            obj.AddParam("@designation_id",this.designationId);
            obj.AddParam("@DistrictClubID",this.clubId);
            obj.AddParam("@year",this.year);
            obj.AddParam("@added_by",this.addedBy);
            obj.AddParam("@ipaddress", this.ipaddress);
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Update 
    public int UpdateBodDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateBodDesignation";
            obj.AddParam("@id", id);
            obj.AddParam("@DistrictClubID", clubId);
            obj.AddParam("@designation", this.designation);
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    public int UpdateBodMembers()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateBodMember";
            obj.AddParam("@id", this.id);
            obj.AddParam("@member_id", this.memberId);
            obj.AddParam("@designation_id", this.designationId);
            obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@year", this.year);          
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }


    // Delete

    public int DeleteBodDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteBodDesignation";
            obj.AddParam("@id", this.id);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    #region --- Get All Current BOD ---
    public DataTable GetAllCurrentBod()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllCurrentBod";

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAllBodByClubId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.AddParam("@ri_club_no", this.clubId);
        obj.SetCommandSP = "z_GetAllBodByClubId";

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAllBodByDist3141ClubId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.AddParam("@Dist3141ClubId", this.clubId);
        obj.SetCommandSP = "z_GetAllBodByDist3141ClubId";

        dt = obj.ExecuteTable();
        return dt;
    }

    

    #endregion

    #region --- Get All Incoming BOD ---
    public DataTable GetAllIncomingBod()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllIncomingBod";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Get All GetRollOfHonour ---
    public DataTable GetRollOfHonour()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetRollOfHonourList";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Get  Club Awards ---
    public DataTable GetClubAwards()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubAwards";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Get  Contact ---
    public DataTable GetContact()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetContact";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Get About Club ---
    public DataTable GetAboutClub()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAboutClub_club";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Get Member Serving Dist ---
    public DataTable GetAllMemberServingDist()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllMemberServingDist";

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    
}

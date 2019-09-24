using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for RIPresident
/// </summary>
public class RIPresident
{
	public RIPresident()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string year, fname, mname, lname, club_name, district, country, theme, convention, president_image, theme_logo, convention_image, description;
    private int id, district_no, participant;


    public int District_no
    {
        set { district_no = value; }
        get { return district_no; }
    }

    public int Participant
    {
        set { participant = value; }
        get { return participant; }
    }

    public string Description
    {
        set { description = value; }
        get { return description; }
    }

    public int Id
    {
        set { id = value; }
        get { return id; }
    }

    public string Year
    {
        set { year = value; }
        get { return year; }
    }

    public string Fname
    {
        set { fname = value; }
        get { return fname; }
    }

    public string Mname
    {
        set { mname = value; }
        get { return mname; }
    }

    public string Lname
    {
        set { lname = value; }
        get { return lname; }
    }

    public string Club_name
    {
        set { club_name = value; }
        get { return club_name; }
    }
    public string District
    {
        set { district = value; }
        get { return district; }
    }

    public string Country
    {
        set { country = value; }
        get { return country; }
    }

    public string Theme
    {
        set { theme = value; }
        get { return theme; }
    }

    public string Convention
    {
        set { convention = value; }
        get { return convention; }
    }

    public string President_image
    {
        set { president_image = value; }
        get { return president_image; }
    }

    public string Theme_logo
    {
        set { theme_logo = value; }
        get { return theme_logo; }
    }

    public string Convention_image
    {
        set { convention_image = value; }
        get { return convention_image; }
    }
    



    // Get RI President

    public DataTable GetRIPresident()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetRIPresident";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add RI President

    public int AddRIPresident()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddRIPresident";

            obj.AddParam("@district_no", this.district_no);
            obj.AddParam("@participant", this.participant);
            obj.AddParam("@description", this.description);

            obj.AddParam("@year", this.year);
            obj.AddParam("@fname", this.fname);
            obj.AddParam("@mname", this.mname);
            obj.AddParam("@lname", this.lname);
            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@district", this.district);
            obj.AddParam("@country", this.country);
            obj.AddParam("@theme", this.theme);
            obj.AddParam("@convention", this.convention);          
            obj.AddParam("@president_image", this.president_image);
            obj.AddParam("@theme_logo", this.theme_logo);
            obj.AddParam("@convention_image", this.convention_image);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update RI President

    public int UpdateRIPresident()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateRIPresident";

            obj.AddParam("@district_no", this.district_no);
            obj.AddParam("@participant", this.participant);
            obj.AddParam("@description", this.description);

            obj.AddParam("@id", this.id);
            obj.AddParam("@year", this.year);
            obj.AddParam("@fname", this.fname);
            obj.AddParam("@mname", this.mname);
            obj.AddParam("@lname", this.lname);
            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@district", this.district);
            obj.AddParam("@country", this.country);
            obj.AddParam("@theme", this.theme);
            obj.AddParam("@convention", this.convention);
            obj.AddParam("@president_image", this.president_image);
            obj.AddParam("@theme_logo", this.theme_logo);
            obj.AddParam("@convention_image", this.convention_image);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }


}



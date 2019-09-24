using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for RIPresident
/// </summary>
public class RIDGBll
{
    public RIDGBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string year, name, clubName, designation, classfication, image, description, ipaddress;
    private int id;
    public string Designation
    {
        set { designation = value; }
        get { return designation; }
    }
    public string Classfication
    {
        set { classfication = value; }
        get { return classfication; }
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
    public string Name
    {
        set { name = value; }
        get { return name; }
    }  
    public string ClubName
    {
        set { clubName = value; }
        get { return clubName; }
    }
    public string Image
    {
        set { image = value; }
        get { return image; }
    }
    public string Ipaddress
    {
        set { ipaddress = value; }
        get { return ipaddress; }
    }    



    // Get
    public string GetRotaryYear()
    {        
        string strRotaryYear = "";
        try
        {
            int dtt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                strRotaryYear = dtt + " - " + (dtt + 1);
            else
                strRotaryYear = dtt - 1 + " - " + (dtt);
        }
        catch { }
        return strRotaryYear;
    }

    public DataTable GetRiDgData()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetRiDgData";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    public DataTable GetRiDgDataCurrentYear()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetRiDgDataCurrentYear";
            obj.AddParam("@year", this.year);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }


    public DataTable GetRiDgDataCurrentYearDesig()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetRiDgDataCurrentYearDesig";
            obj.AddParam("@designation", this.designation);
            obj.AddParam("@year", this.year);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add

    public int AddRiDgData()
    {
        int i = 0;
        try
        {

            // year, name, clubName, designation, classfication, image, description
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddRiDgData";

            obj.AddParam("@year", this.year);
            obj.AddParam("@name", this.name);
            obj.AddParam("@club_name", this.clubName);
            obj.AddParam("@designation", this.designation);
            obj.AddParam("@classification", this.classfication);
            obj.AddParam("@image", this.image);
            obj.AddParam("@description", this.description);
            obj.AddParam("@ipaddress", this.ipaddress);
            

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update
    public int UpdateRiDgData()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateRiDgData";

            obj.AddParam("@id", this.id);
            obj.AddParam("@year", this.year);
            obj.AddParam("@name", this.name);
            obj.AddParam("@club_name", this.clubName);

            obj.AddParam("@designation", this.designation);
            obj.AddParam("@classification", this.classfication);
            obj.AddParam("@image", this.image);
            obj.AddParam("@description", this.description);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Delete

    public int DeleteRiDgData()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteRiDgData";
            obj.AddParam("@id", this.id);           

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }
}



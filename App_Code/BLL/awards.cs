using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for awards
/// </summary>
public class awards
{
	public awards()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string name, whome, purpose, eligibility, selection, deadline, remarks;
    private int id;

    public int Id
    {
        set { id = value; }
        get { return id; }
    }

    public string Name
    {
        set { name = value; }
        get { return name; }
    }

    public string Whome
    {
        set { whome = value; }
        get { return whome; }
    }

    public string Purpose
    {
        set { purpose = value; }
        get { return purpose; }
    }

    public string Eligibility
    {
        set { eligibility = value; }
        get { return eligibility; }
    }

    public string Selection
    {
        set { selection = value; }
        get { return selection; }
    }

    public string Deadline
    {
        set { deadline = value; }
        get { return deadline; }
    }

    public string Remarks
    {
        set { remarks = value; }
        get { return remarks; }
    }


    // Get RI Awards

    public DataTable GetRIAwards()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_Get_RIAwards";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }


    // Add RI Awards

    public int AddRIAwards()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_Add_RIAwards";

            obj.AddParam("@name", this.name);
            obj.AddParam("@whome", this.whome);
            obj.AddParam("@purpose", this.purpose);
            obj.AddParam("@eligibility", this.eligibility);
            obj.AddParam("@selection", this.selection);
            obj.AddParam("@dead_line", this.deadline);
            obj.AddParam("@remarks", this.remarks);            

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update RI Awards
    public int UpdateRIAwards()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_Update_RIAwards";
            obj.AddParam("@id", this.id);
            obj.AddParam("@name", this.name);
            obj.AddParam("@whome", this.whome);
            obj.AddParam("@purpose", this.purpose);
            obj.AddParam("@eligibility", this.eligibility);
            obj.AddParam("@selection", this.selection);
            obj.AddParam("@dead_line", this.deadline);
            obj.AddParam("@remarks", this.remarks);       

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

}

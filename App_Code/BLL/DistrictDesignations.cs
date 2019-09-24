using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for DistrictDesignations
/// </summary>
public class DistrictDesignations
{
    public DistrictDesignations()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private string years, designation, sub_designation;
    private int id,sub_desig_id;

    public int Id
    {
        set { id = value; }
        get { return id; }
    }

    public string Years
    {
        set { years = value; }
        get { return years; }
    }

    public string Designation
    {
        set { designation = value; }
        get { return designation; }
    }

    public string Sub_designation
    {
        set { sub_designation = value; }
        get { return sub_designation; }
    }

    public int Sub_desig_id
    {
        set { sub_desig_id = value; }
        get { return sub_desig_id; }
    }

    // Get Designation

    public DataTable GetDesignation()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetDisttDesignation";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();
        }
        catch { }
        return dt;
    }

    // Add Designation

    public int AddDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDisttDesignation";

            obj.AddParam("@years", this.years);
            obj.AddParam("@designation", this.designation);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Update Designation

    public int UpdateDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDisttDesignation";

            obj.AddParam("@id", this.id);
            obj.AddParam("@years", this.years);
            obj.AddParam("@designation", this.designation);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Delete Designation

    public int DeleteDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_DeleteDisttDesig";

            obj.AddParam("@id", this.id);           

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }


    // Get Sub Designation

    public DataTable GetSubDesignation()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetDisttSubDesignation";
            obj.AddParam("@id", this.sub_desig_id);

            dt = obj.ExecuteTable();
        }
        catch { }
        return dt;
    }

    // Add Sub Designation

    public int AddSubDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDisttSubDesignation";           
            obj.AddParam("@desig_id", this.id);
            obj.AddParam("@years", this.years);            
            obj.AddParam("@sub_designation", this.sub_designation);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Update Sub Designation

    public int UpdateSubDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDisttSubDesignation";

            obj.AddParam("@id", this.sub_desig_id);
            obj.AddParam("@desig_id", this.id);
            obj.AddParam("@years", this.years);
            obj.AddParam("@sub_designation", this.sub_designation);

            i = obj.ExecuteNonQuery();
        }
        catch { throw; }
        return i;
    }

    // Delete sub Designation

    public int DeleteSubDesignation()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteDisttSubDesignation";

            obj.AddParam("@id", this.id);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for RotaractClub
/// </summary>
public class RotaractClub
{
	public RotaractClub()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string club_name, charter_date, sponserd, pf_name, pm_name, pl_name, pemail1, pemail2, pmobile1, pmobile2, pblackberry, pphone_resi, pdob, sf_name, sm_name, sl_name, semail1, semail2, smobile1, smobile2, sblackberry, sphone_resi, sdob, pmobile1CC, pmobile2CC, smobile1CC, smobile2CC;
    private int id, club_no, no_of_members;

    public int Id
    {
        set { id = value; }
        get { return id; }
    }

    public int Club_no
    {
        set { club_no = value; }
        get { return club_no; }
    }

    public int No_of_members
    {
        set { no_of_members = value; }
        get { return no_of_members; }
    }

    public string Club_name
    {
        set { club_name = value; }
        get { return club_name; }
    }

    public string Charter_date
    {
        set { charter_date = value; }
        get { return charter_date; }
    }

    public string Sponserd
    {
        set { sponserd = value; }
        get { return sponserd; }
    }

    public string Pf_name
    {
        set { pf_name = value; }
        get { return pf_name; }
    }

    public string Pm_name
    {
        set { pm_name = value; }
        get { return pm_name; }
    }

    public string Pl_name
    {
        set { pl_name = value; }
        get { return pl_name; }
    }

    public string Pemail1
    {
        set { pemail1 = value; }
        get { return pemail1; }
    }

    public string Pemail2
    {
        set { pemail2 = value; }
        get { return pemail2; }
    }

    public string Pmobile1CC
    {
        set { pmobile1CC = value; }
        get { return pmobile1CC; }
    }

     public string Pmobile1
    {
        set { pmobile1 = value; }
        get { return pmobile1; }
    }


     public string Pmobile2CC
     {
         set { pmobile2CC = value; }
         get { return pmobile2CC; }
     }

     public string Pmobile2
    {
        set { pmobile2 = value; }
        get { return pmobile2; }
    }

     public string Pblackberry
    {
        set { pblackberry = value; }
        get { return pblackberry; }
    }

     public string Pphone_resi
    {
        set { pphone_resi = value; }
        get { return pphone_resi; }
    }

      public string Pdob
    {
        set { pdob = value; }
        get { return pdob; }
    }



      public string Sf_name
      {
          set { sf_name = value; }
          get { return sf_name; }
      }

      public string Sm_name
      {
          set { sm_name = value; }
          get { return sm_name; }
      }

      public string Sl_name
      {
          set { sl_name = value; }
          get { return sl_name; }
      }

      public string Semail1
      {
          set { semail1 = value; }
          get { return semail1; }
      }

      public string Semail2
      {
          set { semail2 = value; }
          get { return semail2; }
      }


      public string Smobile1CC
      {
          set { smobile1CC = value; }
          get { return smobile1CC; }
      }

      public string Smobile1
      {
          set { smobile1 = value; }
          get { return smobile1; }
      }

      public string Smobile2CC
      {
          set { smobile2CC = value; }
          get { return smobile2CC; }
      }

      public string Smobile2
      {
          set { smobile2 = value; }
          get { return smobile2; }
      }

      public string Sblackberry
      {
          set { sblackberry = value; }
          get { return sblackberry; }
      }

      public string Sphone_resi
      {
          set { sphone_resi = value; }
          get { return sphone_resi; }
      }

      public string Sdob
      {
          set { sdob = value; }
          get { return sdob; }
      }


      // Get Rotract Club

      public DataTable GetRotaractClub()
      {
          DataTable dt = new DataTable();
          try
          {
              DBconnection obj = new DBconnection();
              
              obj.SetCommandSP = "z_GetRotaractClub";
              obj.AddParam("@rotaract_id", this.id);

              dt = obj.ExecuteTable();

          }
          catch { }
          return dt;
      }

    // Add Rotract Club

    public int AddRotaractClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddRotaractClub";

            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@club_no", this.club_no);
            obj.AddParam("@charter_date", this.charter_date);
            obj.AddParam("@sponserd", this.sponserd);
            obj.AddParam("@no_of_members", this.no_of_members);

            //President
            obj.AddParam("@pf_name", this.pf_name);
            obj.AddParam("@pm_name", this.pm_name);
            obj.AddParam("@pl_name", this.pl_name);
            obj.AddParam("@pemailid1", this.pemail1);
            obj.AddParam("@pemailid2", this.pemail2);
            obj.AddParam("@pmobile1CC", this.pmobile1CC);
            obj.AddParam("@pmobile1", this.pmobile1);
            obj.AddParam("@pmobile2CC", this.pmobile2CC);
            obj.AddParam("@pmobile2", this.pmobile2);
            obj.AddParam("@pblackberry", this.pblackberry);
            obj.AddParam("@pphone", this.pphone_resi);
            obj.AddParam("@pdob", this.pdob);

            //Secreatry

            obj.AddParam("@sf_name", this.sf_name);
            obj.AddParam("@sm_name", this.sm_name);
            obj.AddParam("@sl_name", this.sl_name);
            obj.AddParam("@semailid1", this.semail1);
            obj.AddParam("@semailid2", this.semail2);
            obj.AddParam("@smobile1CC", this.smobile1CC);
            obj.AddParam("@smobile1", this.smobile1);
            obj.AddParam("@smobile2CC", this.smobile2CC);
            obj.AddParam("@smobile2", this.smobile2);
            obj.AddParam("@sblackberry", this.sblackberry);
            obj.AddParam("@sphone", this.sphone_resi);
            obj.AddParam("@sdob", this.sdob);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update Rotract Club

    public int UpdateRotaractClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateRotaractClub";

            obj.AddParam("@id", this.id);
            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@club_no", this.club_no);
            obj.AddParam("@charter_date", this.charter_date);
            obj.AddParam("@sponserd", this.sponserd);
            obj.AddParam("@no_of_members", this.no_of_members);

            //President
            obj.AddParam("@pf_name", this.pf_name);
            obj.AddParam("@pm_name", this.pm_name);
            obj.AddParam("@pl_name", this.pl_name);
            obj.AddParam("@pemailid1", this.pemail1);
            obj.AddParam("@pemailid2", this.pemail2);
            obj.AddParam("@pmobile1CC", this.pmobile1CC);
            obj.AddParam("@pmobile1", this.pmobile1);
            obj.AddParam("@pmobile2CC", this.pmobile2CC);
            obj.AddParam("@pmobile2", this.pmobile2);
            obj.AddParam("@pblackberry", this.pblackberry);
            obj.AddParam("@pphone", this.pphone_resi);
            obj.AddParam("@pdob", this.pdob);

            //Secreatry

            obj.AddParam("@sf_name", this.sf_name);
            obj.AddParam("@sm_name", this.sm_name);
            obj.AddParam("@sl_name", this.sl_name);
            obj.AddParam("@semailid1", this.semail1);
            obj.AddParam("@semailid2", this.semail2);
            obj.AddParam("@smobile1CC", this.smobile1CC);
            obj.AddParam("@smobile1", this.smobile1);
            obj.AddParam("@smobile2CC", this.smobile2CC);
            obj.AddParam("@smobile2", this.smobile2);
            obj.AddParam("@sblackberry", this.sblackberry);
            obj.AddParam("@sphone", this.sphone_resi);
            obj.AddParam("@sdob", this.sdob);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }



    // Get Interact Club

    public DataTable GetInteractClub()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetInteractClub";
            obj.AddParam("@interact_id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add Interact Club

    public int AddInteractClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddInteractClub";

            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@club_no", this.club_no);
            obj.AddParam("@charter_date", this.charter_date);
            obj.AddParam("@sponserd", this.sponserd);
            obj.AddParam("@no_of_members", this.no_of_members);

            //President
            obj.AddParam("@pf_name", this.pf_name);
            obj.AddParam("@pm_name", this.pm_name);
            obj.AddParam("@pl_name", this.pl_name);
            obj.AddParam("@pemailid1", this.pemail1);
            obj.AddParam("@pemailid2", this.pemail2);
            obj.AddParam("@pmobile1", this.pmobile1);
            obj.AddParam("@pmobile2", this.pmobile2);
            obj.AddParam("@pblackberry", this.pblackberry);
            obj.AddParam("@pphone", this.pphone_resi);
            obj.AddParam("@pdob", this.pdob);

            //Secreatry

            obj.AddParam("@sf_name", this.sf_name);
            obj.AddParam("@sm_name", this.sm_name);
            obj.AddParam("@sl_name", this.sl_name);
            obj.AddParam("@semailid1", this.semail1);
            obj.AddParam("@semailid2", this.semail2);
            obj.AddParam("@smobile1", this.smobile1);
            obj.AddParam("@smobile2", this.smobile2);
            obj.AddParam("@sblackberry", this.sblackberry);
            obj.AddParam("@sphone", this.sphone_resi);
            obj.AddParam("@sdob", this.sdob);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update Interact Club

    public int UpdateInteractClub()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateInteractClub";

            obj.AddParam("@id", this.id);
            obj.AddParam("@club_name", this.club_name);
            obj.AddParam("@club_no", this.club_no);
            obj.AddParam("@charter_date", this.charter_date);
            obj.AddParam("@sponserd", this.sponserd);
            obj.AddParam("@no_of_members", this.no_of_members);

            //President
            obj.AddParam("@pf_name", this.pf_name);
            obj.AddParam("@pm_name", this.pm_name);
            obj.AddParam("@pl_name", this.pl_name);
            obj.AddParam("@pemailid1", this.pemail1);
            obj.AddParam("@pemailid2", this.pemail2);
            obj.AddParam("@pmobile1", this.pmobile1);
            obj.AddParam("@pmobile2", this.pmobile2);
            obj.AddParam("@pblackberry", this.pblackberry);
            obj.AddParam("@pphone", this.pphone_resi);
            obj.AddParam("@pdob", this.pdob);

            //Secreatry

            obj.AddParam("@sf_name", this.sf_name);
            obj.AddParam("@sm_name", this.sm_name);
            obj.AddParam("@sl_name", this.sl_name);
            obj.AddParam("@semailid1", this.semail1);
            obj.AddParam("@semailid2", this.semail2);
            obj.AddParam("@smobile1", this.smobile1);
            obj.AddParam("@smobile2", this.smobile2);
            obj.AddParam("@sblackberry", this.sblackberry);
            obj.AddParam("@sphone", this.sphone_resi);
            obj.AddParam("@sdob", this.sdob);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }
}


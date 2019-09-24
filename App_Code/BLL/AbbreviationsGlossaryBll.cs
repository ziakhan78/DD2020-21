using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AbbreviationsGlossaryBll
/// </summary>
public class AbbreviationsGlossaryBll
{
    public AbbreviationsGlossaryBll()
    {
        //
        // TODO: Add constructor logic here
        //
    }




    private int id, orderNo = 0;


    public int Id
    {
        set { id = value; }
        get { return id; }
    }



    #region --- Get Abbreviations List  ---
    public DataTable GetAbbreviationsList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAbbreviationsList";

        dt = obj.ExecuteTable();
        return dt;
    }
    #endregion

    #region --- Get Glossary List  ---
    public DataTable GetGlossaryList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetGlossaryList";

        dt = obj.ExecuteTable();
        return dt;
    }
    #endregion


}
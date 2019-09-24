using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for JoinRotaryBll
/// </summary>
public class JoinRotaryBll
{
    public JoinRotaryBll()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region --- Declared Variables ---


    private string fname, lname, emailId, mobile, mobileCc, add1, add2, city, state, ipaddress = "";

    private int id = 0;
    public int Id { set { id = value; } get { return id; } }
    public string Fname { set { fname = value; } get { return fname; } }
    public string Lname { set { lname = value; } get { return lname; } }
    public string EmailId { set { emailId = value; } get { return emailId; } }
    public string Mobile { set { mobile = value; } get { return mobile; } }
    public string MobileCc { set { mobileCc = value; } get { return mobileCc; } }
    public string Add1 { set { add1 = value; } get { return add1; } }
    public string Add2 { set { add2 = value; } get { return add2; } }
    public string City { set { city = value; } get { return city; } }
    public string State { set { state = value; } get { return state; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    #endregion

    public int SubmitJoinRotaryForm()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_JoinRotary";
        obj.AddParam("@fname", fname);
        obj.AddParam("@lname", lname);
        obj.AddParam("@mobileCc", mobileCc);
        obj.AddParam("@mobile", Mobile);
        obj.AddParam("@emailid", emailId);
        obj.AddParam("@add1", add1);
        obj.AddParam("@add2", add2);
        obj.AddParam("@city", city);
        obj.AddParam("@state", state);
        obj.AddParam("@ipaddress", ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }
}
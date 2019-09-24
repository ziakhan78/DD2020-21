using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for EventsBll
/// </summary>
public class EventsBll
{
    public EventsBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---


    private string eventName, eventTime, eventDescription, venue, hostedBy, dressCode, ipaddress = "";

    private SqlDateTime eventDate;
    private int id = 0;
    public int Id { set { id = value; } get { return id; } }

    public SqlDateTime EventDate { set { eventDate = value; } get { return eventDate; } }
    public string EventName { set { eventName = value; } get { return eventName; } }
    public string EventTime { set { eventTime = value; } get { return eventTime; } }
    public string EventDescription { set { eventDescription = value; } get { return eventDescription; } }
    public string Venue { set { venue = value; } get { return venue; } }
    public string HostedBy { set { hostedBy = value; } get { return hostedBy; } }
    public string DressCode { set { dressCode = value; } get { return dressCode; } }
   

  

    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    #endregion

    #region --- Add Prtojects ---
    

    #endregion

   

    #region --- Get Prtojects ---


    public DataTable GetEvents()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllEvents";        

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Delete Prtojects ---
    public int DeletePrtoject()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

   
}
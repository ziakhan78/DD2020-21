using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for DownloadsBll
/// </summary>
public class DownloadsBll
{  

    public DownloadsBll()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private string downloadType, title, eventName, author, filePath, ipaddress;
    private int id;
    DateTime eventDate;

    public int Id
    {
        set { id = value; }
        get { return id; }
    } 
    public DateTime EventDate
    {
        set { eventDate = value; }
        get { return eventDate; }
    }
    public string DownloadType
    {
        set { downloadType = value; }
        get { return downloadType; }
    }
    public string Title
    {
        set { title = value; }
        get { return title; }
    }
    public string EventName
    {
        set { eventName = value; }
        get { return eventName; }
    }
    public string Author
    {
        set { author = value; }
        get { return author; }
    }
    public string FilePath
    {
        set { filePath = value; }
        get { return filePath; }
    }
    public string Ipaddress
    {
        set { ipaddress = value; }
        get { return ipaddress; }
    }


    // Get


    public DataTable SearchDownloadsByAlphabet()
    {
        DataTable dt = new DataTable();
        try
        {

            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_SearchByAlphabetDownloads";
            obj.AddParam("@name", this.title);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    public DataTable SearchDownloadsByAlphabetByType()
    {
        DataTable dt = new DataTable();
        try
        {

            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_SearchByAlphabetDownloadsByType";
            obj.AddParam("@name", this.title);
            obj.AddParam("@download_type", this.downloadType);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable GetDownloads()
    {
        DataTable dt = new DataTable();
        try
        {

            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetAllDowonloads";

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable GetDownloadsById()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetDownloadById";
            obj.AddParam("@id", this.id);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable GetDownloadsByDownloadsType()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetDownloadsByDownloadType";
            obj.AddParam("@download_type", this.downloadType);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
    public DataTable GetDownloadsByEventType()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "z_GetAllDowonloadsByEvents";
            obj.AddParam("@event_name", this.eventName);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add
    public int AddDownloads()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDownload";
            obj.AddParam("@download_type", this.downloadType);
            obj.AddParam("@event_date", this.eventDate);
            obj.AddParam("@event_name", this.eventName);
            obj.AddParam("@title", this.title);
            obj.AddParam("@author", this.author);            
            obj.AddParam("@file_name", this.filePath);
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Update  

    public int UpdateDownloads()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDownload";
            obj.AddParam("@id", this.id);
            obj.AddParam("@download_type", this.downloadType);
            obj.AddParam("@event_date", this.eventDate);
            obj.AddParam("@event_name", this.eventName);
            obj.AddParam("@title", this.title);
            obj.AddParam("@author", this.author);
            obj.AddParam("@file_name", this.filePath);
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }


    // Delete

    public int DeleteDownloads()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteDownload";
            obj.AddParam("@id", this.id);
            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }        
}

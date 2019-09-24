using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Telerik.Web.UI;
using System.Data.SqlTypes;

public partial class admin_add_download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            trDate.Visible = true;
            trEventName.Visible = true;

            if (Session["user"] != null)
            {                
                if (Request.QueryString["id"] != null)
                {                    
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetDownloads(id);
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void GetDownloads(int id)
    {
        DownloadsBll obj = new DownloadsBll();
        obj.Id = id;
       
        DataTable dt = new DataTable();
        dt = obj.GetDownloadsById();
        if (dt.Rows.Count > 0)
        {
            string downloadType= dt.Rows[0]["download_type"].ToString();
            if (downloadType == "Powerpoints")
                rbtnDownloadType.SelectedIndex = 0;

            if (downloadType == "Documents")
                rbtnDownloadType.SelectedIndex = 1;

            if (downloadType == "Manuals")
                rbtnDownloadType.SelectedIndex = 2;

            event_date.DbSelectedDate = DateTime.Parse(dt.Rows[0]["event_date"].ToString());
            txtEventName.Text = dt.Rows[0]["event_name"].ToString();
            txtTitle.Text = dt.Rows[0]["title"].ToString();
            txtAuthor.Text = dt.Rows[0]["author"].ToString();

            string file = dt.Rows[0]["file_name"].ToString();
            if (file != "")
            {                
                Session["DownloadedFile"] = file;
            }           

            //lblFileSize.Text = dt.Rows[0]["file_size"].ToString();

            //string section = dt.Rows[0]["presented_at"].ToString();
            //if (section == "PrePets")
            //    rbtnPresentedAt.SelectedIndex = 0;
            //if (section == "SOTS")
            //    rbtnPresentedAt.SelectedIndex = 1; 

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDownloads(id);
            }
            else
            {
                AddDownloads();
            }
        }
    }

    private void AddDownloads()
    {
        string path = "";
        string ext = "";
        string file_name = "";
        int fileSize = 0;
        try
        {
            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDownload";

            obj.AddParam("@download_type", rbtnDownloadType.SelectedItem.Text.ToString());
            try
            {
                obj.AddParam("@event_date", DateTime.Parse(event_date.SelectedDate.ToString()));
            }
            catch
            { obj.AddParam("@event_date", nullDate); }

            obj.AddParam("@event_name", txtEventName.Text.ToString());
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@author", txtAuthor.Text.ToString());

            try
            {
                obj.AddParam("@file_name", Session["DownloadedFile"].ToString());
            }
            catch { obj.AddParam("@file_name", ""); }

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Download Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch(Exception ex)
        { }
    }

    private void UpdateDownloads(int id)
    {
        string path = "";
        string ext = "";
        string file_name = "";
        int fileSize = 0;

        try
        {
            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDownload";           

            obj.AddParam("@id", id);

            obj.AddParam("@download_type", rbtnDownloadType.SelectedItem.Text.ToString());

            try
            {
                obj.AddParam("@event_date", DateTime.Parse(event_date.SelectedDate.ToString()));
            }
            catch
            { obj.AddParam("@event_date", nullDate); }
            obj.AddParam("@event_name", txtEventName.Text.ToString());
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@author", txtAuthor.Text.ToString());

            try
            {
                obj.AddParam("@file_name", Session["DownloadedFile"].ToString());              
            }
            catch { obj.AddParam("@file_name", ""); }
          

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();

                showmsg("Download Has Been Updated Successfully !", "view_download.aspx");           
            }
        }
        catch (Exception ex)
        { }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
 
    private void clear()
    {
        Session["DownloadedFile"] = null;
        txtTitle.Text = "";      
        txtAuthor.Text = "";
       // txtEventName.Text = "";
       // event_date.Clear();        
    }
     public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }

    //protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    try
    //    {
    //        if (FileUpload1.HasFile)
    //        {
    //            int fileSize = FileUpload1.PostedFile.ContentLength;
    //            if (fileSize > 5242880)
    //            {
    //                args.IsValid = false;
    //            }
    //            else
    //            {
    //                args.IsValid = true;
    //            }
    //        }
    //    }
    //    catch
    //    {
    //        args.IsValid = true;
    //    }
    //}
    //protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    //{
    //    try
    //    {
    //        string imgPath = "";
    //        string ext;            

    //        int filesizeInBytes = e.File.ContentLength;
    //        Session["FileSize"] = filesizeInBytes;           

    //        imgPath = e.File.FileName;
    //        imgPath = imgPath.Substring(imgPath.LastIndexOf("\\") + 1);
    //        string imageTime = System.DateTime.Now.ToString();
    //        imageTime = imageTime.Replace("/", "");
    //        imageTime = imageTime.Replace(":", "");
    //        imageTime = imageTime.Replace(" ", "");
    //        ext = imgPath.Substring(imgPath.LastIndexOf("."));
    //        imgPath = imgPath.Substring(0, imgPath.LastIndexOf("."));
    //        imgPath = imgPath + "_" + imageTime + ext;

    //        Session["FileName"] = imgPath;
    //    }
    //    catch
    //    {
    //    }
    //}

    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "";
            string fileName, strFileName = "";
            string ext = "";

            
            fileName = e.File.FileName;
            // fileName = txtTitle.Text.Trim().Replace(" ", "").ToString() + "_" + txtEventName.Text.Trim().Replace(" ", "").ToString();
            fileName = fileName.Replace(" ", "").ToString();
            fileName = fileName.Replace("_", "").ToString();
            fileName = fileName.Replace("-", "").ToString();

            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = fileName.Substring(0, fileName.LastIndexOf("."));
            fileName = fileName + "_" + strDate + ext;

            if(ext==".ppt" || ext == ".pptx"|| ext == ".pps"|| ext == ".ppsx")
            {
                strPath = "Downloads/Ppts";
            }
            else
            {
                strPath = "Downloads/Documents";
            }
            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["DownloadedFile"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }

    protected void rbtnDownloadType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strValue = rbtnDownloadType.SelectedValue.ToString();
        if (strValue == "0")
        {
            trDate.Visible = true;
            trEventName.Visible = true;
           
        }

        else 
        {
            trDate.Visible = false;
            trEventName.Visible = false;
        }
    }
}

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

public partial class admin_add_downloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLClubName.Visible = false;
            if (Session["user"] != null)
            {
                //rfvFile.Enabled = true;

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
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDownloads";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtTitle.Text = dt.Rows[0]["title"].ToString();
            txtDesc.Text = dt.Rows[0]["description"].ToString();
           
            string file = dt.Rows[0]["download_files"].ToString();
            if (file != "")
            {
                //rfvFile.Enabled = false;
                Session["DownloadedFile"] = file;
            }
            txtAuthor.Text = dt.Rows[0]["author"].ToString();
            DDLStatus.SelectedItem.Text = dt.Rows[0]["status"].ToString();
            lblFileSize.Text = dt.Rows[0]["file_size"].ToString();
           
            string section = dt.Rows[0]["section"].ToString();
            if(section=="General")
                rbtnSection.SelectedIndex = 0;
            if (section == "Club Leaders")
                rbtnSection.SelectedIndex = 1;
            if (section == "District Officers")
                rbtnSection.SelectedIndex = 2;
            if (section == "Manuals")
                rbtnSection.SelectedIndex = 3;
           
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
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDownloads";

            try
            {
                foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
                {
                    fileSize = int.Parse(file.ContentLength.ToString());
                    file_name = file.FileName;
                    file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
                    string imageTime = System.DateTime.Now.ToString();
                    imageTime = imageTime.Replace("/", "");
                    imageTime = imageTime.Replace("-", "");
                    imageTime = imageTime.Replace(":", "");
                    imageTime = imageTime.Replace(" ", "");
                    ext = file_name.Substring(file_name.LastIndexOf("."));
                    file_name = file_name.Substring(0, file_name.LastIndexOf("."));
                    file_name = file_name + "_" + imageTime + ext;
                    path = Server.MapPath("~/Downloads/");
                    path = path + "/" + file_name;
                    file.SaveAs(path);
                }
            }
            catch { }

            //SaveImages img = new SaveImages();
            //path = img.AddImages(FileUpload1.PostedFile, "Downloads");
            //string fileSize = FileUpload1.PostedFile.ContentLength.ToString();


           // path = Session["FileName"].ToString();
           // fileSize = Session["FileSize"].ToString();

            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@description", txtDesc.Text.ToString());
            obj.AddParam("@status", DDLStatus.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@download_files", file_name);
            obj.AddParam("@file_size", fileSize);
            obj.AddParam("@author", txtAuthor.Text.ToString());
            obj.AddParam("@section", rbtnSection.SelectedItem.Text.Trim());

            int i = int.Parse(rbtnFor.SelectedValue.ToString());
            if (i == 0)
            {
                obj.AddParam("@DistrictClubID", 0);
            }

            else
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                obj.AddParam("@DistrictClubID", cid);
            }
           
            obj.AddParam("@added_by", "Admin");
            obj.AddParam("@download_for", rbtnFor.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDownloads(int id)
    {
        string path = "";
        string ext = "";
        string file_name = "";
        int fileSize = 0;

        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDownloads";           

            obj.AddParam("@id", id);
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@description", txtDesc.Text.ToString());

            if (RadAsyncUpload1.UploadedFiles.Count > 0)
            {

                try
                {
                    foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
                    {
                        fileSize = int.Parse(file.ContentLength.ToString());
                        file_name = file.FileName;
                        file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
                        string imageTime = System.DateTime.Now.ToString();
                        imageTime = imageTime.Replace("/", "");
                        imageTime = imageTime.Replace("-", "");
                        imageTime = imageTime.Replace(":", "");
                        imageTime = imageTime.Replace(" ", "");
                        ext = file_name.Substring(file_name.LastIndexOf("."));
                        file_name = file_name.Substring(0, file_name.LastIndexOf("."));
                        file_name = file_name + "_" + imageTime + ext;
                        path = Server.MapPath("~/Downloads/");
                        path = path + "/" + file_name;
                        file.SaveAs(path);
                    }
                }
                catch { }
            }
            else
            {
                obj.AddParam("@download_files", Session["FileName"].ToString());
                obj.AddParam("@file_size", lblFileSize.Text);
            }
           
           
            obj.AddParam("@author", txtAuthor.Text.ToString());
            obj.AddParam("@section", rbtnSection.SelectedItem.Text.Trim());
            obj.AddParam("@status", DDLStatus.SelectedItem.Text.Trim().ToString());

            int i = int.Parse(rbtnFor.SelectedValue.ToString());
            if (i == 0)
            {
                obj.AddParam("@DistrictClubID", 0);
            }

            else
            {
                int cid = int.Parse(DDLClubName.SelectedValue.ToString());
                obj.AddParam("@DistrictClubID", cid);
            }

            obj.AddParam("@download_for", rbtnFor.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();

                showmsg("Record updated successfully !", "view_downloads.aspx");           
            }
        }
        catch { }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
 
    private void clear()
    {
        txtTitle.Text = "";
        txtDesc.Text = "";
        txtAuthor.Text = "";
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
     protected void rbtnFor_SelectedIndexChanged(object sender, EventArgs e)
     {
         int i = int.Parse(rbtnFor.SelectedValue.ToString());

         if (i == 0 || i==2)
         {
             DDLClubName.Visible = false;
         }
         else
         {
             DDLClubName.Visible = true;
         }
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
}

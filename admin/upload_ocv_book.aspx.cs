using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_upload_ocv_book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            int filesizeInBytes = int.Parse(e.File.ContentLength.ToString());
            Session["FileSize"] = filesizeInBytes;
            string filename = e.File.FileName;
            Session["FileName"] = filename;
        }
        catch
        {
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadAsyncUpload1.UploadedFiles.Count > 0)
            {
                AddDownloads(Session["FileName"].ToString(), Session["FileSize"].ToString());
            }
            else
            {
                string jv = "<script>alert('Please Select file for upload');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
    }
    private void AddDownloads(string fileName, string fileSize)
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        // Look for a proxy address first
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        // If there is no proxy, get the standard remote address
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/


        try
        {
            int distID = int.Parse(DDLClubName.SelectedValue.ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddOCVBookRpt";

            obj.AddParam("@ocv_files", fileName);
            obj.AddParam("@file_size", fileSize);

            obj.AddParam("@DistrictClubID", distID);
            obj.AddParam("@ip_address", ipaddress);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                Session["FileName"] = null;
                Session["FileSize"] = null;
                DDLClubName.SelectedIndex = 0;
                string jv = "<script>alert('Your file has been submitted successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
}
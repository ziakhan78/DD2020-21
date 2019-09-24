using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class add_bulletin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLClubName.Visible = false;
            if (Session["user"] != null)
            {
                rfvUploadFile.Enabled = true;
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetBulletin(id);
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void GetBulletin(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetBulletin";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtTitle.Text = dt.Rows[0]["title"].ToString();

            //rbtnFrequency.SelectedItem.Text = dt.Rows[0]["frequency"].ToString();
            string frequency = dt.Rows[0]["frequency"].ToString();
            if (frequency == "Weekly")
                rbtnFrequency.SelectedIndex = 0;
            if (frequency == "Monthly")
                rbtnFrequency.SelectedIndex = 1;
            if (frequency == "Quarterly")
                rbtnFrequency.SelectedIndex = 2;
            if (frequency == "Half Yearly")
                rbtnFrequency.SelectedIndex = 3;
            if (frequency == "Yearly")
                rbtnFrequency.SelectedIndex = 4;

            string file = dt.Rows[0]["bulletin"].ToString();
            if (file != "")
            {
                rfvUploadFile.Enabled = false;
                Session["Bulletin"] = file;
            }
            string mast_head = dt.Rows[0]["mast_head"].ToString();
            if (mast_head != "")
            {
                rfvUploadFile.Enabled = false;
                Session["MastHead"] = mast_head;
            }
            DDLStatus.SelectedItem.Text = dt.Rows[0]["status"].ToString();

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBulletin(id);
            }
            else
            {
                AddBulletin();
            }
        }
    }

    private void AddBulletin()
    {
        string path, mast_head = "";
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddBulletin";
                       
            obj.AddParam("@added_by", "Admin");

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

            SaveImages img = new SaveImages();
            path = img.AddImages(FileUpload1.PostedFile, "Bulletin");
            mast_head = img.AddImages(FileUpload2.PostedFile, "Bulletin");


            //try
            //{
            //    foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
            //    {
            //        fileSize = file.ContentLength;
            //        file_name = file.FileName;
            //        file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
            //        string imageTime = System.DateTime.Now.ToString();
            //        imageTime = imageTime.Replace("/", "");
            //        imageTime = imageTime.Replace("-", "");
            //        imageTime = imageTime.Replace(":", "");
            //        imageTime = imageTime.Replace(" ", "");
            //        ext = file_name.Substring(file_name.LastIndexOf("."));
            //        file_name = file_name.Substring(0, file_name.LastIndexOf("."));
            //        file_name = file_name + "_" + imageTime + ext;
            //        path = Server.MapPath("~/Bulletin/");
            //        path = path + "/" + file_name;
            //        file.SaveAs(path);
            //    }
            //}
            //catch { }

            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@frequency", rbtnFrequency.SelectedItem.Text.ToString());
            obj.AddParam("@status", DDLStatus.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@bulletin", path);
            obj.AddParam("@mast_head", mast_head);
            
           

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

    private void UpdateBulletin(int id)
    {
        string path, mast_head = "";
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateBulletin";           

            SaveImages img = new SaveImages();
            path = img.AddImages(FileUpload1.PostedFile, "Bulletin");
            mast_head = img.AddImages(FileUpload2.PostedFile, "Bulletin");


            try
            {
                if (path == "")
                {
                    obj.AddParam("@bulletin", Session["Bulletin"].ToString());
                }
                else
                {
                    obj.AddParam("@bulletin", path);
                }
            }
            catch { obj.AddParam("@bulletin", ""); }

            try
            {

                if (mast_head == "")
                {
                    obj.AddParam("@mast_head", Session["MastHead"].ToString());
                }
                else
                {
                    obj.AddParam("@mast_head", mast_head);
                }
            }
            catch { obj.AddParam("@mast_head", ""); }

            obj.AddParam("@id", id);            
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@frequency", rbtnFrequency.SelectedItem.Text.ToString());
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
            


            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();

                showmsg("Record updated successfully !", "view_bulletin.aspx");
                //    string jv = "<script>alert('Record Added Successfully');</script>";
                //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
        rbtnFrequency.SelectedIndex = 0;
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
        if (i == 0)
        {

            DDLClubName.Visible = false;
        }
        else
        {
            DDLClubName.Visible = true;
        }
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (fileSize > 5242880)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }
        catch
        {
            args.IsValid = true;
        }
    }
    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUpload2.HasFile)
            {
                int fileSize = FileUpload2.PostedFile.ContentLength;
                if (fileSize > 307200)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }
        catch
        {
            args.IsValid = true;
        }
    }
}

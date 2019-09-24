using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_ri_president : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetRIPresident(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            //Response.Redirect("Default.aspx");
            Server.Transfer("Default.aspx");
        }
        
    }

    #region Bind members and years
   
    private void BindYears()
    {
        //try
        //{
        //    for (Int32 i = 1909; i <= Convert.ToInt32(DateTime.Now.Year); i++)
        //    {
        //        string dt = i + " - " + (i + 1);
        //        DDLYear.Items.Add(dt.ToString());
        //    }
        //    DDLYear.Items.Insert(0, "Select");
        //}
        //catch (Exception E)
        //{
        //    Response.Write(E.Message.ToString());
        //}

        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt + 1); i >= 1909; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLYear.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    #endregion

    private void GetRIPresident(int id)
    {
        RIPresident rip = new RIPresident();        
        rip.Id = id;
        DataTable dt = new DataTable();
        dt = rip.GetRIPresident();
        if (dt.Rows.Count > 0)
        {
            txtDistNo.Text = dt.Rows[0]["district_no"].ToString();
            txtParticepant.Text = dt.Rows[0]["participant"].ToString();
            txtData.Content = dt.Rows[0]["description"].ToString();
            
            DDLYear.SelectedItem.Text = dt.Rows[0]["year"].ToString();
            txtFName.Text = dt.Rows[0]["fname"].ToString();
            txtMName.Text = dt.Rows[0]["mname"].ToString();
            txtLName.Text = dt.Rows[0]["lname"].ToString();
            txtClubName.Text = dt.Rows[0]["club_name"].ToString();
            txtDistrict.Text = dt.Rows[0]["district"].ToString();
            txtCountry.Text = dt.Rows[0]["country"].ToString();
            txtTheme.Text = dt.Rows[0]["theme"].ToString();
            txtConvention.Text = dt.Rows[0]["convention"].ToString();

            string president_image = dt.Rows[0]["president_image"].ToString();
            string theme_logo = dt.Rows[0]["theme_logo"].ToString();
            string convention_image = dt.Rows[0]["convention_image"].ToString(); 
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateRIPresident(id);
            }
            else
            {
                AddRIPresident();
            }
        }
    }

    private void AddRIPresident()
    {
        try
        {
            RIPresident rip = new RIPresident();

            try
            {
                rip.District_no = int.Parse(txtDistNo.Text.Trim().ToString());
            }
            catch { rip.District_no = 0; }
            try
            {
                rip.Participant = int.Parse(txtParticepant.Text.Trim().ToString());
            }
            catch
            {
                rip.Participant = 0;
            }
            rip.Description = txtData.Content;

            rip.Year = DDLYear.SelectedItem.Text.Trim().ToString();
            rip.Fname= txtFName.Text.Trim().ToString();
            rip.Mname= txtMName.Text.Trim().ToString();
            rip.Lname= txtLName.Text.Trim().ToString(); 
            rip.Club_name= txtClubName.Text.Trim().ToString();            
            rip.District= txtDistrict.Text.Trim().ToString();// Location
            rip.Country= txtCountry.Text.Trim().ToString();
            rip.Theme= txtTheme.Text.Trim().ToString();
            rip.Convention= txtConvention.Text.Trim().ToString();

            SaveImages img = new SaveImages();
            
            string pimg = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentPhotos");
            rip.President_image = pimg;
            
            string theme_logo = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentLogo");
            rip.Theme_logo = theme_logo;
            
            string convention_image = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentLogo");
            rip.Convention_image = convention_image;

            int exe = rip.AddRIPresident();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateRIPresident(int id)
    {
        try
        {
            RIPresident rip = new RIPresident();
            try
            {
                rip.District_no = int.Parse(txtDistNo.Text.Trim().ToString());
            }
            catch { rip.District_no = 0; }
            try
            {
                rip.Participant = int.Parse(txtParticepant.Text.Trim().ToString());
            }
            catch
            {
                rip.Participant = 0;
            }
            rip.Description = txtData.Content;

            rip.Id = id;
            rip.Year = DDLYear.SelectedItem.Text.Trim().ToString();
            rip.Fname = txtFName.Text.Trim().ToString();
            rip.Mname = txtMName.Text.Trim().ToString();
            rip.Lname = txtLName.Text.Trim().ToString();
            rip.Club_name = txtClubName.Text.Trim().ToString();
            rip.District = txtDistrict.Text.Trim().ToString();
            rip.Country = txtCountry.Text.Trim().ToString();
            rip.Theme = txtTheme.Text.Trim().ToString();
            rip.Convention = txtConvention.Text.Trim().ToString();

            SaveImages img = new SaveImages();

            string pimg = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentPhotos");
            rip.President_image = pimg;

            string theme_logo = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentLogo");
            rip.Theme_logo = theme_logo;

            string convention_image = img.AddImages(FileUploadPhoto.PostedFile, "RIPresidentLogo");
            rip.Convention_image = convention_image;

            int exe = rip.UpdateRIPresident();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_ri_president.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtClubName.Text = "";
        txtConvention.Text = "";
        txtCountry.Text = "";
        txtDistrict.Text = "";
        txtFName.Text = "";
        txtLName.Text = "";
        txtMName.Text = "";
        txtTheme.Text = "";        
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
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


    protected void CVMemImg_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUploadPhoto.HasFile)
            {
                int fileSize = FileUploadPhoto.PostedFile.ContentLength;
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
    protected void CVLogo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUploadLogo.HasFile)
            {
                int fileSize = FileUploadLogo.PostedFile.ContentLength;
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
    protected void CVCon_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUploadConvention.HasFile)
            {
                int fileSize = FileUploadConvention.PostedFile.ContentLength;
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
    protected void CVImgFormatMemImg_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUploadPhoto.HasFile)
        {
            string imgPath = "";
            string ext = "";
            imgPath = FileUploadPhoto.PostedFile.FileName;
            imgPath = imgPath.Substring(imgPath.LastIndexOf("\\") + 1);
            ext = imgPath.Substring(imgPath.LastIndexOf("."));

            if (ext == ".gif" || ext == ".jpeg" || ext == ".png" || ext == ".jpg")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
    protected void CVImgFormatLogo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUploadLogo.HasFile)
        {
            string imgPath = "";
            string ext = "";
            imgPath = FileUploadLogo.PostedFile.FileName;
            imgPath = imgPath.Substring(imgPath.LastIndexOf("\\") + 1);
            ext = imgPath.Substring(imgPath.LastIndexOf("."));

            if (ext == ".gif" || ext == ".jpeg" || ext == ".png" || ext == ".jpg")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
    protected void CVImgFormatCon_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUploadConvention.HasFile)
        {
            string imgPath = "";
            string ext = "";
            imgPath = FileUploadConvention.PostedFile.FileName;
            imgPath = imgPath.Substring(imgPath.LastIndexOf("\\") + 1);
            ext = imgPath.Substring(imgPath.LastIndexOf("."));

            if (ext == ".gif" || ext == ".jpeg" || ext == ".png" || ext == ".jpg")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}

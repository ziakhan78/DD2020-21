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

using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.Data.SqlClient;

public partial class admin_add_ri_dg_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                Session["RIDGImages"] = null;
                memImg.Visible = false;
                BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetRiDgData(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void GetRiDgData(int id)
    {
        DataTable dt = new DataTable();
        RIDGBll obj = new RIDGBll();
        obj.Id = id;    
        
        dt = obj.GetRiDgData();
      
        if (dt.Rows.Count > 0)
        {
            DDLYears.SelectedItem.Text = dt.Rows[0]["year"].ToString();
            txtRotarian.Text = dt.Rows[0]["name"].ToString();
            txtClubName.Text = dt.Rows[0]["club_name"].ToString();
            ddlDesignation.SelectedItem.Text = dt.Rows[0]["designation"].ToString();
            txtClassification.Text = dt.Rows[0]["classification"].ToString();
            txtDescription.Content = dt.Rows[0]["description"].ToString();

            string strImg = dt.Rows[0]["image"].ToString();
            if (strImg != "")
            {
                Session["RIDGImages"] = strImg;
                memImg.Visible = true;
                memImg.ImageUrl = "../RIDGImages/" + strImg;
            }
        }
    }

    //private void BindYears()
    //{
    //    for (Int32 i = Convert.ToInt32(DateTime.Now.Year) - 30; i <= Convert.ToInt32(DateTime.Now.Year) + 40; i++)
    //    {
    //        DDLYears.Items.Add(i.ToString());
    //        DDLYears2.Items.Add(i.ToString());
    //    }
    //    DDLYears.Items.Insert(0, "Select Year");
    //    DDLYears2.Items.Insert(0, "Select Year");
    //}

    private void BindYears()
    {

        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt+2); i >= 1920; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLYears.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }

        //try
        //{
        //    //for (Int32 i = 1920; i <= Convert.ToInt32(DateTime.Now.Year); i++)
        //    for (Int32 i = 1920; i <= Convert.ToInt32(DateTime.Now.Year); i++)
        //    {
        //        string dt = i + " - " + (i + 1);
        //        DDLYears.Items.Add(dt.ToString());
        //    }
        //    DDLYears.Items.Insert(0, "Year");

        //}
        //catch (Exception E)
        //{
        //    Response.Write(E.Message.ToString());
        //}
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateRiDgData(id);
            }
            else
            {
                AddRiDgData();
            }
        }
    }

    private void AddRiDgData()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            RIDGBll obj = new RIDGBll();

            obj.Year = DDLYears.SelectedItem.Text.ToString();
            obj.Name = txtRotarian.Text.ToString();
            obj.ClubName = txtClubName.Text.ToString();
            obj.Designation = ddlDesignation.SelectedItem.Text.ToString();
            obj.Classfication = txtClassification.Text.ToString();
            obj.Description = txtDescription.Content.ToString();
            obj.Ipaddress = ipaddress;

            if (Session["RIDGImages"] != null)
                obj.Image = Session["RIDGImages"].ToString();
            else
                obj.Image = "";           

            int exe = obj.AddRiDgData();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateRiDgData(int id)
    {
        try
        {
            RIDGBll obj = new RIDGBll();

            obj.Id = id;
            obj.Year = DDLYears.SelectedItem.Text.ToString();
            obj.Name = txtRotarian.Text.ToString();
            obj.ClubName = txtClubName.Text.ToString();
            obj.Designation = ddlDesignation.SelectedItem.Text.ToString();
            obj.Classfication = txtClassification.Text.ToString();
            obj.Description = txtDescription.Content.ToString();      

            if (Session["RIDGImages"] != null)
                obj.Image = Session["RIDGImages"].ToString();
            else
                obj.Image = "";

            int exe = obj.UpdateRiDgData();
         

            if (exe > 0)
            {
                clear();
                showmsg("Record Updated Successfully", "view_ri_dg_data.aspx");
                //string jv = "<script>alert('Record Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

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
        txtClubName.Text = "";
        txtRotarian.Text = "";
        DDLYears.SelectedIndex = 0;
        txtClassification.Text = "";
        txtDescription.Content = "";
        Session["RIDGImages"] = null;
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
   
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "RIDGImages";
            string fileName = "";
            string ext = "";
            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = fileName.Substring(0, fileName.LastIndexOf("."));
            fileName = fileName + "_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["RIDGImages"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
}

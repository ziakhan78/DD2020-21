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

public partial class admin_add_past_district_gove : System.Web.UI.Page
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
                    GetPastDistrictGove(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void GetPastDistrictGove(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetPastDistGove";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLYears.SelectedItem.Text = dt.Rows[0]["year"].ToString();
            txtRotarian.Text = dt.Rows[0]["rotarian_name"].ToString();
            txtClubName.Text = dt.Rows[0]["club_name"].ToString();
            txtClassification.Text = dt.Rows[0]["classification"].ToString();
            txtData.Content = dt.Rows[0]["description"].ToString();

            string strImg = dt.Rows[0]["img"].ToString();
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

            for (Int32 i = Convert.ToInt32(dt - 1); i >= 1920; i--)
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
                UpdatePastDistrictGove(id);
            }
            else
            {
                AddPasstDistrictGove();
            }
        }
    }

    private void AddPasstDistrictGove()
    {
        try
        {
            string name = "";
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddPast_Distrct_Gove";

            string yrs = DDLYears.SelectedItem.Text.Trim().ToString();
            //string y2 = DDLYears2.SelectedItem.Text.ToString();
            //string yrs = y1 + " - " + y2;
            obj.AddParam("@year", yrs);
            if (chkExpired.Checked)
                name = "Late " + txtRotarian.Text.Trim().ToString();
            else
                name = txtRotarian.Text.Trim().ToString();

            obj.AddParam("@rotarian_name", name);
            obj.AddParam("@club_name", txtClubName.Text.Trim().ToString());
            obj.AddParam("@classification", txtClassification.Text.Trim().ToString());
            obj.AddParam("@description", txtData.Text.Trim().ToString());

             if (Session["RIDGImages"] != null)
                obj.AddParam("@img", Session["RIDGImages"].ToString());
            else
               obj.AddParam("@img", ""); 
           

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

    private void UpdatePastDistrictGove(int id)
    {
        try
        {
            string name = "";
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdatePastDistGove";

            obj.AddParam("@id", id);
            string yrs = DDLYears.SelectedItem.Text.Trim().ToString();
            obj.AddParam("@year", yrs);
            if (chkExpired.Checked)
                name = "Late " + txtRotarian.Text.Trim().ToString();
            else
                name = txtRotarian.Text.Trim().ToString();

            obj.AddParam("@rotarian_name", name);
            obj.AddParam("@club_name", txtClubName.Text.Trim().ToString());
            obj.AddParam("@classification", txtClassification.Text.Trim().ToString());
            obj.AddParam("@description", txtData.Content.ToString());

            if (Session["RIDGImages"] != null)
                obj.AddParam("@img", Session["RIDGImages"].ToString());
            else
                obj.AddParam("@img", ""); 


            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                showmsg("Record Updated Successfully", "view_past_district_gove.aspx");
                //string jv = "<script>alert('Record Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            }
        }
        catch(Exception ex) { }
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
        txtData.Content = "";
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
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select * from past_district_gov_tbl where rotarian_name='" + txtRotarian.Text.Trim().ToString() + "' and year='" + DDLYears.SelectedItem.Text.Trim().ToString() + "' and club_name='" + txtClubName.Text.Trim().ToString() + "'";
                DataTable dt = new DataTable();
                dt = obj.ExecuteTable();
                if(dt.Rows.Count>0)                
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
               // args.IsValid = true;
            }
        }
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

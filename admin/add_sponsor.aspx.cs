using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_sponsor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] != null)
            {
                rfvFile.Enabled = true;

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetSponser(id);
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void GetSponser(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSponser_Dist";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtTitle.Text = dt.Rows[0]["title"].ToString();
           
            string file = dt.Rows[0]["logo"].ToString();
            if (file != "")
            {
                rfvFile.Enabled = false;
                Session["logo"] = file;
            }            
            DDLStatus.SelectedItem.Text = dt.Rows[0]["status"].ToString();
            txtURL.Text = dt.Rows[0]["url"].ToString();
            StartDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString()).ToString("dd-MM-yyyy");
            EndDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString()).ToString("dd-MM-yyyy");
            //StartDate.DbSelectedDate = dt.Rows[0]["start_date"].ToString();
            //EndDate.DbSelectedDate = dt.Rows[0]["end_date"].ToString();
          
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSponser(id);
            }
            else
            {
                AddSponser();
            }
        }
    }

    private void AddSponser()
    {

        int maxOrdNo = GetMaxOrdNo();
        string path = "";
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddSponser_Dist";          

            SaveImages img = new SaveImages();
            path = img.AddImages(FileUpload1.PostedFile, "Sponsers_Logo");

            obj.AddParam("@start_date", DateTime.Parse(StartDate.SelectedDate.ToString()));
            obj.AddParam("@end_date", DateTime.Parse(EndDate.SelectedDate.ToString()));
           
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@url", txtURL.Text.ToString());   
            obj.AddParam("@status", DDLStatus.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@logo", path);
            obj.AddParam("@display_order", maxOrdNo + 1); 
                

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private int GetMaxOrdNo()
    {
        int maxOrdNo = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select  max(display_order) as display_order from dist_sponsers_tbl";
        DataTable dt = obj.ExecuteTable();
        maxOrdNo = int.Parse(dt.Rows[0]["display_order"].ToString()); 
        return maxOrdNo;

    }

    private void UpdateSponser(int id)
    {
        string path = "";

        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateSponser_Dist";

            if (FileUpload1.PostedFile != null)
            {
                path = Session["logo"].ToString();
            }
            else
            {
                SaveImages img = new SaveImages();
                path = img.AddImages(FileUpload1.PostedFile, "Sponsers_Logo");
            }         

            obj.AddParam("@id", id);
            obj.AddParam("@start_date", DateTime.Parse(StartDate.SelectedDate.ToString()));
            obj.AddParam("@end_date", DateTime.Parse(EndDate.SelectedDate.ToString()));
            obj.AddParam("@title", txtTitle.Text.ToString());
            obj.AddParam("@url", txtURL.Text.ToString());
            obj.AddParam("@status", DDLStatus.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@logo", path);         

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();

                showmsg("Record has been updated successfully !", "view_sponsors.aspx");
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
        txtURL.Text = "";
        StartDate.Clear();
        EndDate.Clear();     
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
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (fileSize > 512000)
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

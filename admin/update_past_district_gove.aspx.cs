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

public partial class admin_update_past_district_gove : System.Web.UI.Page
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

    private void BindYears()
    {
        try
        {
            for (Int32 i = 1920; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());

            }
            DDLYears.Items.Insert(0, "Year");


        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void UpdatePastDistrictGove(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdatePastDistGove";

            obj.AddParam("@id", id);
            string yrs = DDLYears.SelectedItem.Text.ToString();            
            obj.AddParam("@year", yrs);
            obj.AddParam("@rotarian_name", txtRotarian.Text.ToString());
            obj.AddParam("@club_name", txtClubName.Text.ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                showmsg("Record Updated Successfully", "view_past_district_gove.aspx");
                //string jv = "<script>alert('Record Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            }
        }
        catch { }
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
        }
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
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    private void clear()
    {
        txtClubName.Text = "";
        txtRotarian.Text = "";
        DDLYears.ClearSelection();        
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
}
